// import 'package:flutter/material.dart';

// class ProductProvider with ChangeNotifier {
//   int _count = 1;
//   late String _product;

//   ProductProvider() {
//     _product = "Iphone $_count";
//   }

//   int get count => _count;

//   String get product => _product;

//   void updateProduct(String newProduct) {
//     _count++;
//     _product = newProduct;
//     notifyListeners();
//   }
// }
import 'package:flutter/material.dart';

class ProductProvider with ChangeNotifier {
  final List<String> _products = ['Iphone 1'];
  int _count = 1;

  List<String> get products => _products;

  int get count => _count;

  void updateProduct(String newProduct) {
    _count++;
    _products.add('$newProduct $_count');
    notifyListeners();
  }
}
