output "pipeline_endpoint" {
  description = "A link to the generated CodePipeline"
  value       = "https://${local.region}.console.aws.amazon.com/codesuite/codepipeline/pipelines/${aws_codepipeline.pipeline.id}/view?region=${local.region}"
}
