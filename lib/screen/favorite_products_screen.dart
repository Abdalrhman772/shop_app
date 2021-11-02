import 'package:dokan1/model/product.dart';
import 'package:dokan1/widget/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class FavoriteProductsScreen extends StatelessWidget {
  const FavoriteProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var prod = Provider.of<ProductsDetails>(context).getFav;
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 4 / 3,
      ),
      itemBuilder: (_, i) => ChangeNotifierProvider.value(
        value: prod[i],
        child:  const ProductItemWidget(),
      ),
      itemCount: prod.length,
    );
  }
}
