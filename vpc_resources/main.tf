provider "aws" {
  region = var.aws_region
}

resource "aws_vpc" "this" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id
  tags = {
    Name = "${var.vpc_name}-igw"
  }
}

resource "aws_subnet" "public" {
  for_each = tomap(var.public_subnets)

  vpc_id                  = aws_vpc.this.id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.availability_zone
  map_public_ip_on_launch = true
  tags = {
    Name = "${var.vpc_name}-public-${each.key}"
  }
}

resource "aws_subnet" "private" {
  for_each = tomap(var.private_subnets)

  vpc_id            = aws_vpc.this.id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone
  tags = {
    Name = "${var.vpc_name}-private-${each.key}"
  }
}

resource "aws_eip" "nat" {
  for_each = tomap(var.nat_gateways)

  vpc = true
  tags = {
    Name = "${var.vpc_name}-nat-${each.key}"
  }
}

resource "aws_nat_gateway" "this" {
  for_each = tomap(var.nat_gateways)

  allocation_id = aws_eip.nat[each.key].id
  subnet_id     = aws_subnet.public[each.value.subnet].id
  tags = {
    Name = "${var.vpc_name}-nat-${each.key}"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name = "${var.vpc_name}-public-route"
  }
}

resource "aws_route_table_association" "public" {
  for_each = tomap(var.public_subnets)

  subnet_id      = aws_subnet.public[each.key].id
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table" "private" {
  for_each = tomap(var.private_subnets)

  vpc_id = aws_vpc.this.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.this[each.value.nat_gateway].id
  }

  tags = {
    Name = "${var.vpc_name}-private-${each.key}-route"
  }
}

resource "aws_route_table_association" "private" {
  for_each = tomap(var.private_subnets)

  subnet_id      = aws_subnet.private[each.key].id
  route_table_id = aws_route_table.private[each.key].id
}
