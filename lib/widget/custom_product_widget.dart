import 'package:dokan1/model/product.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CustomProductWidget extends StatelessWidget {
  const CustomProductWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var prod = Provider.of<Product>(context);

    return ListTile(
      title: Text(
        prod.title!,
      ),
      leading: CircleAvatar(child: Image.network(prod.imgUrl!)),
      trailing: Row(
        children: [
          IconButton(
            onPressed: () {
              Provider.of<ProductsDetails>(context, listen: false)
                  .removeCustomProd(prod.id!);
            },
            icon: const Icon(
              Icons.delete_outline_rounded,
              color: Colors.red,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.edit_outlined,
              color: Colors.indigo,
            ),
          )
        ],
      ),
    );
  }
}
