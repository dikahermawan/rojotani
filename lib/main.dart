import 'package:flutter/material.dart';
import 'package:rojotani/Awal/loginAs.dart';
import 'package:rojotani/Awal/loginPetani.dart';
import 'package:rojotani/Awal/registerAs.dart';
import 'package:rojotani/pelanggan/produk/detail/detailProduk.dart';
import 'package:rojotani/pelanggan/produk/tawar/tawar.dart';
import 'package:rojotani/pelanggan/transaksi/cekOut.dart';
import 'package:rojotani/pelanggan/transaksi/pengiriman.dart';
import 'package:rojotani/petani/akun/akunPetani.dart';
import 'package:rojotani/petani/akun/edit/editProfilPertani.dart';
import 'package:rojotani/petani/akun/katasandi.dart';
import 'package:rojotani/petani/akun/profilPetani.dart';
import 'package:rojotani/petani/navPetani.dart';
import 'package:rojotani/petani/produk/detail/daftarTawar.dart';
import 'package:rojotani/petani/produk/katalog.dart';
import 'package:rojotani/petani/produk/tambah_produk/tambahLelang.dart';
import 'package:rojotani/petani/produk/tambah_produk/tambahProduk.dart';
import 'package:rojotani/petani/produk/tambah_produk/tambahProduk.dart';
import 'Awal/registerPelanggan.dart';
import 'pelanggan/produk/home.dart';
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
      home: daftarTawar(),
      //homePage()
    );
  }
}
