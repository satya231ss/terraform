#vpc creation
resource "aws_vpc" "vpc" {
  cidr_block = "10.0.0.0/16"
  tags = {
    Name = "mycustvpc"
  }
}
#subnet 
resource "aws_subnet" "subnet" {
  vpc_id = aws_vpc.vpc.id
  cidr_block = "10.0.0.0/24"
  availability_zone = "us-east-1a"
  tags = {
    Name = "testsubnet"
  }
}

#IG
resource "aws_internet_gateway" "ig" {
    vpc_id = aws_vpc.vpc.id
    tags = {
      Name = "myig"
    }
}
#Route table,edit routes
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.ig.id
  }
  tags = {
    Name = "myrt"
  }
}
#subnet association
resource "aws_route_table_association" "association" {
  subnet_id = aws_subnet.subnet.id
  route_table_id = aws_route_table.rt.id
}
#SG group
resource "aws_security_group" "SG" {
    name = "allow"
    vpc_id = aws_vpc.vpc.id
    tags = {
        Name = "mySG"
    }
    ingress {
        description = "ENABLE SSH"
        from_port   =  22
        to_port     =  22
        protocol    =  "TCP"  
        cidr_blocks =  ["0.0.0.0/0"]
    }
    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
    }
}
#Nat
resource "aws_nat_gateway" "example" {
  subnet_id     = aws_subnet.subnet.id
  connectivity_type  = "private"

  tags = {
    Name = "gw NAT"
  }

  # To ensure proper ordering, it is recommended to add an explicit dependency
  # on the Internet Gateway for the VPC.
}

#ec2 creation
resource "aws_instance" "ec2" {
ami = "ami-05ffe3c48a9991133"
instance_type = "t3.micro"
subnet_id = aws_subnet.subnet.id
vpc_security_group_ids = [aws_security_group.SG.id]

}