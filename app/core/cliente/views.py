from django.shortcuts import render
from core.cliente.models import Cliente


def formCliente(request):
    return render(request,'form_cliente.html')


def clientes(request):
    clientes = Cliente.objects.all()
    return render(request,'all_clientes.html',{'clientes':clientes})