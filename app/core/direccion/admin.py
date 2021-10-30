from django.contrib import admin
from core.direccion.models import Departamento,Municipio,Direccion


class DepartamentoAdmin(admin.ModelAdmin):
    list_display = ['id_departamento','departamento']
    list_filter = ['departamento']
    list_editable = ['departamento']
    list_per_page = 10
    search_fields = ['departamento']


class MunicipioAdmin(admin.ModelAdmin):
    list_display = ['id_municipio','municipio','departamento']
    list_filter = ['municipio','departamento']
    list_editable = ['municipio']
    list_per_page = 10
    search_fields = ['municipio','departamento']


class DireccionAdmin(admin.ModelAdmin):
    list_display = ['id_direccion','direccion','referencia','municipio']
    list_filter = ['municipio']
    list_editable = ['direccion','referencia']
    list_per_page = 10
    search_fields = ['referencia','direccion','municipio']


admin.site.register(Departamento,DepartamentoAdmin)
admin.site.register(Municipio,MunicipioAdmin)
admin.site.register(Direccion,DireccionAdmin)