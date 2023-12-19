import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../module/product.dart';
import '../module/shop.dart';

class MyProductTile extends StatelessWidget {
  final Product product;
  const MyProductTile({super.key, required this.product});

  //add to cart
  void addToCart(BuildContext context){
    showDialog(context: context,
        builder: (context)=> AlertDialog(
          content: const Text("Want to add this item to the cart?"),
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
             context.read<Shop>().addToCart(product);
             },
              child: const Text("Yes"),
            )
          ],
        ),
    );
  }


  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(25)
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      width: 312,
      child:  Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //product image
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary,
                      borderRadius: BorderRadius.circular(25)
                  ),
                  width: double.infinity,
                  padding: const EdgeInsets.all(24),
                  child:  Image.asset(product.imagePath),
                ),
              ),
              const SizedBox(height: 24),


              // product name
              Text(
                product.name,
                style: const TextStyle(
                    fontWeight:FontWeight.bold,
                    fontSize: 21
                ),
              ),


              //product description
              Text (product.description,
                style:TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary,
                ) ,
              ),
            ],
          ),


          //product price + add to cart button
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('\$${product.price.toStringAsFixed(2)}'),
              //cart button
              Container(


                decoration: BoxDecoration(color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(11),


                ),
                child: IconButton(onPressed: () => addToCart(context),
                    icon: const Icon(Icons.add)),

              )

            ],
          ),
        ],
      ),
    );
  }
}
