import 'package:flipkar_new/home_page.dart';
import 'package:flutter/material.dart';

import 'account_page.dart';
import 'cart_page.dart';
import 'notificaions_page.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

class _CategoryPageState extends State<CategoryPage> {
  int currentIndex = 1;

  int selectedIndex = 0;

  void onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            color: Colors.white,
            height: 630,
            width: 360,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Category",
                    style: TextStyle(
                        fontSize: 50,
                        fontStyle: FontStyle.normal,
                        color: Colors.black)),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black54,
        selectedFontSize: 11,
        unselectedFontSize: 11,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const HomePage(),
                    ));
              },
              icon: const Icon(Icons.home),
              padding: const EdgeInsets.only(top: 24),
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CategoryPage(),
                    ));
              },
              icon: const Icon(Icons.category_outlined),
              padding: const EdgeInsets.only(top: 24),
            ),
            label: 'Category',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const NotificationsPage(),
                    ));
              },
              icon: const Icon(Icons.notifications),padding:const EdgeInsets.only(top: 24),
            ),
            label: 'notifications',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const AccountPage(),
                    ));
              },
              icon: const Icon(Icons.account_circle_outlined),
              padding: const EdgeInsets.only(top: 24),
            ),
            label: 'Account',
          ),
          BottomNavigationBarItem(
            icon: IconButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const CartPage(),
                    ));
              },
              icon: const Icon(Icons.shopping_cart),
              padding: const EdgeInsets.only(top: 24),
            ),
            label: 'Cart',
          ),
        ],
        currentIndex: 1,
        onTap: onItemTapped,
      ),
    );
  }
}
