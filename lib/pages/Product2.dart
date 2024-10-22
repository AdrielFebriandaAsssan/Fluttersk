// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers

import 'package:flutter/material.dart';

class Product2 extends StatelessWidget {
  const Product2({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,
    home: Scaffold(
      backgroundColor: Colors.white,
      body: Column(
          children: [
            const Image(
              image: AssetImage("assets/m4a1.jpeg"),
              fit: BoxFit.cover,
              height: 250,
              width: double.infinity,
            ),
            Expanded(
              child: Center (
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushNamedAndRemoveUntil(context, "/", (route) => false);
                  },
                    child: Text("Kembali"),
                )
              )
            )
          ],
        ),
      ),
      );
  }
}