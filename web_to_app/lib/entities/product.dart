import 'dart:ffi';

class Producto {
  final int idTienda;
  final int idCategoria;
  final int idProducto;
  final String nombre;
  final String descripcion;
  final int estatus;
  final int visible;
  final String imagen;
  final dynamic precioPromocion;
  final int vigenciaPromocion;
  final int numeroExtrasIngredientes;
  final int visitas;
  final int pedidos;
  final String createdBy;
  final String createdAt;
  final String modifiedBy;
  final String modifiedAt;
  final String descCategoria;
  final String imagenCategoria;
  final String whatis;
  final List<Tamanio> tamanos;
  final List<Extra> extras;

  const Producto(
      {required this.idTienda,
      required this.idCategoria,
      required this.idProducto,
      required this.nombre,
      required this.descripcion,
      required this.estatus,
      required this.visible,
      required this.imagen,
      required this.precioPromocion,
      required this.vigenciaPromocion,
      required this.numeroExtrasIngredientes,
      required this.visitas,
      required this.pedidos,
      required this.createdBy,
      required this.createdAt,
      required this.modifiedBy,
      required this.modifiedAt,
      required this.descCategoria,
      required this.imagenCategoria,
      required this.whatis,
      required this.tamanos,
      required this.extras});
}

class Tamanio {
  final int idTamano;
  final int idTienda;
  final int idProducto;
  final String nombre;
  final dynamic precio;

  Tamanio({
    required this.idTamano,
    required this.idTienda,
    required this.idProducto,
    required this.nombre,
    required this.precio,
  });
}

class Extra {
  final int idExtra;
  final int idTamano;
  final dynamic precio;
  final String nombre;
  final int sugerido;
  final List<ExtraPrecio> precios;

  Extra({
    required this.idExtra,
    required this.idTamano,
    required this.precio,
    required this.nombre,
    required this.sugerido,
    required this.precios,
  });
}

class ExtraPrecio {
  final int idTamano;
  final String nombre;
  final dynamic precio;

  ExtraPrecio({
    required this.idTamano,
    required this.nombre,
    required this.precio,
  });
}
