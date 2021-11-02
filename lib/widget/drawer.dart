import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Stack(
          children: [
            Container(
              width: double.infinity,
              height: 150,
              color: Theme.of(context).primaryColor,
            ),
            
            Positioned(
              bottom: 0,
              left: 15,
              child: Text(
                'Menu',
                style: GoogleFonts.tajawal(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        ),
        ListTile(
          onTap: () => Navigator.pushNamed(context, '/'),
          leading: Icon(
            Icons.shopping_bag_rounded,
            size: 30,
            color: Theme.of(context).colorScheme.secondary,
          ),
          title: Text(
            'Shop',
            style: GoogleFonts.tajawal(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        const Divider(
          thickness: 1,
          height: 0,
        ),
        ListTile(
          onTap: () => Navigator.pushNamed(context, '/OrderScreen'),
          leading: Icon(
            Icons.credit_card_rounded,
            size: 30,
            color: Theme.of(context).colorScheme.secondary,
          ),
          title: Text(
            'Order',
            style: GoogleFonts.tajawal(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
        const Divider(
          thickness: 1,
          height: 0,
        ),
        ListTile(
          onTap: () => Navigator.pushNamed(context, '/ManageProductsScreen'),
          leading: Icon(
            Icons.edit_outlined,
            size: 30,
            color: Theme.of(context).colorScheme.secondary,
          ),
          title: Text(
            'Manage Products',
            style: GoogleFonts.tajawal(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ),
      ],
    );
  }
}
