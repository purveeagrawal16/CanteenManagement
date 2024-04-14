import 'package:flutter/material.dart';
import 'foodtile.dart';
import 'package:provider/provider.dart';
import '../Models/Food_item.dart';

class Bflist extends StatefulWidget {
  String category;
  Bflist({required this.category});

  @override
  State<Bflist> createState() => _BflistState();
}

class _BflistState extends State<Bflist> {
  @override
  Widget build(BuildContext context) {
    final fdl = Provider.of<List<Food_item?>>(context);
    for (var a in fdl) {
      print(a);
    }
    return ListView.builder(
      itemCount: fdl.length,
      itemBuilder: (context, index) {
        return Center(
            child: Foodtile(
          item: fdl[index]?.name ?? "none",
          price: fdl[index]?.price ?? 0,
          qnty: fdl[index]?.qnty ?? 0,
          categ: widget.category,
        ));
      },
    );
  }
}
