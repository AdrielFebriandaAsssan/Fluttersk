// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, unused_import, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

    final List<String> names = ["Anang Latex", "Agus Spakbor", "Supreme Cahya Purnama", "Rizky Redbull", 
      "Maulana Mclaren", "Bambang BMW", "Galih Gucchi", "Listy Luis Vitton", "Kadek Koenigsegg", "Fikri Pagani", "Andi Andretti"];
    

  @override
  Widget build(BuildContext context) {
      return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          children: [
            const Image(
              image: AssetImage("assets/Tarantula.jpeg"),
              fit: BoxFit.cover,
              height: 250,
              width: double.infinity,
            //Container(
              //height: 250,
              //color: const Color.fromARGB(255, 235, 219, 255),
                //decoration: BoxDecoration(
                  //image: DecorationImage(
                  //image: AssetImage("assets/Tarantula.jpeg"),
                  //fit: BoxFit.cover,
                //),  
              //),
            ),
            Container(
              color: const Color.fromARGB(255, 232, 232, 232),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconButton(
                    icon: Icon(Icons.access_time_outlined, size:50,),
                    onPressed: (){
                      Navigator.pushNamed(
                        context, "/Kartu"
                        );
                    },
                    ),
                    SizedBox(width: 60),

                  IconButton(
                    icon :  Icon(Icons.shopping_cart_checkout, size:50,),
                    onPressed:(){
                      Navigator.pushNamed(context, "/Spring");
                    }, 
                    ),
                    SizedBox(width: 60,),
                  
                  IconButton(
                    icon: Icon(Icons.access_time_sharp, size:50,),
                    onPressed: (){
                      Navigator.pushNamed(context, "/Figure");
                    }, 
                    ),
                  
                ],
              ),
            ),
            Expanded(child: Container(
              child: ListView.builder(
                itemCount: names.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(              
                title: Text(names[index]),
                  );
                },
              )
            )
            )
          ],
        ),
      ),
    );
  }
}