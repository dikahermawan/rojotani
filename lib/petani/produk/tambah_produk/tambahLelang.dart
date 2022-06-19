import 'dart:io';
import 'dart:ui';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:rojotani/layout.dart';

class tambahLelangPage extends StatefulWidget {
  @override
  _tambahLelangPageState createState() => _tambahLelangPageState();
}

class _tambahLelangPageState extends State<tambahLelangPage> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

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
                  // Route route =
                  //     MaterialPageRoute(builder: (context) => ());
                  // Navigator.push(context, route);
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
                          space(),
                          titleLandscape('Nama Produk'),
                          InputLandscape('Masukkan Nama Produk'),
                          space(),
                          titleLandscape('Harga Produk'),
                          InputLandscape('Masukkan Harga Produk'),
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
                  // Route route =
                  //     MaterialPageRoute(builder: (context) => ());
                  // Navigator.push(context, route);
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
                      height: MediaQuery.of(context).size.height * 0.83,
                      width: MediaQuery.of(context).size.width * 0.99,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          Row(
                            children: [
                              Padding(
                                padding: EdgeInsets.only(left: 15.w),
                                child: InkWell(
                                  onTap: getImage,
                                  child: Container(
                                    height: MediaQuery.of(context).size.height *
                                        0.1,
                                    width:
                                        MediaQuery.of(context).size.width * 0.2,
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
                                                height: 10.h,
                                              ),
                                              Icon(
                                                Icons.add,
                                                size: 45.sp,
                                                color: Color(0xFF53B175),
                                              ),
                                              Text("Gambar",
                                                  style: TextStyle(
                                                      fontFamily: 'Mulish',
                                                      fontSize: 18.sp,
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
                                                  // size: 45.sp,
                                                ),
                                                Text("Diunggah",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontFamily: 'Mulish',
                                                        fontSize: 16.sp,
                                                        fontWeight:
                                                            FontWeight.w500)),
                                              ],
                                            ),
                                          ),
                                    // : Image.file(_image),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          space(),
                          title('Nama Produk'),
                          Input('Masukkan Nama Produk'),
                          space(),
                          title('Harga Produk'),
                          Input('Masukkan Harga Produk'),
                          space(),
                          title('Satuan Produk'),
                          Input('Masukkan Satuan Produk'),
                          space(),
                          title('Jenis Produk'),
                          Input('Masukkan Jenis Produk'),
                          space(),
                          title('Deskripsi Produk'),
                          Input('Masukkan Deskripsi Produk'),
                          space(),
                          title('Waktu'),
                          Input('Masukkan Deskripsi Produk'),
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
                          height: 55.h,
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
            ));
  }
}
