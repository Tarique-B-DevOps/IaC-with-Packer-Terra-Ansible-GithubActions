resource "aws_vpc" "tf-vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "Nodejs"
  }
}

#Public Subnet

resource "aws_subnet" "tf-sub" {
  vpc_id                  = aws_vpc.tf-vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "us-east-1a"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "Nodejs-Public"
  }
}
resource "aws_subnet" "tf-sub2" {
  vpc_id                  = aws_vpc.tf-vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "us-east-1e"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "Nodejs-Public2"
  }
}
resource "aws_subnet" "tf-sub3" {
  vpc_id                  = aws_vpc.tf-vpc.id
  cidr_block              = "10.0.4.0/24"
  availability_zone       = "us-east-1d"
  map_public_ip_on_launch = "true"

  tags = {
    Name = "Nodejs-Public3"
  }
}

# Internet Gateway

resource "aws_internet_gateway" "tf-gw" {
  vpc_id = aws_vpc.tf-vpc.id

  tags = {
    Name = "Nodejs-IGW"
  }
}

# Route Table

resource "aws_route_table" "tf-rt-pub" {
  vpc_id = aws_vpc.tf-vpc.id


  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.tf-gw.id
  }
  tags = {
    Name = "Nodejs-RT-Public"
  }
}

# Route Table Subnet Association

resource "aws_route_table_association" "tf-as" {
  subnet_id      = aws_subnet.tf-sub.id
  route_table_id = aws_route_table.tf-rt-pub.id
}


# Private

#Private Subnet

resource "aws_subnet" "tf-sub-priv" {
  vpc_id            = aws_vpc.tf-vpc.id
  cidr_block        = "10.0.0.0/24"
  availability_zone = "us-east-1c"

  tags = {
    Name = "Nodejs-Private"
  }
}

# Route Table

resource "aws_route_table" "tf-rt-priv" {
  vpc_id = aws_vpc.tf-vpc.id

  # in private we dont need IGW route

  tags = {
    Name = "Nodejs-Private"
  }
}

# Route Table Subnet Association
resource "aws_route_table_association" "tf-as-priv" {
  subnet_id      = aws_subnet.tf-sub-priv.id
  route_table_id = aws_route_table.tf-rt-priv.id
}

