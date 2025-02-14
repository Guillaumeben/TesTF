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
