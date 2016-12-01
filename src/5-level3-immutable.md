# Level 3 - Infrastructure immutable

### Concepts

- Build an image
- Deploy this image
- Change => Rebuild

### Hashicorp

![Just works](images/hashicorp.png)

### Cloudformation

```
  "Parameters": {
    "Region": {
      "Type": "String",
      "Default": "eu-west-1",
      "AllowedValues": ["eu-west-1"],
      "Description": "Region to work with. Only eu-west-1 for now"
    },
    "InstanceType": {
      "Type": "String",
      "Default": "t2.micro",
      "AllowedValues": ["t2.micro", "t2.medium"],
      "Description": "Enter t2.micro or t2.medium. Default is t2.micro"
    },
    "ElasticacheRedisPort": {
      "Type": "Number",
      "Default": 6379,
      "Description": "Redis Elasticache connection port"
    }
    [...]
  },
  "Resources": {
    "sgRedisInbound": {
      "Type": "AWS::EC2::SecurityGroup",
      "Properties": {
        "VpcId": {
          "Ref": "MainVpcId"
        },
        "SecurityGroupIngress": [{
          "IpProtocol": "tcp",
          "FromPort": {"Ref": "ElasticacheRedisPort"},
          "ToPort": {"Ref": "ElasticacheRedisPort"},
          "CidrIp": {"Ref": "SubnetCidrA"}
        }],
        "SecurityGroupEgress": []
      }
    },
    "sgRedisOutbound": {
      "Type": "AWS::EC2::SecurityGroup",
      "Properties": {
        "VpcId": {
          "Ref": "MainVpcId"
        },
        "SecurityGroupIngress": [],
        "SecurityGroupEgress": [{
          "IpProtocol": "tcp",
          "FromPort": {"Ref": "ElasticacheRedisPort"},
          "ToPort": {"Ref": "ElasticacheRedisPort"},
          "CidrIp": {"Ref": "SubnetCidrA"}
        }]
      }
    },
    "sgElbInbound": {
      "Type": "AWS::EC2::SecurityGroup",
      "Properties": {
        "VpcId": {
          "Ref": "MainVpcId"
        },
        "SecurityGroupIngress": [{
          "IpProtocol": "tcp",
          "FromPort": "80",
          "ToPort": "80",
          "CidrIp": {"Ref": "SubnetCidrA"}
        }],
        "SecurityGroupEgress": []
      }
    },
    "ecSubnetGroup": {
      "Type": "AWS::ElastiCache::SubnetGroup",
      "Properties": {
        "CacheSubnetGroupName": { "Fn::Join": ["-", ["connect", {"Ref": "Environment" }, "-elasticache-subnet"]] },
        "SubnetIds": [{"Ref": "SubnetIdA"}]
      }
    },
    "ecRedis": {
      "Type": "AWS::ElastiCache::CacheCluster",
      "Properties":
      {
        "CacheNodeType": "cache.t2.micro",
        "CacheSubnetGroupName": {"Ref": "ecSubnetGroup"},
        "ClusterName": { "Fn::Join": ["-", ["connect", {"Ref": "Environment" }]] },
        "Engine": "redis",
        "EngineVersion": "2.8.24",
        "NumCacheNodes": "1",
        "Port": {"Ref": "ElasticacheRedisPort"},
        "PreferredAvailabilityZone": {"Ref": "SubnetAZA"},
        "VpcSecurityGroupIds": [{"Ref": "sgRedisInbound"}]
      }
    },
    "ec2Instance": {
      "Type": "AWS::EC2::Instance",
      "Properties": {
        "AvailabilityZone": {"Ref": "SubnetAZA"},
        "DisableApiTermination": False,
        "IamInstanceProfile": {"Ref": "IamRole"},
        "ImageId": {"Ref": "AmiId"},
        "InstanceInitiatedShutdownBehavior": "terminate",
        "InstanceType": {"Ref": "InstanceType"},
        "KeyName": {"Ref": "KeyPair"},
        "SecurityGroupIds": [ {"Ref": "sgRedisInbound"}, {"Ref": "sgElbInbound"}],
        "SubnetId": {"Ref": "SubnetIdA"}
      }
```

### Packer

```
{
  "variables": {
    "aws_access_key": "",
    "aws_secret_key": ""
  },
  "builders": [{
    "type": "amazon-ebs",
    "access_key": "{{user `aws_access_key`}}",
    "secret_key": "{{user `aws_secret_key`}}",
    "region": "us-east-1",
    "source_ami": "ami-fce3c696",
    "instance_type": "t2.micro",
    "ssh_username": "ubuntu",
    "ami_name": "packer-example {{timestamp}}"
  }]
}
```

---

```
$ packer build \
    -var 'aws_access_key=YOUR ACCESS KEY' \
    -var 'aws_secret_key=YOUR SECRET KEY' \
    example.json
==> amazon-ebs: amazon-ebs output will be in this color.

==> amazon-ebs: Creating temporary keypair for this instance...
==> amazon-ebs: Creating temporary security group for this instance...
==> amazon-ebs: Authorizing SSH access on the temporary security group...
==> amazon-ebs: Launching a source AWS instance...
==> amazon-ebs: Waiting for instance to become ready...
==> amazon-ebs: Connecting to the instance via SSH...
==> amazon-ebs: Stopping the source instance...
==> amazon-ebs: Waiting for the instance to stop...
==> amazon-ebs: Creating the AMI: packer-example 1371856345
==> amazon-ebs: AMI: ami-19601070
==> amazon-ebs: Waiting for AMI to become ready...
==> amazon-ebs: Terminating the source AWS instance...
==> amazon-ebs: Deleting temporary security group...
==> amazon-ebs: Deleting temporary keypair...
==> amazon-ebs: Build finished.

==> Builds finished. The artifacts of successful builds are:
--> amazon-ebs: AMIs were created:

us-east-1: ami-19601070
```
