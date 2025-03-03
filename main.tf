module "runtime-dna-test-bucket" {
  source        = "git::https://github.com/DataDog/cloud-inventory//terraform-modules/gcp-bucket?ref=gcp-bucket_v0.10.0"
  bucket_name   = "runtime-dna-test-bucket-2"
  repository    = "runtime-dna"
  team          = "fabric-edge-ingress"
  location      = "europe-west1"
  storage_class = "STANDARD"
  versioning    = false
  lifecycle_rules = [{
    action = {
      type = "Delete"
    }
    condition = {
      age = 1
    }
  }]
}

resource "google_storage_bucket" "example" {
  name     = "example-bucket-123456" 
  location = "US"

  lifecycle_rule {
    action {
      type = "Delete"
    }

    condition {
      age = 30
    }
  }

  versioning {
    enabled = true
  }

  labels = {
    environment = "sandbox"
    purpose     = "demo"
  }
}

# Example usage of the data http
#data "http" "example_request" {
#  url = "https://example.com/api/data"
#}

#resource "local_file" "example_data" {
#  content  = data.http.example_request.response_body
3  filename = "example_data.json"
#}


# Example usage of the data external
#data "external" "example_command" {
#  program = ["zsh", "ls"]
#}

#resource "local_file" "example_data" {
#  content  = data.external.example_command.result["output"]
#  filename = "example_data.txt"
#}
