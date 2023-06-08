terraform {
  required_providers {
    virtualbox = {
      source = "terra-farm/virtualbox"
      version = "0.2.2-alpha.1"
    }
  }
}

resource "virtualbox_vm" "node" {
  count     = 1
  name      = format("node-%02d", count.index + 1)
  image     = "./vm/virtualbox.box" # need to put it to var
  cpus      = 1
  memory    = "1024 mib"

  network_adapter {
    type           = "nat"
  }
  # network_adapter {
  #   type           = "bridged"
  #   host_interface = "eno0"
  # }
}

output "IPAddr" {
  value = element(virtualbox_vm.node.*.network_adapter.0.ipv4_address, 1)
}

# output "IPAddr_2" {
#   value = element(virtualbox_vm.node.*.network_adapter.0.ipv4_address, 2)
# }