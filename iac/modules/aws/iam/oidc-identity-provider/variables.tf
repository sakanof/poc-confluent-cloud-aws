variable "url" {
  type          = string
  description   = "Provider URL."
}

variable "client_ids" {
  type          = list(string)
  description   = "Client IDs."
}

variable "tag_name" {
  type          = string
  description   = "Tag Name."
}
