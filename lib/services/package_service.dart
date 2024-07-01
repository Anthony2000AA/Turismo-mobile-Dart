
import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:turismo/models/package.dart';

class PackageService{
  final String baseURL = 'https://dev.formandocodigo.com/ServicioTour/productossitiotipo.php';

  Future <List<Package>> getPackagesBySiteAndType(String site, String type) async {
    final response = await http.get(Uri.parse('$baseURL?sitio=$site&tipo=$type'));
    if(response.statusCode == 200){
      final result = jsonDecode(response.body);
      return result.map<Package>((e) => Package.fromJson(e)).toList();
    }else{
      throw Exception('Error al obtener los paquetes turísticos');
    }
  }
}