# Terraform Openstack

- Deploy de 3 instâncias
<hr>
- Ajuste as variáveis conforme arquitetura
<hr>
- Importante:

<pre>
resource "openstack_compute_floatingip_v2" "externa" {
  pool = "externa" 		| (Nome da network pública no OpenStack)
  count = "${var.instancia}" 	| (Total de instâncias)
}
</pre>
