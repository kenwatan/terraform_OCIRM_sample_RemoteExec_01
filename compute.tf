resource "tls_private_key" "public_private_key_pair" {
  algorithm   = "RSA"
}

resource "oci_core_instance" "TFInstance" {
  count = "${var.NumInstances}"
  availability_domain = "${var.localAD}"
  compartment_id = "${var.compartment_ocid}"
  display_name = "TFInstance${count.index}"
  shape = "${var.InstanceShape}"

  create_vnic_details {
    subnet_id = "${oci_core_subnet.ExampleSubnet.id}"
    display_name = "primaryvnic"
    assign_public_ip = true
    hostname_label = "tfexampleinstance${count.index}"
  },

  source_details {
    source_type = "image"
    source_id = "${var.InstanceImageOCID[var.region]}"

    # Apply this to set the size of the boot volume that's created for this instance.
    # Otherwise, the default boot volume size of the image is used.
    # This should only be specified when source_type is set to "image".
    #boot_volume_size_in_gbs = "60"
  }

  # Apply the following flag only if you wish to preserve the attached boot volume upon destroying this instance
  # Setting this and destroying the instance will result in a boot volume that should be managed outside of this config.
  # When changing this value, make sure to run 'terraform apply' so that it takes effect before the resource is destroyed.
  #preserve_boot_volume = true

   extended_metadata {
    ssh_authorized_keys = "${tls_private_key.public_private_key_pair.public_key_openssh}"
  }
  timeouts {
    create = "60m"
  }
}

resource "null_resource" "remote-exec" {
  depends_on = ["oci_core_instance.TFInstance"]
  
  provisioner "remote-exec" {
    connection {
      agent       = false
      timeout     = "30m"
      host        = "${oci_core_instance.TFInstance.public_ip}"
      user        = "${var.opc_user_name}"
      private_key = "${tls_private_key.public_private_key_pair.private_key_pem}"
    }
  
    inline = [
      "touch ~/IMadeAFile.Right.Here"
    ]
  }
}
