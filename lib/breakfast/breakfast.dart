import 'package:flutter/material.dart';
import 'foodtile.dart';

class Bfastpage extends StatelessWidget {
  const Bfastpage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> l1 = ["Poha", "Sandwich", "Wadapav", "Bread pattis"];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Breakfast"),
        centerTitle: true,
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {},
          ),
          SizedBox(
            width: 3,
          )
        ],
      ),
      body: ListView.builder(
          itemCount: l1.length,
          itemBuilder: (context, index) {
            return Foodtile(item: l1[index]);
          }),
    );
  }
}
