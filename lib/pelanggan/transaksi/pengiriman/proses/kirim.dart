import 'dart:convert';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:async/async.dart';
import 'package:path/path.dart' as path;
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:rojotani/pelanggan/produk/navPembeli.dart';
import 'package:rojotani/petani/navPetani.dart';
import 'package:shared_preferences/shared_preferences.dart';

class kirimPage extends StatefulWidget {
  @override
  State<kirimPage> createState() => _kirimPageState();
}

class _kirimPageState extends State<kirimPage> {
  var cekout_id,
      pembeli_id,
      produk_id,
      data,
      _future,
      status_pesanan = 'diterima',
      pesan,
      btnCol = Color(0xFF53B175),
      fontCol = Colors.white;
  final _key = new GlobalKey<FormState>();

  errorSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Color.fromARGB(255, 184, 15, 3),
      content: Text(text),
      duration: const Duration(seconds: 3),
    ));
  }

  File _imageFile;

// fungsi utuk memaggil data dari tabel cekout dan pembeli
  Future getCekout() async {
    SharedPreferences localId = await SharedPreferences.getInstance();
    setState(() {
      pembeli_id = localId.getString('pembeli_id');
    });
    final String url =
        'http://192.168.43.56:8000/api/status/kirim'; //api menampilkan data  dari cekout id
    final response = await http.post(url, body: {
      "pembeli_id": pembeli_id, // mengirim  id sesuai data yag diminta
    });
    return jsonDecode(response.body);
  }

// fungsi mengambil gambar dari galeri
  _pilihGallery() async {
    var image = await ImagePicker.pickImage(
        source: ImageSource.gallery, maxHeight: 1920.0, maxWidth: 1080.0);
    setState(() {
      _imageFile = image;
    });
  }

  Future getDataCekout(cekout_id) async {
    SharedPreferences cekout = await SharedPreferences.getInstance();
    cekout..setString('cekout_id', cekout_id.toString());
  }

  //fungsi untuk meambahka data berupa gambar dan beberapa data dari pembeli id
  update() async {
    SharedPreferences cekoutdata = await SharedPreferences.getInstance();
    setState(() {
      cekout_id = cekoutdata.getString('cekout_id');
    });
    Uri url = Uri.parse("http://192.168.43.56:8000/api/cekout/status");
    final response = await http.post(url, body: {
      'cekout_id': cekout_id,
      'status_pesanan': status_pesanan,
    });
    final data = jsonDecode(response.body);
    var value = data['success'];
    pesan = data['message'];

    if (value == 1) {
      print(pesan);
      setState(() {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => navPembeli()),
        );
      });
    } else {
      errorSnackBar(context, 'Data sudah di input');
    }
  }

// mengatasi perubahan yang terjadi
  @override
  void initState() {
    super.initState();
    _future = getCekout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
          future: _future,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return Form(
                key: _key,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  margin: EdgeInsets.only(top: 17.sp),
                  decoration: BoxDecoration(
                      //color: Colors.blue,
                      border: Border.all(color: Colors.grey[300], width: 1),
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(
                            10,
                          ),
                          topRight: Radius.circular(10))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 24.w),
                    child: ListView.builder(
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      SizedBox(
                                        height: 20.h,
                                      ),
                                      Container(
                                        width: 95,
                                        height: 95,
                                        child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(5.r),
                                            child: Image.network(
                                              'http://192.168.43.56:8000/img/produk/' +
                                                  snapshot.data[index]
                                                      ['gambar'],
                                              fit: BoxFit
                                                  .fill, // alamat untuk mengambil gambar
                                            )),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 15.w,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        snapshot.data[index]['nama_produk'],
                                        style: TextStyle(
                                            fontFamily: 'Mulish',
                                            fontSize: 20.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        'Jumlah : ' +
                                            snapshot.data[index]['jumlah']
                                                .toString(),
                                        style: TextStyle(
                                            fontFamily: 'Mulish',
                                            fontSize: 18.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.w600),
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      Text(
                                        'Total : Rp. ' +
                                            snapshot.data[index]['total_bayar']
                                                .toString(),
                                        style: TextStyle(
                                            fontFamily: 'Mulish',
                                            fontSize: 18.sp,
                                            color: Color(0xFF53B175),
                                            fontWeight: FontWeight.w600),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                              SizedBox(
                                height: 15.h,
                              ),
                              Divider(
                                thickness: 1,
                              ),
                              Text(
                                'alamat : ' + snapshot.data[index]['alamat'],
                                style: TextStyle(
                                    fontFamily: 'Mulish',
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                'catatan: ' + snapshot.data[index]['catatan'],
                                style: TextStyle(
                                    fontFamily: 'Mulish',
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.w400),
                              ),
                              Divider(
                                thickness: 1,
                              ),
                              SizedBox(
                                height: 6.h,
                              ),
                              SizedBox(
                                height: 28.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 40.w),
                                child: InkWell(
                                  onTap: () {
                                    getDataCekout(snapshot.data[index]['id']);
                                    update();
                                  },
                                  child: Container(
                                    height: 45.h,
                                    width: 251.w,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: Color(0xFF53B175), width: 1),
                                        borderRadius: BorderRadius.circular(5),
                                        color: btnCol),
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Text(
                                            'Terima',
                                            style: TextStyle(
                                                fontFamily: 'Mulish',
                                                fontSize: 16.sp,
                                                fontWeight: FontWeight.w800,
                                                color: fontCol),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(height: 54.h),
                              Divider(
                                thickness: 5,
                                color: Colors.black,
                              )
                            ],
                          );
                        }),
                  ),
                ),
              );
            } else {
              return Center(child: Text('Load......'));
            }
          }),
    );
  }
}
