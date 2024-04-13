import 'package:flutter/material.dart';

import '../breakfast/breakfast.dart';

class Categories extends StatelessWidget {
  final String title;
  Categories({required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: 70,
      width: MediaQuery.of(context).size.width / 2 - 30,
      // Divide the screen width equally among 4 containers
      decoration: BoxDecoration(
        // color: Colors.red,
        border: Border.all(color: Colors.red, width: 2),
        borderRadius: const BorderRadius.all(
          Radius.circular(20),
        ),
      ),
      margin: const EdgeInsets.only(left: 5, right: 5),
      child: TextButton(
        onPressed: () {
          // Navigator.push(context,
          //     MaterialPageRoute(builder: (context) {
          //       return Bfastpage();
          //     }));
        },
        child: Text(
          title!,
          style: TextStyle(color: Colors.black, fontSize: 16),
        ),
      ),
    );
  }
}
