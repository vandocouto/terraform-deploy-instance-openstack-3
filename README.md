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
- count : (count da variável instância, localizada no arquivo default/variables.tf)

<pre>
variable "instancia" {
 default = 3
}
</pre>
- default : (Total de instância)
<hr>
- Deploy:
<pre>
./deploy.sh default plan
./deploy.sh default apply
</pre>


