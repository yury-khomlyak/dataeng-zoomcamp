variable "credentials" {
  description = "My Credentials"
  default     = "../creds.json"
}

variable "project" {
  description = "Project"
  default     = "data-eng-zoomcamp-412717"
}

variable "region" {
  description = "Region"  
  default     = "us-east1"
}

variable "location" {
  description = "Project Location"  
  default     = "US"
}

variable "bq_dataset_name" {
  description = "My BigQuery Dataset Name"
  default     = "dataeng_dataset"
}

variable "gcs_bucket_name" {
  description = "My Storage Bucket Name"
  default     = "dataeng_terraform_bucket"
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default     = "STANDARD"
}