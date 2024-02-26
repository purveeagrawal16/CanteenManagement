import 'package:flutter/material.dart';

class Foodtile extends StatefulWidget {
  final String? item;
  Foodtile({this.item});

  @override
  State<Foodtile> createState() => _FoodtileState();
}

class _FoodtileState extends State<Foodtile> {
  int _counter = 0;

  void _incrementCount() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCount() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                margin: EdgeInsets.all(8),
                child: Image.asset(
                  'assets/images/food.jpg',
                  fit: BoxFit.fill,
                  height: 100,
                  width: 100,
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.item!,
                      style: TextStyle(fontSize: 20),
                    ),
                    const Text(
                      "Available: 20 pcs.",
                      style: TextStyle(fontSize: 15, color: Colors.green),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '\$350',
                          style: TextStyle(fontSize: 20),
                        ),
                        Padding(
                          padding: EdgeInsets.all(6),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              IconButton(
                                onPressed: (){
                                  if(_counter > 0)
                                  {
                                    _decrementCount();
                                  }
                                  else print("Negative");
                                },
                                icon: const Icon(
                                  Icons.remove_circle,
                                  color: Color(0xFFC51F3B),
                                ),
                              ),
                              SizedBox(width: 10),
                              Text("$_counter", style: TextStyle(fontSize: 20)),
                              SizedBox(width: 10),
                              IconButton(
                                onPressed: _incrementCount,
                                icon: Icon(
                                  Icons.add_circle,
                                  color: Color(0xFFC51F3B),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
