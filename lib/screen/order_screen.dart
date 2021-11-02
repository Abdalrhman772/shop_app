import 'package:dokan1/model/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class OrderScreen extends StatelessWidget {
  const OrderScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // var args = ModalRoute.of(context)!.settings.arguments as String;
    // var cartProd =
    //     Provider.of<ProductsDetails>(context).getCartProducts.firstWhere(
    //           (element) => element.id == (args),
    //         );
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            'Orders',
            style: GoogleFonts.tajawal(
              fontSize: 35,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      // body: ListView.builder(
      //         itemBuilder: (_, i) => ChangeNotifierProvider.value(
      //           value: cartProd.getCartProducts[i],
      //           child: Card(
      //             child: Padding(
      //               padding: const EdgeInsets.all(8.0),
      //               child: ListTile(
      //                 leading: CircleAvatar(
      //                   child: Text('${cartProd.price}'),
      //                 ),
      //                 trailing: IconButton(
      //                   onPressed: () {
      //                     // Provider.of<ProductsDetails>(context, listen: false)
      //                     //     .removeFromCart(prod.id!);
      //                     // prod.isFav = !prod.isFav;
      //                   },
      //                   icon: const Icon(Icons.delete),
      //                   iconSize: 30,
      //                   color: Colors.red,
      //                 ),
      //               ),
      //             ),
      //           ),
      //         ),
      //         itemCount: cartProd.getCartProducts.length,
      //       ),
    );
  }
}
