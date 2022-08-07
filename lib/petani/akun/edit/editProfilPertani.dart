import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:rojotani/Awal/loginPelanggan.dart';
import 'package:rojotani/Awal/registerAs.dart';
import 'package:rojotani/Awal/dataDiri.dart';
import 'package:http/http.dart' as http;
import 'package:rojotani/petani/navPetani.dart';
import 'package:rojotani/petani/produk/katalog.dart';
import 'package:rojotani/petani/produk/product_card.dart';
import 'package:rojotani/petani/produk/tambah_produk/editLelang.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rojotani/Awal/loginPetani.dart';

class editProfilPetani extends StatefulWidget {
  @override
  State<editProfilPetani> createState() => _editProfilPetaniState();
}

class _editProfilPetaniState extends State<editProfilPetani> {
  bool isHiddenPassword = true;
  String nama, alamat;
  var namaA, alamatA, rekeningA;
  var rekening, penjual_id, dataProduk;
  final _key = new GlobalKey<FormState>();

  errorSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Color.fromARGB(255, 184, 15, 3),
      content: Text(text),
      duration: const Duration(seconds: 3),
    ));
  }

  getDataPenjual() async {
    SharedPreferences localdata = await SharedPreferences.getInstance();
    setState(() {
      penjual_id = localdata.getString('penjual_id');
    });
    Uri url = Uri.parse("http://192.168.43.56:8000/api/editProfilPjl");
    final response = await http.post(url, body: {
      "penjual_id": penjual_id,
    });
    dataProduk = jsonDecode(response.body);
    setState(() {
      namaA = dataProduk['nama'];
      alamatA = dataProduk['alamat'];
      rekeningA = dataProduk['no_rekening'];
    });
  }

  check() {
    final form = _key.currentState;
    if (form.validate()) {
      form.save();
      update();
    }
  }

  update() async {
    Uri url = Uri.parse("http://192.168.43.56:8000/api/profilPenjual");
    final response = await http.post(url, body: {
      "penjual_id": penjual_id,
      'nama': nama,
      'alamat': alamat,
      'no_rekening': rekening,
    });
    final data = jsonDecode(response.body);
    int value = data['success'];
    var pesan = data['message'];
    if (value == 1) {
      print(pesan);
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => navPetani()),
        );
      });
    } else {
      errorSnackBar(context, 'Produk telah tersedia');
    }
  }

  @override
  void initState() {
    super.initState();
    getDataPenjual();
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
            'Edit Profil',
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
                                    Text('Nama',
                                        style: TextStyle(
                                            fontFamily: 'Mulish',
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w600)),
                                    TextFormField(
                                      controller:
                                          TextEditingController(text: namaA),
                                      validator: (e) {
                                        if (e.isEmpty) {
                                          return 'masukkan username';
                                        }
                                      },
                                      onSaved: (e) => nama = e,
                                      onChanged: (e) {
                                        setState(() {
                                          namaA = e;
                                        });
                                      },
                                      autofocus: false,
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
                                      height: 2.h,
                                    ),
                                    Divider(
                                      thickness: 2,
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Text('Alamat',
                                        style: TextStyle(
                                            fontFamily: 'Mulish',
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w600)),
                                    TextFormField(
                                      validator: (e) {
                                        if (e.isEmpty) {
                                          return 'masukkan alamat';
                                        }
                                      },
                                      onSaved: (e) => alamat = e,
                                      controller:
                                          TextEditingController(text: alamatA),
                                      decoration: InputDecoration(
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        hintText: 'masukkan alamat',
                                        hintStyle: TextStyle(
                                          // <-- Change this
                                          fontSize: 16.sp,
                                        ),
                                        // contentPadding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/4)
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Divider(
                                      thickness: 2,
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),
                                    Text('No. Rekening',
                                        style: TextStyle(
                                            fontFamily: 'Mulish',
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w600)),
                                    TextFormField(
                                      validator: (e) {
                                        if (e.isEmpty) {
                                          return 'masukkan nomor rekening';
                                        }
                                      },
                                      onSaved: (e) => rekening = e,
                                      controller: TextEditingController(
                                          text: rekeningA),
                                      decoration: InputDecoration(
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        hintText: 'masukkan nomor rekening',
                                        hintStyle: TextStyle(
                                          // <-- Change this
                                          fontSize: 16.sp,
                                        ),
                                        // contentPadding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/4)
                                      ),
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Divider(
                                      thickness: 2,
                                    ),
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                  ],
                                ),
                              ),
                            ),
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
                                      'Simpan',
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
