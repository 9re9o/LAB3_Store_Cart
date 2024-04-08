// import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

// import '../providers/product_provider.dart';

// class CartHome extends StatefulWidget {
//   const CartHome({Key? key}) : super(key: key);

//   @override
//   State<CartHome> createState() => _CartHomeState();
// }

// class _CartHomeState extends State<CartHome> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Text(
//         context.watch<ProductProvider>().product,
//         style: const TextStyle(fontSize: 30),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';

class CartHome extends StatelessWidget {
  const CartHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productProvider = context.watch<ProductProvider>();

    return Center(
      child: ListView.builder(
        itemCount: productProvider.products.length,
        itemBuilder: (context, index) {
          final product = productProvider.products[index];
          return Text(
            product,
            style: const TextStyle(fontSize: 30),
          );
        },
      ),
    );
  }
}
