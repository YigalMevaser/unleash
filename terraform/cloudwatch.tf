resource "aws_cloudwatch_log_group" "unleash_log_group" {
  name              = "/ecs/unleash"
  retention_in_days = 7

  tags = {
    Name = "unleash_log_group"
  }
}