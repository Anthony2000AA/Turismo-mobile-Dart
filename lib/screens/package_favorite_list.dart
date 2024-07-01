

import 'package:flutter/material.dart';
import 'package:turismo/dao/package_dao.dart';

class PackageFavoriteList extends StatefulWidget {
  const PackageFavoriteList({super.key});

  @override
  State<PackageFavoriteList> createState() => _PackageFavoriteListState();
}

class _PackageFavoriteListState extends State<PackageFavoriteList> {

  List _packageFavorites = [];
  final _packageDao=  PackageDao();

  initializr() async{
    _packageFavorites = await _packageDao.getFavorites();

    if(mounted){
      setState(() {
        _packageFavorites = _packageFavorites;
        
      });
    }
  }

  @override
  void initState() {
    initializr();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favoritos'),
      ),
      body: ListView.builder(
        itemCount: _packageFavorites.length,
        itemBuilder: (context, index){
          return ListTile(
            title: Text(_packageFavorites[index].nombre),
            leading: Image.network(_packageFavorites[index].imagen),
            subtitle: Text(_packageFavorites[index].descripcion),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: (){
                _packageDao.deletePackage(_packageFavorites[index].idProducto);
                initializr();
              },
            ),
          );
        },
    )
    );
  }
}