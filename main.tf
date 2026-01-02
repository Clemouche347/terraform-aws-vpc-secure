resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr
  
  tags = merge(
    var.tags,
      {
        Name = "${var.project_name}-vpc"
    }     
  )
}

resource "aws_subnet" "public" {
  vpc_id                  = aws_vpc.this.id
  cidr_block              = var.public_subnet_cidr
  availability_zone       = "${var.aws_region}a"
  map_public_ip_on_launch = true

  tags = merge(
    var.tags,
      {
        Name = "${var.project_name}-public_subnet"
    }     
  )
}


resource "aws_subnet" "private" {
  vpc_id            = aws_vpc.this.id
  cidr_block        = var.private_subnet_cidr
  availability_zone = "${var.aws_region}b"

  tags = merge(
    var.tags,
      {
        Name = "${var.project_name}-private_subnet"
    }     
  )
}


resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.this.id

  tags = merge(
    var.tags,
      {
        Name = "${var.project_name}-igw"
    }     
  )
}
