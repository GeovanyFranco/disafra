from django.shortcuts import render
from core.venta.models import Venta


def formVenta(request):
    return render(request,'form_venta.html')


def ventas(request):
    ventas = Venta.objects.all()
    return render(request,'all_ventas.html',{'ventas':ventas})