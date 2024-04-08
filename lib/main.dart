// import "package:flutter/material.dart";
// import 'package:provider/provider.dart';
// import 'pages/cart.dart';
// import 'pages/store.dart';
// import 'providers/product_provider.dart';

// void main() {
//   runApp(ChangeNotifierProvider(
//     create: (_) => ProductProvider(),
//     child: const MyApp(),
//   ));
// }

// class MyApp extends StatelessWidget {
//   const MyApp({Key? key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Store App',
//       theme: ThemeData(
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
//         useMaterial3: true,
//       ),
//       home: const MyHomePage(title: 'Gregorys Store'),
//     );
//   }
// }

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title});

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _pageIndex = 0;

//   final List<Widget> _pages = [
//     const StoreHome(),
//     const CartHome(),
//   ];

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         title: Text(
//           widget.title,
//           style: const TextStyle(
//             color: Colors.white,
//             fontSize: 24,
//             fontWeight: FontWeight.bold,
//           ),
//           textAlign: TextAlign.center,
//         ),
//       ),
//       body: _pages[_pageIndex],
//       bottomNavigationBar: BottomNavigationBar(
//         currentIndex: _pageIndex,
//         onTap: (index) {
//           setState(() {
//             _pageIndex = index;
//           });
//         },
//         items: const [
//           BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
//           BottomNavigationBarItem(
//             icon: Icon(Icons.shopping_cart),
//             label: 'Cart',
//           ),
//         ],
//       ),
//     );
//   }
// }

import "package:flutter/material.dart";
import 'package:provider/provider.dart';
import 'pages/cart.dart';
import 'pages/store.dart';
import 'providers/product_provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (_) => ProductProvider(),
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Store App',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Gregorys Store'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _pageIndex = 0;

  final List<Widget> _pages = [
    const StoreHome(),
    const CartHome(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
          textAlign: TextAlign.center,
        ),
      ),
      body: _pages[_pageIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _pageIndex,
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
        items: [
          const BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Consumer<ProductProvider>(
              builder: (context, productProvider, child) {
                return Stack(
                  children: [
                    const Icon(
                        Icons.shopping_cart), 
                    if (productProvider.count >
                        0) 
                      Positioned(
                        right: 0,
                        top: 0,
                        child: Container(
                          padding: const EdgeInsets.all(2),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(8),
                          ),
                          constraints: const BoxConstraints(
                            minWidth: 16,
                            minHeight: 16,
                          ),
                          child: Text(
                            productProvider.count
                                .toString(), 
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                  ],
                );
              },
            ),
            label:
                'Cart (${context.watch<ProductProvider>().count})', // Etiqueta del carrito con el conteo
          ),
        ],
      ),
    );
  }
}
