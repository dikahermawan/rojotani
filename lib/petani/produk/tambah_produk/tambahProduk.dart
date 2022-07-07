import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rojotani/layout.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:rojotani/Awal/loginPenjual.dart';

class tambahProdukPage extends StatefulWidget {
  @override
  _tambahProdukPageState createState() => _tambahProdukPageState();
}

class _tambahProdukPageState extends State<tambahProdukPage> {
  // File _image;
  String nama, satuan, jenis, deskripsi, penjual_id;
  int harga, stok;
  final _key = new GlobalKey<FormState>();

  Future getPref() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    setState(() {
      penjual_id = preferences.getString('id');
    });
  }

  // Future getImage() async {
  //   var image = await ImagePicker.pickImage(source: ImageSource.gallery);

  //   setState(() {
  //     _image = image;
  //   });
  // }

  Widget title(String text) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w),
      child: Text(text,
          style: TextStyle(
              fontFamily: 'Mulish',
              fontSize: 18.sp,
              fontWeight: FontWeight.w700)),
    );
  }

  Widget titleLandscape(String text) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w),
      child: Text(text,
          style: TextStyle(
              fontFamily: 'Mulish',
              fontSize: 35.sp,
              fontWeight: FontWeight.w700)),
    );
  }

  Widget Input(input, error, nilai) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w),
      child: TextFormField(
        validator: (e) {
          if (e.isEmpty) {
            return error;
          }
        },
        onSaved: (e) => nilai = e,
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: input,
          hintStyle: TextStyle(
            // <-- Change this
            fontSize: 16.sp,
          ),
          // contentPadding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/4)
        ),
      ),
    );
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

  Future<Map<String, dynamic>> tambah() async {
    Uri url = Uri.parse("http://192.168.43.56:8000/api/produk");
    final response = await http.post(url, body: {
      "penjual_id": penjual_id,
      "nama": nama,
      "harga": harga,
      "satuan": satuan,
      "stok": stok,
      "jenis": jenis,
      "deskripsi": deskripsi
    });

    final dataproduk = jsonDecode(response.body) as Map<String, dynamic>;
    // id = data['penjual_id'];
    int value = dataproduk['success'];
    var pesan = dataproduk['message'];
    // var user = data['user'];
    if (value == 1) {
      print(pesan);
      setState(() {
        Navigator.pop(context);
      });
    } else {
      errorSnackBar(context, 'Akun tidak Valid');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getPref();
  }

  Widget InputLandscape(String input) {
    return Padding(
      padding: EdgeInsets.only(left: 16.w),
      child: TextField(
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: input,
          hintStyle: TextStyle(
            // <-- Change this
            fontSize: 30.sp,
          ),
          // contentPadding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/4)
        ),
      ),
    );
  }

  Widget space() {
    return Column(
      children: [
        Divider(
          thickness: 1,
        ),
      ],
    );
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
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    final MediaQueryWidth = MediaQuery.of(context).size.width;

    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;
    return isLandscape
        ? new Scaffold(
            appBar: new AppBar(
              elevation: 3,
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              title: Text(
                'Tambah Produk',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Mulish',
                  color: Colors.black,
                  fontSize: 50.sp,
                ),
              ),
              centerTitle: true,
            ),
            body: Form(
              key: _key,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      Container(
                        color: Colors.grey[200],
                        height: MediaQuery.of(context).size.height * 1.58,
                        width: MediaQuery.of(context).size.width * 0.99,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 20.h,
                            ),
                            // Row(
                            //   children: [
                            //     Padding(
                            //       padding: EdgeInsets.only(left: 15.w),
                            //       child: InkWell(
                            //         // onTap: getImage,
                            //         child: Container(
                            //           height:
                            //               MediaQuery.of(context).size.height *
                            //                   0.2,
                            //           width: MediaQuery.of(context).size.width *
                            //               0.15,
                            //           decoration: BoxDecoration(
                            //               color: Colors.white,
                            //               border: Border.all(
                            //                   width: 1.w,
                            //                   color: Color(0xFF53B175)),
                            //               borderRadius:
                            //                   BorderRadius.circular(5.r)),
                            //           child: _image == null
                            //               ? Column(
                            //                   children: [
                            //                     SizedBox(
                            //                       height: 20.h,
                            //                     ),
                            //                     Icon(
                            //                       Icons.add,
                            //                       size: 70.sp,
                            //                       color: Color(0xFF53B175),
                            //                     ),
                            //                     Text("Gambar",
                            //                         style: TextStyle(
                            //                             fontFamily: 'Mulish',
                            //                             fontSize: 30.sp,
                            //                             fontWeight:
                            //                                 FontWeight.w500)),
                            //                   ],
                            //                 )
                            //               : Center(
                            //                   child: Column(
                            //                     children: [
                            //                       SizedBox(
                            //                         height: 20.h,
                            //                       ),
                            //                       Icon(
                            //                         Icons.image,
                            //                         size: 85.h,
                            //                       ),
                            //                       Text("Diunggah",
                            //                           textAlign:
                            //                               TextAlign.center,
                            //                           style: TextStyle(
                            //                               fontFamily: 'Mulish',
                            //                               fontSize: 25.sp,
                            //                               fontWeight:
                            //                                   FontWeight.w500)),
                            //                     ],
                            //                   ),
                            //                 ),
                            //           // Image.file(_image),
                            //         ),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                            TextField(
                              decoration: InputDecoration(
                                enabledBorder: InputBorder.none,
                                focusedBorder: InputBorder.none,
                                hintText: 'coba',
                                hintStyle: TextStyle(
                                  // <-- Change this
                                  fontSize: 16.sp,
                                ),
                                // contentPadding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/4)
                              ),
                            ),
                            space(),
                            titleLandscape('Nama Produk'),
                            InputLandscape('Masukkan Nama Produk'),
                            space(),
                            titleLandscape('Harga Produk'),
                            InputLandscape(
                              'Masukkan Harga Produk',
                            ),
                            space(),
                            titleLandscape('Satuan Produk'),
                            InputLandscape('Masukkan Satuan Produk'),
                            space(),
                            titleLandscape('Stok Produk'),
                            InputLandscape('Masukkan Stok Produk'),
                            space(),
                            titleLandscape('Jenis Produk'),
                            InputLandscape('Masukkan Jenis Produk'),
                            space(),
                            titleLandscape('Deskripsi Produk'),
                            InputLandscape('Masukkan Deskripsi Produk'),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 75.w,
                          ),
                          Container(
                            width: 200.w,
                            height: 100.h,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Color(0xFF53B175),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                "Simpan",
                                style: TextStyle(
                                  fontFamily: "Mulish",
                                  fontSize: 40.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                    ],
                  ),
                ),
              ),
            ))
        :
        ///////////
        //Potrait
        new Scaffold(
            appBar: new AppBar(
              elevation: 3,
              backgroundColor: Colors.white,
              leading: IconButton(
                icon: Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              title: Text(
                'Tambah Produk',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Mulish',
                  color: Colors.black,
                  fontSize: 22.sp,
                ),
              ),
              centerTitle: true,
            ),
            body: Form(
              key: _key,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.w),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 30.h,
                      ),
                      Container(
                        color: Colors.grey[200],
                        height: MediaQuery.of(context).size.height * 0.83,
                        width: MediaQuery.of(context).size.width * 0.99,
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                height: 10.h,
                              ),
                              // Row(
                              //   children: [
                              //     Padding(
                              //       padding: EdgeInsets.only(left: 15.w),
                              //       child: InkWell(
                              //         // onTap: getImage,
                              //         child: _image == null
                              //             ? Column(
                              //                 children: [
                              //                   Padding(
                              //                     padding: EdgeInsets.only(
                              //                         right: 18.w),
                              //                     child: Container(
                              //                         height:
                              //                             MediaQuery.of(context)
                              //                                     .size
                              //                                     .height *
                              //                                 0.1,
                              //                         width:
                              //                             MediaQuery.of(context)
                              //                                     .size
                              //                                     .width *
                              //                                 0.2,
                              //                         decoration: BoxDecoration(
                              //                             color: Colors.white,
                              //                             border: Border.all(
                              //                                 width: 1.w,
                              //                                 color: Color(
                              //                                     0xFF53B175)),
                              //                             borderRadius:
                              //                                 BorderRadius
                              //                                     .circular(
                              //                                         5.r)),
                              //                         child: Column(
                              //                           children: [
                              //                             SizedBox(
                              //                               height: 10.h,
                              //                             ),
                              //                             Icon(
                              //                               Icons.add,
                              //                               size: 45.sp,
                              //                               color: Color(
                              //                                   0xFF53B175),
                              //                             ),
                              //                             Text("Gambar",
                              //                                 style: TextStyle(
                              //                                     fontFamily:
                              //                                         'Mulish',
                              //                                     fontSize:
                              //                                         18.sp,
                              //                                     fontWeight:
                              //                                         FontWeight
                              //                                             .w500)),
                              //                           ],
                              //                         )
                              //                         // : Image.file(_image),
                              //                         ),
                              //                   ),
                              //                   SizedBox(
                              //                     height: 10.h,
                              //                   ),
                              //                   Text(
                              //                     'Gambar harus diisi',
                              //                     style: TextStyle(
                              //                         color: Color.fromARGB(
                              //                             255, 206, 23, 10),
                              //                         fontFamily: 'Mulish',
                              //                         fontSize: 13.sp),
                              //                   )
                              //                 ],
                              //               )
                              //             : Container(
                              //                 height: MediaQuery.of(context)
                              //                         .size
                              //                         .height *
                              //                     0.1,
                              //                 width: MediaQuery.of(context)
                              //                         .size
                              //                         .width *
                              //                     0.2,
                              //                 decoration: BoxDecoration(
                              //                     color: Colors.white,
                              //                     border: Border.all(
                              //                         width: 1.w,
                              //                         color: Color(0xFF53B175)),
                              //                     borderRadius:
                              //                         BorderRadius.circular(
                              //                             5.r)),
                              //                 child: Center(
                              //                   child: Column(
                              //                     children: [
                              //                       SizedBox(
                              //                         height: 20.h,
                              //                       ),
                              //                       Icon(
                              //                         Icons.image,
                              //                         // size: 45.sp,
                              //                       ),
                              //                       Text("Diunggah",
                              //                           textAlign:
                              //                               TextAlign.center,
                              //                           style: TextStyle(
                              //                               fontFamily:
                              //                                   'Mulish',
                              //                               fontSize: 16.sp,
                              //                               fontWeight:
                              //                                   FontWeight
                              //                                       .w500)),
                              //                     ],
                              //                   ),
                              //                 ),
                              //                 // : Image.file(_image),
                              //               ),
                              //       ),
                              //     ),
                              //   ],
                              // ),
                              space(),
                              title('Nama Produk'),
                              Input('Masukkan Nama Produk',
                                  'Masukkan Nama Produk', nama),
                              space(),
                              title('Harga Produk'),
                              Input('Masukkan Harga Produk',
                                  'Masukkan Harga Produk', harga),
                              space(),
                              title('Satuan Produk'),
                              Input('Masukkan Satuan Produk',
                                  'Masukkan Satuan Produk', satuan),
                              space(),
                              title('Stok Produk'),
                              Input('Masukkan Stok Produk',
                                  'Masukkan Stok Produk', stok),
                              space(),
                              title('Jenis Produk'),
                              Input('Masukkan Jenis Produk',
                                  'Masukkan Jenis Produk', jenis),
                              space(),
                              title('Deskripsi Produk'),
                              Input('Masukkan Deskripsi Produk',
                                  'Masukkan Deskripsi Produk', deskripsi),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                      Row(
                        children: [
                          SizedBox(
                            width: 75.w,
                          ),
                          Container(
                            width: 200.w,
                            height: 55.h,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                backgroundColor: Color(0xFF53B175),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                              ),
                              onPressed: () {
                                check();
                              },
                              child: Text(
                                "Simpan",
                                style: TextStyle(
                                  fontFamily: "Mulish",
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 50.h,
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }
}
