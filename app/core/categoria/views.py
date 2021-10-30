from django.shortcuts import render
from core.categoria.models import Categoria


def formCategoria(request):
    return render(request,'form_categoria.html')


def categorias(request):
    categorias = Categoria.objects.all()
    return render(request,'all_categoria.html',{'categorias':categorias})