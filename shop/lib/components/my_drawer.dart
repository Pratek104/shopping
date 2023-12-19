import 'package:ecomerse/components/my_list_tile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        children: [
          //Header:Logo
          DrawerHeader(
            child: Center(
              child: Icon(
                Icons.shopping_bag_rounded,
                size: 72,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
            ),
          ),
          const SizedBox(height: 25),
          //shop tile


          //cart tile
          MyListTile(
              text: "Cart",
              icon: Icons.shopping_cart,
              onTap: () {
                //pop drawer first
                Navigator.pop(context);
                //go to cart page
                Navigator.pushNamed(context, '/cart_page');
              }
          ),

          //exit shop tile
          MyListTile(
              text: "Exit",
              icon: Icons.exit_to_app,
              onTap: () => Navigator.pushNamedAndRemoveUntil(
                  context, "/intro_page"  , (route) => false),
          ),
        ],
      ),
    );
  }
}
