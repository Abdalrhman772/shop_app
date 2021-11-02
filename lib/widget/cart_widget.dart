import 'package:dokan1/model/product.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class CartWidget extends StatelessWidget {
  const CartWidget({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var cartProd = Provider.of<ProductsDetails>(
        context); //to share (productDetails) CLASS data
    var prod = Provider.of<Product>(context); //to share (Product) CLASS data

    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 10, bottom: 2, left: 10, right: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: GoogleFonts.tajawal(
                      fontSize: 35,
                    ),
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            '${cartProd.getTotalPrice.toStringAsFixed(2)} \$',
                            style: GoogleFonts.tajawal(
                              fontSize: 30,
                              // fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                '/OrderScreen',
                                arguments: '${prod.id}',
                              );
                            },
                            child: Text(
                              'Order Now',
                              style: GoogleFonts.tajawal(
                                  fontSize: 22,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.indigo),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          Expanded(
            child: ListView.builder(
              itemBuilder: (_, i) => ChangeNotifierProvider.value(
                value: cartProd.getCartProducts[i],
                child: Card(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ListTile(
                      leading: CircleAvatar(
                        child: Text('${prod.price}'),
                      ),
                      trailing: IconButton(
                        onPressed: () {
                          // Provider.of<ProductsDetails>(context, listen: false)
                          //     .removeFromCart(prod.id!);
                          // prod.isFav = !prod.isFav;
                        },
                        icon: const Icon(Icons.delete),
                        iconSize: 30,
                        color: Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
              itemCount: cartProd.getCartProducts.length,
            ),
          ),
        ],
      ),
    );
  }
}
