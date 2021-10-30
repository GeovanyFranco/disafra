from django.shortcuts import render
from core.proveedor.models import Visitador,Proveedor


def formProveedor(request):
    return render(request,'form_proveedor.html')


def formVisitador(request):
    return render(request,'form_visitador.html')


def visitadores(request):
    visitadores = Visitador.objects.all()
    return render(request,'all_visitadores.html',{'visitadores':visitadores})


def proveedores(request):
    proveedores = Proveedor.objects.all()
    return render(request,'all_proveedores.html',{'proveedores':proveedores})