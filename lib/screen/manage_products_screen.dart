import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ManageProductsScreen extends StatelessWidget {
  const ManageProductsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        centerTitle: true,
        title: Padding(
          padding: const EdgeInsets.only(top: 10.0),
          child: Text(
            'Your Products',
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
                onPressed: () =>
                    Navigator.pushNamed(context, '/AddProductSceen'),
                icon: const Icon(Icons.add)),
          )
        ],
      ),
    );
  }
}
