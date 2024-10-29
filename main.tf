resource "kubernetes_cluster_role_v1" "this" {
  for_each = { for key, value in var.kubernetes_groups_cluster_wide : key => value }

  metadata {
    name      = each.value.name
  }

  dynamic "rule" {
    for_each = each.value.role_rules

    content {
      api_groups        = lookup(rule.value, "api_groups", null)
      resources         = lookup(rule.value, "resources", null)
      resource_names    = lookup(rule.value, "resource_names", null)
      non_resource_urls = lookup(rule.value, "non_resource_urls", null)
      verbs             = lookup(rule.value, "verbs", null)
    }
  }
}

resource "kubernetes_cluster_role_binding_v1" "this" {
  for_each = { for key, value in var.kubernetes_groups_cluster_wide : key => value }

  metadata {
    name = each.value.name
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "ClusterRole"
    name      = each.value.name
  }

  dynamic "subject" {
    for_each = each.value.subject

    content {
      kind     = lookup(subject.value, "kind", null)
      name      = lookup(subject.value, "name", null)
      api_group = lookup(subject.value, "api_group", null)
    }
  }
}



resource "kubernetes_role_v1" "this" {
  for_each = { for key, value in var.kubernetes_groups_namespaced : key => value }

  metadata {
    name      = each.value.name
    namespace = each.value.namespace
  }

  dynamic "rule" {
    for_each = each.value.role_rules

    content {
      api_groups     = lookup(rule.value, "api_groups", null)
      resources      = lookup(rule.value, "resources", null)
      resource_names = lookup(rule.value, "resource_names", null)
      verbs          = lookup(rule.value, "verbs", null)
    }
  }
}

resource "kubernetes_role_binding_v1" "this" {
  for_each = { for key, value in var.kubernetes_groups_namespaced : key => value }

  metadata {
    name      = each.value.name
    namespace = each.value.namespace
  }

  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = each.value.name
  }

  dynamic "subject" {
    for_each = each.value.subject

    content {
      kind     = lookup(subject.value, "kind", null)
      name      = lookup(subject.value, "name", null)
      api_group = lookup(subject.value, "api_group", null)
    }
  }
}
