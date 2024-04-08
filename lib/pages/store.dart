// import "package:flutter/material.dart";
// import "package:provider/provider.dart";

// import "../providers/product_provider.dart";

// class StoreHome extends StatefulWidget {
//   const StoreHome({super.key});

//   @override
//   State<StoreHome> createState() => _StoreHomeState();
// }

// class _StoreHomeState extends State<StoreHome> {
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         children: [
//           Text(context.watch<ProductProvider>().product,
//               style: const TextStyle(fontSize: 30)),
//           ElevatedButton(
//               onPressed: () {
//                 context.read<ProductProvider>().updateProduct(
//                     "Iphone ${context.read<ProductProvider>().count + 1}");
//               },
//               child: const Text('Add to cart')),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/product_provider.dart';

class StoreHome extends StatelessWidget {
  const StoreHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productProvider = context.watch<ProductProvider>();

    return Center(
      child: Column(
        children: [
          ElevatedButton(
            onPressed: () {
              context.read<ProductProvider>().updateProduct("Iphone");
            },
            child: const Text('Add to cart'),
          ),
          ListView.builder(
            shrinkWrap: true,
            itemCount: productProvider.products.length,
            itemBuilder: (context, index) {
              final product = productProvider.products[index];
              return Text(
                product,
                style: const TextStyle(fontSize: 30),
              );
            },
          ),
        ],
      ),
    );
  }
}
