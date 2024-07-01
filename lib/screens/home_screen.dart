

import 'package:flutter/material.dart';
import 'package:turismo/screens/package_favorite_list.dart';
import 'package:turismo/screens/package_list_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int _currentIndex= 0;

  final List<Widget> _children = [
    const PackageListScreen(),
    const PackageFavoriteList(),
  ];



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: (index){
          setState(() {
            _currentIndex = index;
          });
        },
        currentIndex: _currentIndex,
        items: const [
          
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Buscar'
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.favorite),
            label: 'Favoritos'
          ),
          
        ],
      ),
    );
    
  }
}