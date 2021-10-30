from django.shortcuts import render
from core.compra.models import Compra


def formCompra(request):
    return render(request,'form_compra.html')


def compras(request):
    compras = Compra.objects.all()
    return render(request,'all_compras.html',{'compras':compras})