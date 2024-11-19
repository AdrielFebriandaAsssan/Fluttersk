// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_import

import 'package:flutter/material.dart';
import 'package:pjsk/pages/Product2.dart';
import 'package:pjsk/pages/Product3.dart';
import 'package:pjsk/pages/home.dart';
import 'package:pjsk/pages/navbar.dart';
import 'package:pjsk/pages/product.dart';
import 'package:pjsk/pages/user.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
      //List<String> names = ["Anang Latex", "Agus Spakbor", "Supreme Cahya Purnama", "Rizky Redbull", 
      //"Maulana Mclaren", "Bambang BMW", "Galih Gucchi", "Listy Luis Vitton", "Kadek Koenigsegg", "Fikri Pagani", "Andi Andretti"];
    return MaterialApp(
      title: "Mukelembembe",
      debugShowCheckedModeBanner: false,
      initialRoute: "/",
      home: Navbar(),
      theme: ThemeData(
        primarySwatch: Colors.amber,
      ),
      routes: {
        "/Kartu":(context) => Product(),
        "/Spring":(context) => Product2(),
        "/Figure":(context) => Product3(),
        "/List":(context) => ProductList(),
        "/User":(context) => UserPage()
      },
    );
  }
}