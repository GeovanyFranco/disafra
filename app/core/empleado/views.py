from django.shortcuts import render
from core.empleado.models import Empleado


def formEmpleado(request):
    return render(request,'form_empleado.html')


def empleados(request):
    empleados = Empleado.objects.all()
    return render(request,'all_empleados.html',{'empleados':empleados})