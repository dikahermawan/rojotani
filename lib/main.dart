import 'package:flutter/material.dart';
import 'package:rojotani/Awal/loginAs.dart';
import 'package:rojotani/Awal/loginPenjual.dart';
import 'package:rojotani/Awal/registerAs.dart';
import 'package:rojotani/pembeli/transaksi/cekOut.dart';
import 'package:rojotani/pembeli/transaksi/pengiriman.dart';
import 'package:rojotani/petani/akun/akunPetani.dart';
import 'package:rojotani/petani/akun/katasandi.dart';
import 'package:rojotani/petani/navPetani.dart';
import 'package:rojotani/petani/produk/katalog.dart';
import 'package:rojotani/petani/produk/tambah_produk/tambahLelang.dart';
import 'package:rojotani/petani/produk/tambah_produk/tambahProduk.dart';
import 'package:rojotani/petani/produk/tambah_produk/tambahProduk.dart';
import 'Awal/registerPelanggan.dart';
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
      home: loginPelangganPage(),
      //homePage()
    );
  }
}
