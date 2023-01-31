# ecr.tf | Elastic Container Repository

resource "aws_ecr_repository" "app" {
  name = "${var.app_name}"
  tags = {
    Name        = "${var.app_name}"
  }
}

moved {
  from = aws_ecr_repository.aws-ecr
  to   = aws_ecr_repository.app
}
