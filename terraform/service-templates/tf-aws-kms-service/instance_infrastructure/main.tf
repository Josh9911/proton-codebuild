# Configure AWS provider
provider "aws" {
    region = locals.region
}

data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

###########
# KMS Module
###########

module "kms_complete" {
    source = "terraform-aws-modules/kms/aws"
    
    deletion_window_in_days = 7
    description             = "Test key 2"
    enable_key_rotation     = false
    is_enabled              = true
    key_usage               = "ENCRYPT_DECRYPT"
    multi_region            = false

    # Policy 
    enable_default_policy   = true 
    key_owners              = [local.current_identity.arn]
    key_administrators      = [local.current_identity.arn]
    key_users               = [local.current_identity.arn]
    
    # Aliases 
    aliases = ["test_key_2"]
    aliases_use_name_prefix = true 

    # Grants
    grants = {
        lambda = {
            grantee_principal = local.current_identity.arn
            operations = ["Encrypt", "Decrypt", "GenerateDataKey"]
        }
    }
}
