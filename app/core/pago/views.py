from django.shortcuts import render
from core.pago.models import PagoCompra


def formPago(request):
    return render(request,'form_pago.html')


def pagos(request):
    pagos = PagoCompra.objects.all()
    return render(request,'all_pagos.html',{'pagos':pagos})