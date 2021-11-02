import 'package:dokan1/widget/product_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProductsHomeScreen extends StatelessWidget {
  const ProductsHomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: ProductItem(),
    );
  }
}
