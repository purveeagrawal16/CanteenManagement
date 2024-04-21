import 'package:canteen/Provider/Bfastpro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'components/custom_button.dart';
import 'components/product.dart';
import 'package:provider/provider.dart';

class CartScreen extends StatefulWidget {
  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> {
  // const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int cost = 0;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.red,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              "Your cart",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            // Text(
            //   '4 items',
            //   style: Theme.of(context).textTheme.labelMedium,
            // ),
          ],
        ),
      ),
      body: Consumer<Bprovider>(
        builder: (context, value, builder) => Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: value.bordered().length,
                itemBuilder: (context, index) => ProductInfo(
                  name: value.bordered()[index].name!,
                  image: Image.asset(
                    'assets/images/food.jpg',
                    fit: BoxFit.fill,
                    height: 100,
                    width: 100,
                  ),
                  amount: (value.bordered()[index].price!) *
                      (value.bordered()[index].ordval!),
                  qnty: value.bordered()[index].ordval,
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Consumer<Bprovider>(
        builder: (context, value, _) => BottomAppBar(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text.rich(
                TextSpan(
                  text: 'Total:\n',
                  children: [
                    TextSpan(
                        text: '\₹${value.total}',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 26,
                        )),
                  ],
                ),
              ),
              Custombutton(),
            ],
          ),
        ),
      ),
    );
  }
}
