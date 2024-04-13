import 'package:canteen/Models/Food_item.dart';
import 'package:canteen/breakfast/foodlist.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'foodtile.dart';
import '../services/firestorefunc.dart';

class Bfastpage extends StatelessWidget {
  final String category;
  Bfastpage({required this.category});

  @override
  Widget build(BuildContext context) {
    final List<String> l1 = ["Poha", "Sandwich", "Wadapav", "Bread pattis"];

    return StreamProvider<List<Food_item?>>.value(
      initialData: [],
      value: fooddata(dbname: category).fdlist,
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(category.toUpperCase()),
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
        body: Bflist(category: this.category,),
      ),
    );
  }
}
