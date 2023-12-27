include "root" {
	path = find_in_parent_folders()
}

dependency "cloudwatch" {
    config_path = "../cloudwatch/"
    mock_outputs_merge_strategy_with_state = "shallow"
    mock_outputs_allowed_terraform_commands = ["validate", "plan", "apply", "destroy"]
    mock_outputs = {
        cloudwatch_log_group_name_redis = "/aws/MOCK/redis"
    }
}

dependency "vpc" {
    config_path = "../vpc/"
    mock_outputs_merge_strategy_with_state = "shallow"
    mock_outputs_allowed_terraform_commands = ["validate", "plan", "apply", "destroy"]
    mock_outputs = {
        subnet_ids_private = [
            "MOCK-private-${uuid()}",
            "MOCK-private-${uuid()}",
        ]
    }
}

inputs = {
    subnet_ids_private = dependency.vpc.outputs.subnet_ids_private
}