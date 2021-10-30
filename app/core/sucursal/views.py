from django.shortcuts import render
from core.sucursal.models import Sucursal


def formSucursal(request):
    return render(request,'form_sucursal.html')


def sucursales(request):
    sucursales = Sucursal.objects.all()
    return render(request,'all_sucursales.html',{'sucursales':sucursales})