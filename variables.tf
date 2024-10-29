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
