import 'package:dokan1/model/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ProductItemWidget extends StatefulWidget {
  const ProductItemWidget({Key? key}) : super(key: key);

  @override
  State<ProductItemWidget> createState() => _ProductItemWidgetState();
}

class _ProductItemWidgetState extends State<ProductItemWidget> {
  @override
  Widget build(BuildContext context) {
    var productData = Provider.of<Product>(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        child: GridTile(
          child: GestureDetector(
            onTap: () {
              Navigator.pushNamed(context, '/ProductDetailsScreen', arguments: {
                'id': productData.id,
              });
            },
            child: Image.network(
              productData.imgUrl!,
            ),
          ),
          footer: Container(
            height: 36,
            color: Colors.green.withOpacity(0.9),
            child: GridTileBar(
              leading: IconButton(
                color: Theme.of(context).colorScheme.secondary,
                onPressed: () {
                  setState(() {
                    if (productData.isFav) {
                      //because u r defined it as FALSE
                      Provider.of<ProductsDetails>(context, listen: false)
                          .removeFav(productData.id!);
                    } else {
                      Provider.of<ProductsDetails>(context, listen: false)
                          .addToFav(productData.id!);
                    }
                    productData.isFav = !productData.isFav;
                  });
                },
                icon: productData.isFav
                    ? Icon(
                        Icons.favorite_rounded,
                        color: Colors.red.shade800,
                      )
                    : const Icon(Icons.favorite_border_rounded),
              ),
              title: Center(
                child: Text(
                  productData.title!,
                  // overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                  style: const TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              trailing: IconButton(
                onPressed: () {
                  setState(() {
                    if (productData.inCart) {
                      Provider.of<ProductsDetails>(context, listen: false)
                          .removeFromCart(productData.id!);
                    } else {
                      Provider.of<ProductsDetails>(context, listen: false)
                          .addProdTOCart(productData.id!);
                    }
                    productData.inCart = !productData.inCart;
                  });
                },
                icon: productData.inCart
                    ? const Icon(
                        Icons.shopping_cart_rounded,
                        size: 26,
                        color: Colors.indigo,
                      )
                    : Icon(
                        Icons.add_shopping_cart_rounded,
                        size: 26,
                        color: Theme.of(context).colorScheme.secondary,
                      ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
