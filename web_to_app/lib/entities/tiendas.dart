class Tienda {
  final int idTienda;
  final String logoTienda;
  final String telefono;
  final String giroComercialDesc;
  final int giroComercial;
  final String nombreComercial;
  final String urlPerzonalizada;
  final List<Etiqueta> etiquetas;

  Tienda({
    required this.idTienda,
    required this.logoTienda,
    required this.telefono,
    required this.giroComercialDesc,
    required this.giroComercial,
    required this.urlPerzonalizada,
    required this.etiquetas,
    required this.nombreComercial,
  });
}

class Etiqueta {
  final int idEtiqueta;
  final String nombreEtiqueta;

  Etiqueta({
    required this.idEtiqueta,
    required this.nombreEtiqueta,
  });
}
