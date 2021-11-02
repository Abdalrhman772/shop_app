import 'package:dokan1/model/product.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class ProductDetailsScreen extends StatelessWidget {
  const ProductDetailsScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    var prod =
        Provider.of<ProductsDetails>(context).getDummyProducts.firstWhere(
              (element) => element.id == args['id'],
            );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          prod.title!,
          style: GoogleFonts.tajawal(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Center(
        child: Column(
          children: [
            SizedBox(
                width: double.infinity,
                child: Image.network(prod.imgUrl!, fit: BoxFit.contain)),
            const SizedBox(
              height: 10,
            ),
            Text(
              '${prod.price} \$',
              style: GoogleFonts.tajawal(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Theme.of(context).primaryColor,
              ),
            ),
            Text(
              prod.description!,
              style: GoogleFonts.tajawal(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
