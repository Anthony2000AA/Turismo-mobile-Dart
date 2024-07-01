

class Package{
  final String idProducto;
  final String nombre;
  final String descripcion;
  final String ubicacin;
  final String imagen;

  Package({ required this.idProducto, required this.nombre, required this.descripcion, required this.ubicacin, required this.imagen});

  Package.fromJson(Map<String, dynamic> json)
    : idProducto = json['idProducto'],
      nombre = json['nombre'],
      descripcion = json['descripcion'],
      ubicacin = json['ubicacin']??'',
      imagen = json['imagen'];
   
  Map<String, dynamic> toMap()  {
    return {
      'idProducto': idProducto,
      'nombre': nombre,
      'descripcion': descripcion,
      'imagen': imagen,
    };
  }


}


class PackageFavorite{
  final String idProducto;
  final String nombre;
  final String descripcion;
  final String ubicacin;
  final String imagen;

  PackageFavorite({ required this.idProducto, required this.nombre, required this.descripcion, required this.ubicacin, required this.imagen});

   
  PackageFavorite.fromMap(Map<String, dynamic> map)
    : idProducto = map['idProducto'],
      nombre = map['nombre'],
      descripcion = map['descripcion'],
      ubicacin = map['ubicacin']??'',
      imagen = map['imagen'];
}