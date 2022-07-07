import 'package:flutter/material.dart';
import 'package:rojotani/pembeli/produk/dashboard.dart';
import 'package:rojotani/pembeli/transaksi/pengiriman.dart';

import 'akun/akunPetani.dart';

class navPembeli extends StatefulWidget {
  @override
  _navPembeliState createState() => _navPembeliState();
}

class _navPembeliState extends State<navPembeli> {
  int currentIndex = 0;
  final List<Widget> body = [homePage(), pengirimanPage(), akunPembeli()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: body[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        selectedItemColor: Colors.grey,
        currentIndex: currentIndex,
        onTap: (value) {
          setState(() {
            currentIndex = value;
          });
        },
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.home,
                color: Colors.black,
              ),
              label: 'Home',
              activeIcon: Icon(
                Icons.home,
                color: Color(0xFF53B175),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.article_rounded,
                color: Colors.black,
              ),
              label: 'Transaksi',
              activeIcon: Icon(
                Icons.article_rounded,
                color: Color(0xFF53B175),
              )),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.person,
                color: Colors.black,
              ),
              label: 'Akun',
              activeIcon: Icon(
                Icons.person,
                color: Color(0xFF53B175),
              )),
        ],
      ),
    );
  }
}
