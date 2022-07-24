import 'dart:convert';
import 'dart:io';
import 'package:image_picker/image_picker.dart';
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
import 'package:async/src/delegate/stream.dart';
import 'package:path/path.dart' as path;

class tambahProduk extends StatefulWidget {
  @override
  State<tambahProduk> createState() => _tambahProdukState();
}

class _tambahProdukState extends State<tambahProduk> {
  String nama, satuan, jenis, deskripsi;
  var harga, stok, penjual_id;
  final _key = new GlobalKey<FormState>();

  VoidCallback get signOut => null;

  File image;

  Future getImage() async {
    var _image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      image = _image;
    });
  }

  TextEditingController namaController = TextEditingController();
  TextEditingController hargaController = TextEditingController();
  TextEditingController stokController = TextEditingController();
  TextEditingController satuanController = TextEditingController();
  TextEditingController jenisController = TextEditingController();
  TextEditingController deskripsiController = TextEditingController();
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
    Uri url = Uri.parse("http://192.168.0.105:8000/api/produk");
    final response = await http.post(url, body: {
      "penjual_id": penjual_id,
      'nama': namaController.text,
      'harga': hargaController.text,
      'stok': stokController.text,
      'satuan': satuanController.text,
      'jenis': jenisController.text,
      'deskripsi': deskripsiController.text,
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

  // tambah() async {
  //   try {
  //     var stream = http.ByteStream(DelegatingStream.typed(image.openRead()));
  //     var length = await image.length();
  //     var url = Uri.parse("http://192.168.43.56:8000/api/produk");
  //     var request = http.MultipartRequest('POST', url);
  //     var multipartFile = http.MultipartFile(
  //         'public/storage/app/post-image', stream, length,
  //         filename: path.basename(image.path));

  //     request.fields['penjual_id'] = penjual_id;
  //     request.fields['nama'] = namaController.text;
  //     request.fields['harga'] = hargaController.text;
  //     request.fields['stok'] = stokController.text;
  //     request.fields['satuan'] = satuanController.text;
  //     request.fields['jenis'] = jenisController.text;
  //     request.fields['deskripsi'] = deskripsiController.text;
  //     request.files.add(multipartFile);

  //     var response = await request.send();
  //     response.stream.transform(utf8.decoder).listen((success) {
  //       final data = jsonDecode(success);
  //       int valueGet = data['success'];
  //       var pesan = data['message'];
  //       if (valueGet == 1) {
  //         print(pesan);
  //         Navigator.push(
  //           context,
  //           MaterialPageRoute(builder: (context) => katalogPage(signOut)),
  //         );
  //       } else {
  //         errorSnackBar(context, 'Produk telah tersedia');
  //         print(pesan);
  //       }
  //     });
  //   } catch (e) {
  //     debugPrint('Error $e');
  //   }
  // }

//   Future<Map<String, dynamic>> _tambah(File image) async {
//     setState(() {});

//     SharedPreferences localdata = await SharedPreferences.getInstance();
//     setState(() {
//       penjual_id = localdata.getString('penjual_id');
//     });
//     print(localdata.getString('penjual_id'));

//     Uri apiUrl = Uri.parse('http://192.168.43.56:8000/api/produk');

//     var stream = http.ByteStream(DelegatingStream.typed(image.openRead()));
//     var length = await image.length();
//     // var url = Uri.parse("http://192.168.43.56:8000/api/produk");
//     var request = http.MultipartRequest('POST', apiUrl);
//     var multipartFile = http.MultipartFile(
//         "public/storage/app/post-image", stream, length,
//         filename: path.basename(image.path));
//     // Explicitly pass the extension of the image with request body
//     // Since image_picker has some bugs due which it mixes up
//     // image extension with file name like this filenamejpge
//     // Which creates some problem at the server side to manage
//     // or verify the file extension

// //    imageUploadRequest.fields['ext'] = mimeTypeData[1];

//     request.files.add(multipartFile);

//     request.fields['penjual_id'] = penjual_id;
//     request.fields['nama'] = namaController.text;
//     request.fields['harga'] = hargaController.text;
//     request.fields['stok'] = stokController.text;
//     request.fields['satuan'] = satuanController.text;
//     request.fields['jenis'] = jenisController.text;
//     request.fields['deskripsi'] = deskripsiController.text;

//     try {
//       final streamedResponse = await request.send();
//       final response = await http.Response.fromStream(streamedResponse);
//       Map<String, dynamic> responseData = json.decode(response.body);
//       int valueGet = responseData['success'];
//       var pesan = responseData['message'];
//       if (valueGet == 1) {
//         print(pesan);
//         Navigator.push(
//           context,
//           MaterialPageRoute(builder: (context) => katalogPage(signOut)),
//         );
//       } else {
//         errorSnackBar(context, 'Produk telah tersedia');
//         print(pesan);
//       }
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }

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
            'Tambah Produk ',
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
                            height: 15.h,
                          ),
                          Container(
                            color: Colors.grey[200],
                            height: MediaQuery.of(context).size.height * 0.85,
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
                                    //GAMBAR
                                    Row(
                                      children: [
                                        InkWell(
                                          onTap: getImage,
                                          child: Container(
                                            height: MediaQuery.of(context)
                                                    .size
                                                    .height *
                                                0.1,
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.2,
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                border: Border.all(
                                                    width: 1.w,
                                                    color: Color(0xFF53B175)),
                                                borderRadius:
                                                    BorderRadius.circular(5.r)),
                                            child: image == null
                                                ? Column(
                                                    children: [
                                                      SizedBox(
                                                        height: 10.h,
                                                      ),
                                                      Icon(
                                                        Icons.add,
                                                        size: 45.sp,
                                                        color:
                                                            Color(0xFF53B175),
                                                      ),
                                                      Text("Gambar",
                                                          style: TextStyle(
                                                              fontFamily:
                                                                  'Mulish',
                                                              fontSize: 18.sp,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w500)),
                                                    ],
                                                  )
                                                : Center(
                                                    child: Column(
                                                      children: [
                                                        SizedBox(
                                                          height: 20.h,
                                                        ),
                                                        Icon(
                                                          Icons.image,
                                                          // size: 45.sp,
                                                        ),
                                                        Text("Diunggah",
                                                            textAlign: TextAlign
                                                                .center,
                                                            style: TextStyle(
                                                                fontFamily:
                                                                    'Mulish',
                                                                fontSize: 16.sp,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500)),
                                                      ],
                                                    ),
                                                  ),
                                            // : Image.file(_image),
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 20.h,
                                    ),

                                    Text('Nama Produk',
                                        style: TextStyle(
                                            fontFamily: 'Mulish',
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w600)),
                                    TextFormField(
                                      validator: (namaController) {
                                        if (namaController.isEmpty) {
                                          return 'masukkan nama';
                                        }
                                      },
                                      controller: namaController,
                                      decoration: InputDecoration(
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        hintText: 'masukkan nama',
                                        hintStyle: TextStyle(
                                          // <-- Change this
                                          fontSize: 16.sp,
                                        ),
                                        // contentPadding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/4)
                                      ),
                                    ),
                                    Divider(
                                      thickness: 1,
                                    ),
                                    Text('harga Produk',
                                        style: TextStyle(
                                            fontFamily: 'Mulish',
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w600)),
                                    TextFormField(
                                      validator: (hargaController) {
                                        if (hargaController.isEmpty) {
                                          return 'masukkan harga';
                                        }
                                      },
                                      controller: hargaController,
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
                                    Divider(
                                      thickness: 1,
                                    ),

                                    Text('satuan Produk',
                                        style: TextStyle(
                                            fontFamily: 'Mulish',
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w600)),
                                    TextFormField(
                                      validator: (satuanController) {
                                        if (satuanController.isEmpty) {
                                          return 'masukkan satuan';
                                        }
                                      },
                                      controller: satuanController,
                                      decoration: InputDecoration(
                                        enabledBorder: InputBorder.none,
                                        focusedBorder: InputBorder.none,
                                        hintText: 'masukkan satuan',
                                        hintStyle: TextStyle(
                                          // <-- Change this
                                          fontSize: 16.sp,
                                        ),
                                        // contentPadding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/4)
                                      ),
                                    ),
                                    Divider(
                                      thickness: 1,
                                    ),

                                    Text('stok Produk',
                                        style: TextStyle(
                                            fontFamily: 'Mulish',
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w600)),
                                    TextFormField(
                                      validator: (stokController) {
                                        if (stokController.isEmpty) {
                                          return 'masukkan stok';
                                        }
                                      },
                                      controller: stokController,
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
                                    Divider(
                                      thickness: 1,
                                    ),

                                    Text('jenis Produk',
                                        style: TextStyle(
                                            fontFamily: 'Mulish',
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w600)),
                                    TextFormField(
                                      validator: (jenisController) {
                                        if (jenisController.isEmpty) {
                                          return 'masukkan jenis';
                                        }
                                      },
                                      controller: jenisController,
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
                                    Divider(
                                      thickness: 1,
                                    ),

                                    Text('deskripsi Produk',
                                        style: TextStyle(
                                            fontFamily: 'Mulish',
                                            fontSize: 18.sp,
                                            fontWeight: FontWeight.w600)),
                                    TextFormField(
                                      validator: (deskripsiController) {
                                        if (deskripsiController.isEmpty) {
                                          return 'masukkan deskripsi';
                                        }
                                      },
                                      controller: deskripsiController,
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
