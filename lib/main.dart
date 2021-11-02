import 'package:dokan1/model/product.dart';
import 'package:dokan1/screen/add_product_screen.dart';
import 'package:dokan1/screen/cart_screen.dart';
import 'package:dokan1/screen/manage_products_screen.dart';
import 'package:dokan1/screen/order_screen.dart';
import 'package:dokan1/screen/product_details_screen.dart';
import 'package:dokan1/screen/tab_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Product(),
        ),
        ChangeNotifierProvider.value(
          value: ProductsDetails(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const TabScreen(),
        theme: ThemeData(
          primaryColor: Colors.greenAccent.shade700,
          colorScheme: ColorScheme.light(
            secondary: Colors.amber.shade300,
          ),
          canvasColor: Colors.green.shade50,
        ),
        routes: {
          '/ProductDetailsScreen': (_) => const ProductDetailsScreen(),
          '/OrderScreen': (_) => const OrderScreen(),
          '/CartScreen': (_) => const CartScreen(),
          '/ManageProductsScreen': (_) => const ManageProductsScreen(),
          '/AddProductSceen': (_) => const AddProductSceen(),
        },
      ),
    );
  }
}
