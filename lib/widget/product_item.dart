import 'package:dokan1/model/product.dart';
import 'package:dokan1/widget/product_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  const ProductItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prod = Provider.of<ProductsDetails>(context);
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 4 / 3,
      ),
      itemBuilder: (_, i) => ChangeNotifierProvider.value(
        value: prod.getDummyProducts[i],
        child:  const ProductItemWidget(),
      ),
      itemCount: prod.getDummyProducts.length,
    );
  }
}
