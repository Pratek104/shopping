import 'package:ecomerse/components/my_drawer.dart';
import 'package:ecomerse/components/product_tile.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../module/shop.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {
    //access product in shop
    final product = context.watch<Shop>().shop;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          foregroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Pratik Shop"),
        ),
        drawer: const MyDrawer(),
        body: ListView(
          children: [
            const SizedBox(height: 25),

            //shop subtitle
            Center(
              child: Text("Picks from Prime products",
              style: TextStyle(color: Theme.of(context).colorScheme.inversePrimary),
              )

            ),
            SizedBox(
              height: 555,
              child: ListView.builder(
                  itemCount: product.length,
                  scrollDirection: Axis.horizontal,

                  padding: const EdgeInsets.all(15),
                  itemBuilder: (context, index) {
                    //get each product from shop
                    final products = product[index];
                    return MyProductTile(product: products);
                  }),
            ),
          ],
        ));
  }
}
