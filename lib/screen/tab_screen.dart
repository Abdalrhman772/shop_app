import 'package:dokan1/model/product.dart';
import 'package:dokan1/screen/favorite_products_screen.dart';
import 'package:dokan1/screen/products_home_screen.dart';
import 'package:dokan1/widget/drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class TabScreen extends StatefulWidget {
  const TabScreen({Key? key}) : super(key: key);

  @override
  _TabScreenState createState() => _TabScreenState();
}

class _TabScreenState extends State<TabScreen> {
  late List<Map<String, dynamic>> _pages;
  int _currentIndex = 0;
  void changeIndex(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  void initState() {
    _pages = [
      {
        'title': 'Dokan  |  دُكان',
        'body': const ProductsHomeScreen(),
      },
      {
        'title': 'Favorite Products',
        'body': const FavoriteProductsScreen(),
      }
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        title: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Text(
            _pages[_currentIndex]['title'],
            style: GoogleFonts.tajawal(
              fontSize: 36,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: IconButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/CartScreen');
                  },
                  icon: const Icon(Icons.shopping_cart_outlined),
                  iconSize: 28,
                ),
              ),
              Positioned(
                top: 12,
                right: 12,
                child: CircleAvatar(
                  radius: 9,
                  backgroundColor: Theme.of(context).colorScheme.secondary,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 2.0),
                    child: Text(
                      '${Provider.of<ProductsDetails>(context).getCartProducts.length}',
                      style: GoogleFonts.tajawal(
                          fontWeight: FontWeight.bold,
                          color: Colors.indigo.shade700),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
      drawer: const Drawer(
        child: DrawerWidget(),
      ),
      body: _pages[_currentIndex]['body'],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: changeIndex,
        backgroundColor: Theme.of(context).primaryColor,
        selectedItemColor: Theme.of(context).colorScheme.secondary,
        unselectedItemColor: Colors.green.shade50,
        selectedIconTheme: const IconThemeData(size: 30),
        selectedFontSize: 17,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        items: const [
          BottomNavigationBarItem(
              icon: Icon(Icons.shopping_bag_rounded), label: 'Shopping'),
          BottomNavigationBarItem(
              icon: Icon(Icons.favorite_rounded), label: 'Favorites'),
        ],
      ),
    );
  }
}
