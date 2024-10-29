variable "kubernetes_groups_cluster_wide" {
  description = "Kubernetes group that will grant the cluster wide access."
  type        = any
  default     = []
  }

variable "kubernetes_groups_namespaced" {
  description = "Kubernetes group that will grant the namespaced wide access."
  type        = any
  default     = []
}


### Example of values for above variables #############
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
###################################################
