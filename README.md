# Terraform Openstack

- Deploy de 3 instâncias
<hr>
- Ajuste as variáveis conforme arquitetura
<hr>
- Importante:

<pre>
resource "openstack_compute_floatingip_v2" "externa" {
  pool = "externa"	
  count = "${var.instancia}"
}
</pre>
| (Nome da network pública no OpenStack)
| (Total de instâncias)
