import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Provider/Bfastpro.dart';
import '../Models/bfcart_item.dart';

class Foodtile extends StatefulWidget {
  final String? categ;
  final String? item;
  final int? price;
  final int? qnty;
  Foodtile({this.item, this.price, this.qnty, this.categ});

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
    return Consumer<Bprovider>(
      builder: (context, value, builder) => Card(
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
                      Text(
                        "Available: ${widget.qnty} pcs.",
                        style: TextStyle(fontSize: 15, color: Colors.green),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            '\₹${widget.price}',
                            style: TextStyle(fontSize: 20),
                          ),
                          Padding(
                            padding: EdgeInsets.all(6),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                IconButton(
                                  onPressed: () {
                                    if (_counter > 0) {
                                      _decrementCount();
                                    } else
                                      print("Negative");
                                  },
                                  icon: const Icon(
                                    Icons.remove_circle,
                                    color: Color(0xFFC51F3B),
                                  ),
                                ),
                                SizedBox(width: 10),
                                Text("$_counter",
                                    style: TextStyle(fontSize: 20)),
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
                      ),
                      Padding(
                        padding: EdgeInsets.fromLTRB(120, 0, 0, 0),
                        child: ElevatedButton(
                          onPressed: () {
                            value.add_cart(Bfcart(
                              name: widget.item,
                              price: widget.price,
                              ordval: _counter,
                              category: widget.categ,
                            ));
                            value.total =
                                value.total + (widget.price! * (_counter));
                            print('TOTAL IS =${widget.price! * (_counter)}');
                            setState(() {
                              _counter = 0;
                            });
                          },
                          child: Text(
                            'Add',
                            style: TextStyle(color: Colors.white),
                          ),
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.red,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
