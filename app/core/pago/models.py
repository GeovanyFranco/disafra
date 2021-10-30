from django.db import models
from core.empleado.models import Empleado
from core.compra.models import Compra


class PagoCompra(models.Model):
    num_pago = models.IntegerField(verbose_name='No. pago', db_column='NUM_PAGO', primary_key=True)  # Field name made lowercase.
    descripcion = models.CharField(db_column='DESCRIPCION', max_length=255, blank=True, null=True)  # Field name made lowercase.
    fecha_pago = models.DateField(db_column='FECHA_PAGO')  # Field name made lowercase.
    cantidad_pagada = models.DecimalField(db_column='CANTIDAD_PAGADA', max_digits=7, decimal_places=2)  # Field name made lowercase.
    empleado_cod = models.ForeignKey(Empleado, models.DO_NOTHING, db_column='EMPLEADO_COD', blank=True, null=True)  # Field name made lowercase.
    compra_num = models.ForeignKey(Compra, models.DO_NOTHING, db_column='COMPRA_NUM', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'pago_compra'
        verbose_name = 'Pago de Compra'
        verbose_name_plural = 'Pagos de Compras'