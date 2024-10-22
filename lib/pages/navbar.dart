// ignore_for_file: prefer_const_constructors, prefer_const_constructors_in_immutables, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:pjsk/pages/home.dart';
import 'package:pjsk/pages/product.dart';
import 'package:pjsk/pages/profile.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  int _selectedIndex = 0;
  void _navigationbar(int index){
    setState((){
      _selectedIndex = index;
    });
  }

  final List _pages = [
    HomePage(),
    ProductList(),
    Profile(),
  
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:_pages[_selectedIndex],
      bottomNavigationBar:  BottomNavigationBar(currentIndex: _selectedIndex,
      onTap: _navigationbar,
      items: [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
      BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Setting"),
      BottomNavigationBarItem(icon: Icon(Icons.person_2_rounded), label: "Profile")
      ],),
    );
    
  }
}