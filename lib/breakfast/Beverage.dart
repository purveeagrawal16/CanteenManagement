import 'package:flutter/material.dart';
import 'foodtile.dart';

class Beveragepage extends StatelessWidget {
  const Beveragepage({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> l1 = ["Tea", "Coffee", "Milk"];

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Beverages"),
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
