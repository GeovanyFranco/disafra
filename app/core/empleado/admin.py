from django.contrib import admin
from core.empleado.models import Empleado,Puesto


class PuestoAdmin(admin.ModelAdmin):
    list_display = ['id_puesto','nombre','salario','horario_entrada','horario_salida']
    list_filter = ['salario']
    list_editable = ['salario','horario_entrada','horario_salida']
    list_per_page = 10
    search_fields = ['nombre']


class EmpleadoAdmin(admin.ModelAdmin):
    list_display = ['cod_empleado','pass_field','persona','correo','puesto','sucursal']
    list_filter = ['puesto','sucursal_id']
    list_editable = ['pass_field','correo','puesto','sucursal']
    list_per_page = 10
    search_fields = ['correo','puesto']


admin.site.register(Puesto,PuestoAdmin)
admin.site.register(Empleado,EmpleadoAdmin)