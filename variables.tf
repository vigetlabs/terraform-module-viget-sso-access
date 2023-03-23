variable "saml_metadata" {
  description = "Saml metadata for providers"

  type = object({
    admin     = string
    developer = string
    pm        = string
  })
}

variable "tags" {
  description = "A map of tags to apply to the resources"

  type    = map(string)
  default = {}
}
