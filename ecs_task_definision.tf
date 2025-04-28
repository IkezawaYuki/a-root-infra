
resource "aws_ecs_task_definition" "my_api" {
  family                   = "a-root-task"
  network_mode             = "awsvpc"
  requires_compatibilities = ["FARGATE"]
  cpu                      = 256
  memory                   = 512
  execution_role_arn       = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn            = aws_iam_role.ecs_task_execution_role.arn
  container_definitions = <<EOF
[
    {
        "name": "a-root-api",
        "image": "619977977108.dkr.ecr.ap-northeast-1.amazonaws.com/a-root-backend:latest",
        "portMappings": [
            {
                "containerPort": 8080,
                "hostPort": 8080
            }
        ],
        "environment": [
            {
                "name": "FRONTEND_URL",
                "valueFrom": {
                    "ssmParameter": {
                        "name": "/a-root/frontend_url"
                    }
                }
            },
            {
                "name": "META_CLIENT_ID",
                "valueFrom": {
                    "ssmParameter": {
                        "name": "/a-root/meta_client_id"
                    }
                }
            },
            {
                "name": "DATABASE_USER",
                "valueFrom": {
                    "ssmParameter": {
                        "name": "/a-root/database_user"
                    }
                }
            },
            {
                "name": "DATABASE_PORT",
                "valueFrom": {
                    "ssmParameter": {
                        "name": "/a-root/database_port"
                    }
                }
            },
            {
                "name": "DATABASE_PASSWORD",
                "valueFrom": {
                    "ssmParameter": {
                        "name": "/a-root/database_password"
                    }
                }
            },
            {
                "name": "DATABASE_SCHEME",
                "valueFrom": {
                    "ssmParameter": {
                        "name": "/a-root/database_scheme"
                    }
                }
            },
            {
                "name": "DATABASE_HOST",
                "valueFrom": {
                    "ssmParameter": {
                        "name": "/a-root/database_host"
                    }
                }
            },
            {
                "name": "WORDPRESS_ADMIN_EMAIL",
                "valueFrom": {
                    "ssmParameter": {
                        "name": "/a-root/wordpress_admin_email"
                    }
                }
            },
            {
                "name": "GRAPH_API_URL",
                "valueFrom": {
                    "ssmParameter": {
                        "name": "/a-root/graph_api_url"
                    }
                }
            },
            {
                "name": "SLACK_WEBHOOK_URL",
                "valueFrom": {
                    "ssmParameter": {
                        "name": "/a-root/slack_webhook_url"
                    }
                }
            },
            {
                "name": "RODUT_KEY",
                "valueFrom": {
                    "ssmParameter": {
                        "name": "/a-root/rodut_key"
                    }
                }
            },
            {
                "name": "STRIPE_ENDPOINT_SECRET",
                "valueFrom": {
                    "ssmParameter": {
                        "name": "/a-root/stripe_endpoint_secret"
                    }
                }
            },
            {
                "name": "OPENAI_API_KEY",
                "valueFrom": {
                    "ssmParameter": {
                        "name": "/a-root/openai_api_key"
                    }
                }
            },
            {
                "name": "SENDGRID_API_KEY",
                "valueFrom": {
                    "ssmParameter": {
                        "name": "/a-root/sendgrid_api_key"
                    }
                }
            },
            {
                "name": "FROM_EMAIL",
                "valueFrom": {
                    "ssmParameter": {
                        "name": "/a-root/from_email"
                    }
                }
            },
        ]
    }
]
EOF
}