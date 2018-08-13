# Configure the Docker provider
provider "docker" {
  version = "~> 0.1"
  host    = "unix:///var/run/docker.sock"
}

# Create a container
resource "docker_container" "smeup-provider" {
  image   = "${docker_image.payara-micro.name}"
  restart = "unless-stopped"
  name    = "smeup-provider-fe"

  ports {
    internal = 8080
    external = "${var.external-port}"
  }

  volumes {
    volume_name    = "share_0"
    container_path = "/mnt/share_0"
  }

  volumes {
    volume_name    = "share_1"
    container_path = "/mnt/share_1"
  }

  volumes {
    volume_name    = "share_2"
    container_path = "/mnt/share_2"
  }

  volumes {
    container_path = "/opt/payara/etc/provider"
    host_path      = "/home/smeup/container/smeup-provider-fe/config"
  }

  volumes {
    container_path = "/opt/payara/.Loocup/LOG"
    host_path      = "/home/smeup/container/smeup-provider-fe/log"
  }

  volumes {
    container_path = "/opt/payara/deployments"
    host_path      = "/home/smeup/container/smeup-provider-fe/deployments"
  }
}

resource "docker_image" "payara-micro" {
  name = "payara/micro:5.182"
}

resource "docker_volume" "comuni-gruppo" {
  count       = "${length(var.shares)}"
  driver_opts = "${var.shares[element(keys(var.shares), count.index)]}"
  name        = "${element(keys(var.shares), count.index)}"
}

variable "shares" {
  default = {}
}

variable "external-port" {
  default = "8080"
}
