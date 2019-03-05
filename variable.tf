variable "compartment_ocid" {
	default = "ocid1.compartment.oc1..aaaaaaaawauppvhxfrnt63qzn65nwaacwhzcfrpam4ujyfctvmuf2wzp5aeq"
}

variable "region" {
	default = "us-ashburn-1"
}

variable "opc_user_name" {}

variable "InstanceImageOCID" {
    type = "map"
    default = {
        // See https://docs.us-phoenix-1.oraclecloud.com/images/
        // Oracle-provided image "Oracle-Linux-7.5-2018.10.16-0"
        us-phoenix-1 = "ocid1.image.oc1.phx.aaaaaaaaoqj42sokaoh42l76wsyhn3k2beuntrh5maj3gmgmzeyr55zzrwwa"
        us-ashburn-1 = "ocid1.image.oc1.iad.aaaaaaaageeenzyuxgia726xur4ztaoxbxyjlxogdhreu3ngfj2gji3bayda"
        eu-frankfurt-1 = "ocid1.image.oc1.eu-frankfurt-1.aaaaaaaaitzn6tdyjer7jl34h2ujz74jwy5nkbukbh55ekp6oyzwrtfa4zma"
        uk-london-1 = "ocid1.image.oc1.uk-london-1.aaaaaaaa32voyikkkzfxyo4xbdmadc2dmvorfxxgdhpnk6dw64fa3l4jh7wa"
    }
}

variable "ssh_public_key" {
	default = "ssh-rsa AAAAB3NzaC1yc2EAAAABIwAAAQEA+/WnQBuzxsiOWxzoPrNeAESsROSRhpVuwgefqC0ejgRHYJXZqlx/Y//SUOyNfM8SooOKNaIQ+TVHc0Ct5p+o7+/3SDnBTqYy/jNjsNvkbPP3awqPClOJ7gL82O/o3Ced1ZyOKKEy11JoesUTKvjk6lY8+aGtbsn4hgAIkGdDIFom2fDyW4A9a3ysijXdk5PGd6UDbe/1UvChQkfmdye9kL6mfVlTqdgv+oTnjHA2ZFhHJOAtobmV2vaRWjWEf7eWRNEPsdVG7abzoExRe+JM1nhTiwCqyGu57HIBirHLzfNX9ij5T6ZvaVE9o+AKygKNEjUsmA6Hi6WudnDSvw1JHw== mmarukaw@MMARUKAW-LAP2"
}

# Defines the number of instances to deploy
variable "NumInstances" {
    default = "1"
}

variable "InstanceShape" {
    default = "VM.Standard2.1"
}

# Specifies the Availability Domain
variable "localAD" {
    default = "TGjA:US-ASHBURN-AD-3"
}