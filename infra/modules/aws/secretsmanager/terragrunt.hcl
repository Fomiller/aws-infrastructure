include "root" {
  path = find_in_parent_folders()
}

dependency "kms" {
    config_path = "../kms"
    mock_outputs = {
        kms_key_arn_master = "arn:aws:kms:us-east-1:${get_env("TF_VAR_account_id")}:key/${uuid()}"
    }
}

inputs = {
   kms_key_arn_master = dependency.kms.outputs.kms_key_arn_master 
}

