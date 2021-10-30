from django.shortcuts import render
from core.producto.models import Producto


def formProducto(request):
    return render(request,'form_producto.html')


def productos(request):
    productos = Producto.objects.all()
    return render(request,'all_productos.html',{'productos':productos})