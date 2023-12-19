import 'package:ecomerse/module/product.dart';
import 'package:flutter/cupertino.dart';
class Shop extends ChangeNotifier {
  //product for sale
  final List<Product> _shop =[
    //product 1
    Product(name: 'Product 1',
        price: 55.55,
        description: "This is very good Description",
      //imagePath: imagePath
      imagePath: 'assets/product1.png'

  ),
    //product 2
    Product(name: 'Product 2',
      price: 15.55,
      description: "This is very good Description",
      //imagePath: imagePath
        imagePath: 'assets/product2.png'
    ),
    //product 1
    Product(name: 'Product 3',
      price: 42.55,
      description: "This is very good Description",
      //imagePath: imagePath
        imagePath: 'assets/product3.png'
    ),
    //product 1
    Product(name: 'Product 4',
      price: 100.99,
      description: "This is very good Description",
      //imagePath: imagePath
        imagePath: 'assets/product4.png'
    ),
  ];

  // user cart
List <Product> _cart =[];


  // get product list
List<Product>get shop => _shop;


  //get user cart
List <Product>get cart => _cart;


  //add item to cart
void addToCart(Product item){
  _cart.add(item);
  notifyListeners();
}


  // remove item from cart
void removeFromCart (Product item){
  _cart.remove(item);
  notifyListeners();
}
}





