import 'dart:convert';
import 'dart:io';
import 'dart:ui';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:rojotani/layout.dart';
import 'package:rojotani/petani/produk/katalog.dart';
import 'package:shared_preferences/shared_preferences.dart';

class tambahLelangPage extends StatefulWidget {
  @override
  _tambahLelangPageState createState() => _tambahLelangPageState();
}

class _tambahLelangPageState extends State<tambahLelangPage> {
  var penjual_id;
  final _key = new GlobalKey<FormState>();

  VoidCallback get signOut => null;

  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  TextEditingController namaController = TextEditingController();
  TextEditingController hargaController = TextEditingController();
  TextEditingController stokController = TextEditingController();
  TextEditingController satuanController = TextEditingController();
  TextEditingController jenisController = TextEditingController();
  TextEditingController deskripsiController = TextEditingController();
  TextEditingController statusController = TextEditingController();

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
    Uri url = Uri.parse("http://192.168.43.56:8000/api/lelang");
    final response = await http.post(url, body: {
      "penjual_id": penjual_id,
      'nama': namaController.text,
      'harga': hargaController.text,
      'satuan': satuanController.text,
      'jenis': jenisController.text,
      'deskripsi': deskripsiController.text,
      'status': statusController.text,
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

  ////////////////////////////////////////////////

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

  Widget Input(String input) {
    return Padding(
      padding: EdgeInsets.only(left: 15.w),
      child: TextField(
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
                'Tambah Lelang',
                style: TextStyle(
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Mulish',
                  color: Colors.black,
                  fontSize: 50.sp,
                ),
              ),
              centerTitle: true,
            ),
            body: Padding(
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
                      height: MediaQuery.of(context).size.height * 1.55,
                      width: MediaQuery.of(context).size.width * 0.99,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 20.h,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 15.w),
                                child: InkWell(
                                  onTap: getImage,
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.2,
                                    width: MediaQuery.of(context).size.width *
                                        0.15,
                                    decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            width: 1.w,
                                            color: Color(0xFF53B175)),
                                        borderRadius:
                                            BorderRadius.circular(5.r)),
                                    child: _image == null
                                        ? Column(
                                            children: [
                                              SizedBox(
                                                height: 20.h,
                                              ),
                                              Icon(
                                                Icons.add,
                                                size: 70.sp,
                                                color: Color(0xFF53B175),
                                              ),
                                              Text("Gambar",
                                                  style: TextStyle(
                                                      fontFamily: 'Mulish',
                                                      fontSize: 30.sp,
                                                      fontWeight:
                                                          FontWeight.w500)),
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
                                                  size: 85.h,
                                                ),
                                                Text("Diunggah",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontFamily: 'Mulish',
                                                        fontSize: 25.sp,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                              ],
                                            ),
                                          ),
                                    // Image.file(_image),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text('nama Produk',
                              style: TextStyle(
                                  fontFamily: 'Mulish',
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600)),
                          TextFormField(
                            validator: (namaController) {
                              if (namaController.isEmpty) {
                                return 'masukkan ussername';
                              }
                            },
                            controller: namaController,
                            decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: 'masukkan ussername',
                              hintStyle: TextStyle(
                                fontSize: 16.sp,
                              ),
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
                                fontSize: 16.sp,
                              ),
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
                                fontSize: 16.sp,
                              ),
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
                                fontSize: 16.sp,
                              ),
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
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
                          Divider(
                            thickness: 1,
                          ),
                          Text('waktu Lelang',
                              style: TextStyle(
                                  fontFamily: 'Mulish',
                                  fontSize: 18.sp,
                                  fontWeight: FontWeight.w600)),
                          TextFormField(
                            validator: (waktuController) {
                              if (waktuController.isEmpty) {
                                return 'masukkan waktu';
                              }
                            },
                            controller: statusController,
                            decoration: InputDecoration(
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                              hintText: 'masukkan waktu',
                              hintStyle: TextStyle(
                                fontSize: 16.sp,
                              ),
                            ),
                          ),
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
            ))
        :
        ///////////
        //Potrait
        Scaffold(
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
                'Tambah Lelang',
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
                                height:
                                    MediaQuery.of(context).size.height * 0.85,
                                //width: MediaQuery.of(context).size.width * 0.6,
                                child: Padding(
                                  padding: EdgeInsets.only(left: 26.w),
                                  child: SingleChildScrollView(
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
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
                                                        color:
                                                            Color(0xFF53B175)),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5.r)),
                                                child: _image == null
                                                    ? Column(
                                                        children: [
                                                          SizedBox(
                                                            height: 10.h,
                                                          ),
                                                          Icon(
                                                            Icons.add,
                                                            size: 45.sp,
                                                            color: Color(
                                                                0xFF53B175),
                                                          ),
                                                          Text("Gambar",
                                                              style: TextStyle(
                                                                  fontFamily:
                                                                      'Mulish',
                                                                  fontSize:
                                                                      18.sp,
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
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                style: TextStyle(
                                                                    fontFamily:
                                                                        'Mulish',
                                                                    fontSize:
                                                                        16.sp,
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

                                        Text('nama Produk',
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
                                              fontSize: 16.sp,
                                            ),
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
                                              fontSize: 16.sp,
                                            ),
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
                                              fontSize: 16.sp,
                                            ),
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
                                              fontSize: 16.sp,
                                            ),
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
                                              fontSize: 16.sp,
                                            ),
                                          ),
                                        ),
                                        Divider(
                                          thickness: 1,
                                        ),
                                        // Text('waktu Lelang',
                                        // style: TextStyle(
                                        // fontFamily: 'Mulish',
                                        // fontSize: 18.sp,
                                        // fontWeight: FontWeight.w600)),
                                        // TextFormField(
                                        // validator: (waktuController) {
                                        // if (waktuController.isEmpty) {
                                        // return 'masukkan waktu';
                                        // }
                                        // },
                                        // controller: waktuController,
                                        // decoration: InputDecoration(
                                        // enabledBorder: InputBorder.none,
                                        // focusedBorder: InputBorder.none,
                                        // hintText: 'masukkan waktu',
                                        // hintStyle: TextStyle(
                                        // fontSize: 16.sp,
                                        // ),
                                        // ),
                                        // ),
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
