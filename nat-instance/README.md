
# Prepare an EC2 instances as a NAT

This tool allows to prepare a standard AWS EC2 instance as a NAT, redirecting input traffic from private subnets to an internet gateway. 

For further details, visit the [AWS documentation regarding NAT instances](https://docs.aws.amazon.com/vpc/latest/userguide/VPC_NAT_Instance.html)

# Set up
Just copy the content of the project in your EC2 machine and execute
```
$ install.sh
```

Then, check that the `Source/Destination check` flag is disabled for the EC2 instance... and that's it!