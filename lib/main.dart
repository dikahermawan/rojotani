import 'package:flutter/material.dart';
import 'package:rojotani/petani/produk/katalog.dart';
import 'package:rojotani/petani/produk/tambah_produk/tambahLelang.dart';
import 'package:rojotani/petani/produk/tambah_produk/tambahProduk.dart';
import 'pembeli/produk/home.dart';
import 'petani/transaksi/keranjang.dart';
import 'SplashScreen.dart';
import 'Awal/loginPelanggan.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      title: 'RojoTani',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: katalogPage(),
      //homePage()
    );
  }
}
