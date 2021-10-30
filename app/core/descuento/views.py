from django.shortcuts import render
from core.descuento.models import Descuento


def formDescuento(request):
    return render(request,'form_descuento.html')


def descuentos(request):
    descuentos = Descuento.objects.all()
    return render(request,'all_descuentos.html',{'descuentos':descuentos})