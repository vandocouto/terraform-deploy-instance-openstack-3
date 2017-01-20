resource "openstack_compute_floatingip_v2" "externa" {
  pool = "externa"
  count = "${var.instancia}"
}

resource "openstack_compute_instance_v2" "terraform" {
  image_name = "${var.image}"
  flavor_name = "${var.flavor}"
  key_pair = "${var.key_pair}"
  count = "${var.instancia}"
  name = "${format("Docker-Swarm-%02d", (count.index + 1))}"
  floating_ip = "${element(openstack_compute_floatingip_v2.externa.*.address, count.index)}"

  network {
    name = "network_internal"
    uuid = "${var.network_uuid}"
    access_network = true
  }

  security_groups = [
    "${var.security_group}"]

 block_device {
    uuid = "${var.imagem_id}"
    source_type = "image"
    destination_type = "volume"
    boot_index = 0
    volume_size = 50
    delete_on_termination = true
  }

  block_device {
    source_type = "blank"
    destination_type = "volume"
    boot_index = 1
    volume_size = 100
    delete_on_termination = true
  }

  provisioner "remote-exec" {
    connection {
      user = "${var.ssh_user_name}"
      private_key = "${file(var.ssh_key_file)}"
    }

    inline = [
      "sudo sed -i s/'127.0.0.1 localhost'/'127.0.0.1 localhost ${self.name}'/g /etc/hosts",
      "sudo parted /dev/vdb mklabel msdos",
      "sudo parted -a opt /dev/vdb mkpart primary ext4 0% 100%",
      "sudo mkfs.ext4 /dev/vdb1",
      "echo '/dev/vdb1 /storage ext4 defaults 0 0' | sudo tee /etc/fstab",
      "sudo mount -a"
    ]
  }
}
