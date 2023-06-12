package test

import (
	"testing"

	"github.com/gruntwork-io/terratest/modules/aws"
	"github.com/gruntwork-io/terratest/modules/terraform"
)

func TestAwsEc2(t *testing.T) {
	t.Parallel()

	awsRegion := "ap-southeast-1"

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		TerraformDir: "../src",
	})
	defer terraform.Destroy(t, terraformOptions)
	terraform.InitAndApply(t, terraformOptions)
	instance_id := terraform.Output(t, terraformOptions, "instance_id")

	aws.GetPublicIpOfEc2Instance(t, instance_id, awsRegion)
}
