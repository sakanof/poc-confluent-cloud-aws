output "vpc_id" {
  value = aws_vpc.main.id
}

output "public_route_table_id" {
  value = aws_route_table.public.id
}

output "private_route_table_id" {
  value = aws_route_table.private.id
}

output "private_zones_map" {
  description = "Map of AZ name to subnet ID"
  value = zipmap(
    [
      data.aws_availability_zones.azs.zone_ids[0],
      data.aws_availability_zones.azs.zone_ids[1],
      data.aws_availability_zones.azs.zone_ids[2],
    ],
    [
      aws_subnet.private_az1.id,
      aws_subnet.private_az2.id,
      aws_subnet.private_az3.id,
    ]
  )
}

output "public_subnets" {
  value = [
    aws_subnet.public_az1.id,
    aws_subnet.public_az2.id,
    aws_subnet.public_az3.id,
  ]
}

output "private_subnets" {
  value = [
    aws_subnet.private_az1.id,
    aws_subnet.private_az2.id,
    aws_subnet.private_az3.id,
  ]
}

output "public_subnet_az1_id" {
  value = aws_subnet.public_az1.id
}

output "public_subnet_az2_id" {
  value = aws_subnet.public_az2.id
}

output "public_subnet_az3_id" {
  value = aws_subnet.public_az3.id
}

output "private_subnet_az1_id" {
  value = aws_subnet.private_az1.id
}

output "private_subnet_az2_id" {
  value = aws_subnet.private_az2.id
}

output "private_subnet_az3_id" {
  value = aws_subnet.private_az3.id
}
