import pulumi
import pulumi_aws as aws



aws_vpc = aws.ec2.DefaultVpc
allow_SQL = aws.ec2.SecurityGroup("allowSQL",
                                   description = "Allow TCP communication to SQL Server Service",
                                   ingress = [aws.ec2.SecurityGroupIngressArgs(
                                       description = "Allow all TCP requests to 3341",
                                       from_port=3341,
                                       to_port=3341,
                                       protocol="tcp",
                                       cidr_blocks=["0.0.0.0/0"],
                                       ipv6_cidr_blocks=["::/0"],
                                       
                                   )],
                                    egress=[aws.ec2.SecurityGroupEgressArgs(
                                        from_port=0,
                                        to_port=0,
                                        protocol="-1",
                                        cidr_blocks=["0.0.0.0/0"],
                                        ipv6_cidr_blocks=["::/0"],
                                    )],
                                   tags={
                                     "Name": "Allow_SQL",
                                    })

#a RDS Server with MSSQL to provide persistency and store the database
rds = aws.rds.Instance("interview",
                       allocated_storage=20,
                       apply_immediately=1,
                       backup_retention_period=0,
                       engine="sqlserver-ex",
                       engine_version="14.00.3460.9.v1",
                       instance_class="db.t2.micro",
                       parameter_group_name="default.sqlserver-ex-14.0",
                       password="V3ry5tr0ngP455",
                       username="sa",
                       publicly_accessible=1,
                       license_model="license-included",
                       skip_final_snapshot=True,
                       vpc_security_group_ids= [allow_SQL.id],
                       port=3341,
                       )
pulumi.export("RDS_Endpoint",rds.endpoint)
