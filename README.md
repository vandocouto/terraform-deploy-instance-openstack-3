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
- pool  : (Nome da network pública no OpenStack)
- count : (Total de instâncias)
