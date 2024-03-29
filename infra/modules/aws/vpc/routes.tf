resource "aws_route_table" "public" {
  vpc_id = aws_vpc.aws_infra.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.aws_infra.id
  }

  tags = {
    Name = "${title(var.namespace)} public route table"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.aws_infra.id

  # not using b/c of fck-nat
  # route {
  #   cidr_block     = "0.0.0.0/0"
  #   nat_gateway_id = aws_nat_gateway.aws_infra.id
  # }

  tags = {
    Name = "${title(var.namespace)} private route table"
  }
}

resource "aws_route_table_association" "public" {
  count          = length(var.public_subnet_cidrs)
  subnet_id      = element(aws_subnet.public[*].id, count.index)
  route_table_id = aws_route_table.public.id
}

resource "aws_route_table_association" "private" {
  count          = length(var.private_subnet_cidrs)
  subnet_id      = element(aws_subnet.private[*].id, count.index)
  route_table_id = aws_route_table.private.id
}
