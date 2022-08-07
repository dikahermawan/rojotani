import 'dart:convert';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:async/async.dart';
import 'package:path/path.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class pesananBayarPage extends StatefulWidget {
  TabController controller;

  pesananBayarPage(this.controller);

  @override
  State<pesananBayarPage> createState() => _pesananBayarPageState();
}

class _pesananBayarPageState extends State<pesananBayarPage> {
  var cekout_id, pembeli_id, produk_id, data, _future;

  errorSnackBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      backgroundColor: Color.fromARGB(255, 184, 15, 3),
      content: Text(text),
      duration: const Duration(seconds: 3),
    ));
  }

  File _image;
  final picker = ImagePicker();

  Future getImageGalery() async {
    var pickedImage = await picker.getImage(source: ImageSource.gallery);
    setState(() {
      _image = File(pickedImage.path);
    });
  }

  Future getCekout() async {
    SharedPreferences localdata = await SharedPreferences.getInstance();
    setState(() {
      cekout_id = localdata.getString('cekout_id');
    });
    final String url =
        'http://192.168.43.56:8000/api/bayar/ambildata'; //api menampilkan data  dari cekout id
    final response = await http.post(url, body: {
      "cekout_id": cekout_id,
      "pembeli_id": pembeli_id,
    });
    return jsonDecode(response.body);
  }

  Future uploadImage() async {
    final uri = Uri.parse("http://192.168.43.56:8000/api/bayar");
    var request = http.MultipartRequest('POST', uri);
    request.fields['cekout_id'] = cekout_id;
    request.fields['pembeli_id'] = pembeli_id;
    var pic = await http.MultipartFile.fromPath("gambar", _image.path);
    request.files.add(pic);
    var response = await request.send();

    if (response.statusCode == 1) {
      print("Image Uploaded");
    } else {
      print("Upload Failed");
    }
  }

  // Future getImageCamera() async {
  // var imageFile = await ImagePicker.pickImage(source: ImageSource.camera);
  // setState(() {
  // _image = imageFile;
  // });
  // }

  // Future getProducts() async {
  // SharedPreferences localdata = await SharedPreferences.getInstance();
  // setState(() {
  // cekout_id = localdata.getString('cekout_id');
  // });
  // final String url =
  // 'http://192.168.43.56:8000/api/bayar/ambildata'; //api menampilkan data produk
  // final response = await http.post(url, body: {
  // "produk_id": produk_id,
  // "pembeli_id": pembeli_id,
  // "cekout_id": cekout_id,
  // });
  // return jsonDecode(response.body);
  // }

  // Future addProduct() async {
  // var stream = new http.ByteStream(DelegatingStream.typed(_image.openRead()));
  // var length = await _image.length();
  // var uri = Uri.parse("http://192.168.43.56:8000/api/bayar");

  // var request = new http.MultipartRequest("POST", uri);

  // var multipartFile = new http.MultipartFile("image", stream, length,
  // filename: basename(_image.path));

  // request.files.add(multipartFile);
  // request.fields['produk_id'] = produk_id;
  // request.fields['pembeli_id'] = pembeli_id;
  // request.fields['cekout_id'] = cekout_id;

  // var respond = await request.send();
  // if (respond.statusCode == 200) {
  // print("Image Uploaded");
  // } else {
  // print("Upload Failed");
  // }
  // }

  getPembeli() async {
    SharedPreferences localId = await SharedPreferences.getInstance();
    setState(() {
      pembeli_id = localId.getString('pembeli_id');
    });
  }

  @override
  void initState() {
    super.initState();
    getPembeli();
    _future = getCekout();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 15.h,
                ),
                Text(
                  'Subtotal + $pembeli_id, $cekout_id',
                  style: TextStyle(
                      fontFamily: 'Mulish',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Text('AD-537513',
                    style: TextStyle(
                        fontFamily: 'Mulish',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400)),
                SizedBox(
                  height: 23.h,
                ),
                Text(
                  'Total Tagihan',
                  style: TextStyle(
                      fontFamily: 'Mulish',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 6.h,
                ),
                Text('Rp 52.000',
                    style: TextStyle(
                        fontFamily: 'Mulish',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w400,
                        color: Colors.orangeAccent)),
                SizedBox(
                  height: 23.h,
                ),
                Text(
                  'Virtual Account',
                  style: TextStyle(
                      fontFamily: 'Mulish',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Container(
                  height: 122.h,
                  width: 326.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300], width: 1),
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Column(
                    children: [
                      Image.asset(
                        'asset/gambar/BSI.png',
                        width: 103.w,
                        height: 55.h,
                      ),
                      Text(
                        '53787898980909',
                        style: TextStyle(
                            fontFamily: 'Mulish',
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 23.h,
                ),
                Text(
                  'Alamat Kirim',
                  style: TextStyle(
                      fontFamily: 'Mulish',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text('Jl. Ikan Sepat No.7 Banyuwangi Jawatimur',
                    style: TextStyle(
                      fontFamily: 'Mulish',
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w400,
                    )),
                SizedBox(
                  height: 28.h,
                ),
                Text(
                  'Unggah Bukti Bayar',
                  style: TextStyle(
                      fontFamily: 'Mulish',
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 10.h,
                ),
                InkWell(
                  onTap: () {
                    getImageGalery();
                  },
                  child: _image == null
                      ? Container(
                          height: 58.h,
                          width: 326.w,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.grey[300], width: 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Unggah Bukti',
                                  style: TextStyle(
                                      fontFamily: 'Mulish',
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Color(0xFF53B175)),
                                ),
                              ],
                            ),
                          ),
                        )
                      : Container(
                          height: 58.h,
                          width: 326.w,
                          decoration: BoxDecoration(
                            border:
                                Border.all(color: Colors.grey[300], width: 1),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Bukti Terunggah',
                                  style: TextStyle(
                                      fontFamily: 'Mulish',
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.w600,
                                      color: Colors.black),
                                ),
                              ],
                            ),
                          ),
                        ),
                ),
                SizedBox(
                  height: 28.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 40.w),
                  child: InkWell(
                    onTap: () {
                      uploadImage();
                    },
                    child: Container(
                      height: 45.h,
                      width: 251.w,
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.grey[300], width: 1),
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xFF53B175)),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Bayar',
                              style: TextStyle(
                                  fontFamily: 'Mulish',
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w600,
                                  color: Colors.white),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 54.h)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
