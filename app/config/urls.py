"""app URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from core.home.views import home
from core.categoria.views import formCategoria,categorias
from core.cliente.views import formCliente,clientes
from core.compra.views import formCompra,compras
from core.cotizacion.views import formCotizacion
from core.descuento.views import formDescuento,descuentos
from core.empleado.views import formEmpleado,empleados
from core.pago.views import formPago,pagos
from core.producto.views import formProducto,productos
from core.proveedor.views import formProveedor,formVisitador,visitadores,proveedores
from core.sucursal.views import formSucursal,sucursales
from core.venta.views import formVenta,ventas


urlpatterns = [
    path('admin/', admin.site.urls),
    path('', home),
    path('categoria/add/', formCategoria),
    path('categoria/', categorias),
    path('cliente/add/', formCliente),
    path('cliente/', clientes),
    path('compra/add/', formCompra),
    path('compra/', compras),
    path('cotizacion/', formCotizacion),
    path('descuento/add/', formDescuento),
    path('descuento/', descuentos),
    path('empleado/add/', formEmpleado),
    path('empleado/', empleados),
    path('pago/add/', formPago),
    path('pago/', pagos),
    path('producto/add/', formProducto),
    path('producto/', productos),
    path('proveedor/add/', formProveedor),
    path('proveedor/', proveedores),
    path('visitador/add/', formVisitador),
    path('visitador/', visitadores),
    path('sucursal/add/', formSucursal),
    path('sucursal/', sucursales),
    path('venta/add/', formVenta),
    path('venta/', ventas),
]
