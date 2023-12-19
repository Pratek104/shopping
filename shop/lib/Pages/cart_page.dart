
import 'package:ecomerse/components/my_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/my_drawer.dart';
import '../module/product.dart';
import '../module/shop.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});
  void removeItemFromCart(BuildContext context , Product product){
    showDialog(context: context,
      builder: (context)=> AlertDialog(
        content: const Text("Want to Remove this item from the cart?"),
        actions: [
          //no button
          MaterialButton(onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          //yes button
          MaterialButton(onPressed: () {
            //pop dialogue
            Navigator.pop(context);
            //add to cart
            context.read<Shop>().removeFromCart(product);
          },
            child: const Text("Yes"),
          )
        ],
      ),
    );
  }
  void payButtonPressed(BuildContext context){
    showDialog(context: context, builder: (context) => const AlertDialog(
      content: Text('Oppss....This app is not connected to your bank'),

    )
    );

  }

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
title: const Text('Cart page'),
        actions: [
          IconButton(onPressed: ()=> Navigator.pushNamed(context, '/shop_page'), icon: const Padding(
            padding: EdgeInsets.only(right: 28.0),
            child: Icon(Icons.home ,
            size: 28,
            ),
          ))
        ],

      ),
      backgroundColor: Theme.of(context).colorScheme.background,
        drawer: const MyDrawer(),
        body: Column(
        children: [
          //cart list
          Expanded(
            child: cart.isEmpty ? const Center(child:Text("You dont have any product in cart..."))
            : ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context , index){
            final item = cart[index];

            return ListTile(
              title: Text(item.name),
              subtitle: Text(item.price.toStringAsFixed(2)),
              trailing: const Icon(Icons.remove),
              onTap: ()=> removeItemFromCart(context , item),
            );
          },
          ),
          ),


      //pay button
          Padding(
            padding: const EdgeInsets.all(58.0),
            child: MyButton(onTap: ()=> payButtonPressed(context), child: const Text("Pay Now")),
          )
      ],
    ),
    );
  }
}
