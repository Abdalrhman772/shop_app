import 'package:dokan1/model/product.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class AddProductSceen extends StatefulWidget {
  const AddProductSceen({Key? key}) : super(key: key);

  @override
  State<AddProductSceen> createState() => _AddProductSceenState();
}

final titleController = TextEditingController();
final priceController = TextEditingController();
final descriptionController = TextEditingController();
final imgController = TextEditingController();

class _AddProductSceenState extends State<AddProductSceen> {
  @override
  Widget build(BuildContext context) {
    var prod = Provider.of<Product>(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            'Add Product',
            style: GoogleFonts.tajawal(
              fontSize: 28,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {
                  Navigator.pop(context, '/ManageProductsScreen');
                  Provider.of<ProductsDetails>(context, listen: false)
                      .addCustomProd(prod.id!, prod.title!, prod.imgUrl!,
                          prod.description!, prod.price);
                  titleController.clear();
                  imgController.clear();
                  priceController.clear();
                  descriptionController.clear();
                },
                icon: const Icon(Icons.save_outlined)),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Title',
                labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
              ),
              cursorColor: Theme.of(context).primaryColor,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: priceController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'Price',
                labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
              ),
              cursorColor: Theme.of(context).primaryColor,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: descriptionController,
              decoration: InputDecoration(
                labelText: 'Description',
                labelStyle: TextStyle(
                  color: Theme.of(context).primaryColor,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
              ),
              cursorColor: Theme.of(context).primaryColor,
            ),
            const SizedBox(
              height: 20,
            ),
            TextField(
              controller: imgController,
              keyboardType: TextInputType.url,
              decoration: InputDecoration(
                labelText: 'image url',
                labelStyle: TextStyle(color: Theme.of(context).primaryColor),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Theme.of(context).primaryColor),
                ),
              ),
              cursorColor: Theme.of(context).primaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
