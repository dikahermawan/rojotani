import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:rojotani/Awal/loginPelanggan.dart';
import 'package:rojotani/Awal/registerAs.dart';
import 'package:rojotani/Awal/dataDiri.dart';
import 'package:http/http.dart' as http;
import 'package:rojotani/petani/produk/katalog.dart';
import 'package:rojotani/petani/produk/product_card.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rojotani/Awal/loginPenjual.dart';

class tambahProduk extends StatefulWidget {
  @override
  State<tambahProduk> createState() => _tambahProdukState();
}

class _tambahProdukState extends State<tambahProduk> {
  bool isHiddenPassword = true;
  String nama, satuan, jenis, deskripsi;
  var harga, stok, penjual_id;
  final _key = new GlobalKey<FormState>();

  VoidCallback get signOut => null;

  getPref() async {
    SharedPreferences localdata = await SharedPreferences.getInstance();
    setState(() {
      penjual_id = localdata.getString('penjual_id');
    });
  }

  errorSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Color.fromARGB(255, 184, 15, 3),
      content: Text(text),
      duration: const Duration(seconds: 3),
    ));
  }

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      tambah();
    }
  }

  tambah() async {
    Uri url = Uri.parse("http://192.168.168.56:8000/api/produk");
    final response = await http.post(url, body: {
      "penjual_id": penjual_id,
      'nama': nama,
      'harga': harga,
      'stok': stok,
      'satuan': satuan,
      'jenis': jenis,
      'deskripsi': deskripsi,
    });
    final data = jsonDecode(response.body);
    int value = data['success'];
    var pesan = data['message'];
    if (value == 1) {
      print(pesan);
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => katalogPage(signOut)),
        );
      });
    } else {
      errorSnackBar(context, 'Produk telah tersedia');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(
        BoxConstraints(
            maxWidth: MediaQuery.of(context).size.width,
            maxHeight: MediaQuery.of(context).size.height),
        designSize: Size(390, 844),
        context: context,
        minTextAdapt: true,
        orientation: Orientation.portrait);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Tambah Produk Coba',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'Mulish',
              color: Colors.black,
              fontSize: 23,
            ),
          ),
          centerTitle: true,
        ),
        body: Form(
          key: _key,
          child: SafeArea(
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            color: Color.fromARGB(255, 221, 219, 219),
                            height: MediaQuery.of(context).size.height * 0.67,
                            //width: MediaQuery.of(context).size.width * 0.6,
                            child: Padding(
                              padding: EdgeInsets.only(left: 26.w),
                              child: SingleChildScrollView(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Text('Nama Produk',
                                        style: TextStyle(
                                            fontFamily: 'Mulish',
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w600)),
                                    TextFormField(
                                      validator: (e) {
                                        if (e.isEmpty) {
                                          return 'masukkan username';
                                        }
                                      },
                                      onSaved: (e) => nama = e,
                                      decoration: InputDecoration(
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        hintText: 'masukkan username',
                                        hintStyle: TextStyle(
                                          // <-- Change this
                                          fontSize: 16.sp,
                                        ),
                                        // contentPadding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/4)
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text('harga Produk',
                                        style: TextStyle(
                                            fontFamily: 'Mulish',
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w600)),
                                    TextFormField(
                                      validator: (e) {
                                        if (e.isEmpty) {
                                          return 'masukkan harga';
                                        }
                                      },
                                      onSaved: (e) => harga = e,
                                      decoration: InputDecoration(
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        hintText: 'masukkan harga',
                                        hintStyle: TextStyle(
                                          // <-- Change this
                                          fontSize: 16.sp,
                                        ),
                                        // contentPadding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/4)
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text('satuan Produk',
                                        style: TextStyle(
                                            fontFamily: 'Mulish',
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w600)),
                                    TextFormField(
                                      validator: (e) {
                                        if (e.isEmpty) {
                                          return 'masukkan satuan';
                                        }
                                      },
                                      onSaved: (e) => satuan = e,
                                      decoration: InputDecoration(
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        hintText: 'masukkan harga',
                                        hintStyle: TextStyle(
                                          // <-- Change this
                                          fontSize: 16.sp,
                                        ),
                                        // contentPadding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/4)
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text('stok Produk',
                                        style: TextStyle(
                                            fontFamily: 'Mulish',
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w600)),
                                    TextFormField(
                                      validator: (e) {
                                        if (e.isEmpty) {
                                          return 'masukkan stok';
                                        }
                                      },
                                      onSaved: (e) => stok = e,
                                      decoration: InputDecoration(
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        hintText: 'masukkan stok',
                                        hintStyle: TextStyle(
                                          // <-- Change this
                                          fontSize: 16.sp,
                                        ),
                                        // contentPadding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/4)
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text('jenis Produk',
                                        style: TextStyle(
                                            fontFamily: 'Mulish',
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w600)),
                                    TextFormField(
                                      validator: (e) {
                                        if (e.isEmpty) {
                                          return 'masukkan jenis';
                                        }
                                      },
                                      onSaved: (e) => jenis = e,
                                      decoration: InputDecoration(
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        hintText: 'masukkan jenis',
                                        hintStyle: TextStyle(
                                          // <-- Change this
                                          fontSize: 16.sp,
                                        ),
                                        // contentPadding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/4)
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text('deskripsi Produk',
                                        style: TextStyle(
                                            fontFamily: 'Mulish',
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w600)),
                                    TextFormField(
                                      validator: (e) {
                                        if (e.isEmpty) {
                                          return 'masukkan deskripsi';
                                        }
                                      },
                                      onSaved: (e) => deskripsi = e,
                                      decoration: InputDecoration(
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        hintText: 'masukkan deskripsi',
                                        hintStyle: TextStyle(
                                          // <-- Change this
                                          fontSize: 16.sp,
                                        ),
                                        // contentPadding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/4)
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 29.h,
                          ),
                          Center(
                            child: Container(
                              width: 317.w,
                              height: 51.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.r),
                                color: Color(0xFF53B175),
                              ),
                              child: Material(
                                color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    check();

                                    // print(penjual_id.toString());
                                  },
                                  child: Center(
                                    child: Text(
                                      'Daftar',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18.sp,
                                          fontFamily: 'Mulish',
                                          fontWeight: FontWeight.w700),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 30.h,
                          ),
                        ]),
                  ))),
        ));
  }
}
