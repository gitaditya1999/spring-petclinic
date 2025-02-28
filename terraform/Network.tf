resource "aws_vpc" "dpvpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name = "tfvpc"
    }
  
}
resource "aws_subnet" "dpsubnet" {
    vpc_id = aws_vpc.dpvpc.id
    cidr_block = "10.0.0.0/24"
    availability_zone = "us-west-2a"
    tags = {
      Name = "tfsubnet"
    }
  
}
resource "aws_internet_gateway" "dp_igw" {
  vpc_id = aws_vpc.dpvpc.id
}

resource "aws_route_table" "dp_rt" {
  vpc_id = aws_vpc.dpvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dp_igw.id
  }
}

resource "aws_route_table_association" "dp_rta" {
  subnet_id      = aws_subnet.dpsubnet.id
  route_table_id = aws_route_table.dp_rt.id
}
