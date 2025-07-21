provider "aws" {
  
}

#rds creation 
resource "aws_db_instance" "main" {
allocated_storage = 10
identifier = "book-rds"
db_name =  "mydb"
engine = "mysql"
engine_version = "8.0"
instance_class = "db.t3.micro"
username = jsondecode(data.aws_secretsmanager_secret_version.rds_credentials.secret_string)["username"]
password = jsondecode(data.aws_secretsmanager_secret_version.rds_credentials.secret_string)["password"]
db_subnet_group_name = aws_db_subnet_group.sub-grp.id
parameter_group_name = "default.mysql8.0"

#ENABLE BACKUP AND RETENTION
backup_retention_period = 7
backup_window ="02:00-03:00"

#Enable monitoring 
#monitoring_interval = 60
#monitoring_role_arn = aws_iam_role_monitoring.arn 

#maintenance window
maintenance_window = "sun:04:00-sun:05:00"

#enable selete protection

#deletion_protection = true

skip_final_snapshot = true

depends_on = [ aws_db_subnet_group.sub-grp ]
  
}

resource "aws_vpc" "myvpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "mycustvpc"
    }
}

resource "aws_subnet" "subnet" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-east-1a"  # for subnet
}

resource "aws_subnet" "devsub" {
    vpc_id = aws_vpc.myvpc.id
    cidr_block = "10.0.1.0/24"
    availability_zone = "us-east-1b"  # for subnet
}

resource "aws_db_subnet_group" "sub-grp" {
  name       = "mysubnet"
  subnet_ids = [aws_subnet.subnet.id, aws_subnet.devsub.id]
  tags = {
    Name = "My RDS subnet group"
  }
}

resource "aws_secretsmanager_secret" "rds_secret" {
  name = "rds-credentials"
}

resource "aws_secretsmanager_secret_version" "rds_secret_version" {
  secret_id     = aws_secretsmanager_secret.rds_secret.id
  secret_string = jsonencode({
    username = "dbadmin"
    password = "rajasatyrajasaty"
  })
}

data "aws_secretsmanager_secret_version" "rds_credentials" {
  secret_id = aws_secretsmanager_secret.rds_secret.id
}
