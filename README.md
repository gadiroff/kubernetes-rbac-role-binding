# kubernetes-rbac-role-binding
Kubernetes cluster role, role and bindings

### Example of variable values

kubernetes_groups_namespaced = [
    {
      name      = "default_namespace_admin"
      namespace = "default"
      role_rules = [
        {
          api_groups = ["*"]
          resources  = ["*"]
          verbs      = ["*"]
        }
      ]
      subject = [
        {
          kind      = "Group"
          name      = "default_namespace_admin"
          api_group = "rbac.authorization.k8s.io"
        }
      ]
    }
  ]
  kubernetes_groups_cluster_wide = [
    {
      name = "cluster_admin"
      role_rules = [
        {
          api_groups        = ["*"]
          resources         = ["*"]
          verbs             = ["*"]
          non_resource_urls = ["*"]
        }
      ]
      subject = [
        {
          kind      = "Group"
          name      = "cluster_admin"
          api_group = "rbac.authorization.k8s.io"
        }
      ]
    }
  ]
