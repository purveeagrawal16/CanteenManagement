import 'package:flutter/material.dart';
import 'components/custom_button.dart';
import 'components/product.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
            Text(
              '4 items',
              style: Theme.of(context).textTheme.labelMedium,
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ProductInfo(
              name: 'Samosa',
              image: Image.asset('assets/images/food.jpg'),
              amount: 12313,
            ),
            const SizedBox(
              height: 10,
            ),
            ProductInfo(
              name: 'Samosa',
              image: Image.asset('assets/images/food.jpg'),
              amount: 12313,
            ),
            const SizedBox(
              height: 10,
            ),
            ProductInfo(
              name: 'Samosa',
              image: Image.asset('assets/images/food.jpg'),
              amount: 12313,
            ),
            const SizedBox(
              height: 10,
            ),
            ProductInfo(
              name: 'Samosa',
              image: Image.asset('assets/images/food.jpg'),
              amount: 12313,
            ),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text.rich(
              TextSpan(
                text: 'Total:\n',
                children: [
                  TextSpan(
                      text: '\$12313',
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
    );
  }
}
