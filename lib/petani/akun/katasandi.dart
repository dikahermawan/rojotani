import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';

class katasandiPetani extends StatefulWidget {
  const katasandiPetani({Key key}) : super(key: key);

  @override
  State<katasandiPetani> createState() => _katasandiPetaniState();
}

class _katasandiPetaniState extends State<katasandiPetani> {
  bool isHiddenPassword = true;

  void _togglePasswordView() {
    if (isHiddenPassword) {
      isHiddenPassword = false;
    } else {
      isHiddenPassword = false;
    }
    setState(() {});
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
    );
    final MediaQueryHeight = MediaQuery.of(context).size.height;
    final MediaQueryWidth = MediaQuery.of(context).size.width;
    Size size = MediaQuery.of(context).size;
    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 1,
          title: Center(
            child: Text(
              'Katasandi',
              style: TextStyle(
                  fontFamily: 'Mulish',
                  fontSize: 23.sp,
                  fontWeight: FontWeight.w600,
                  color: Colors.black),
            ),
          ),
        ),
        body: SafeArea(
            child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 23.w),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 30.h,
                ),
                Text(
                  'Jumlah kata sandi minimal 6 karakter dan disarankan kombinasi antara angka huruf dan karakter khusus',
                  style: TextStyle(
                      fontFamily: 'Mulish',
                      fontSize: 15.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 60.h,
                ),
                TextFormField(

                    // validator: (e) {
                    //   if (e.isEmpty) {
                    //     return error;
                    //   }
                    // },
                    // onSaved: (e) => nilai = e,
                    decoration: InputDecoration(
                  suffixIcon: IconButton(
                      icon: Icon(Icons.visibility),
                      onPressed: _togglePasswordView),
                  hintText: 'Katasandi Lama',
                  hintStyle: TextStyle(
                    fontSize: 16.sp,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF53B175)),
                  ),
                )),
                SizedBox(
                  height: 20.h,
                ),
                TextFormField(

                    // validator: (e) {
                    //   if (e.isEmpty) {
                    //     return error;
                    //   }
                    // },
                    // onSaved: (e) => nilai = e,
                    decoration: InputDecoration(
                  suffixIcon: IconButton(
                      icon: Icon(Icons.visibility), onPressed: () {}),
                  hintText: 'Katasandi Baru',
                  hintStyle: TextStyle(
                    fontSize: 16.sp,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF53B175)),
                  ),
                )),
                SizedBox(
                  height: 20.h,
                ),
                TextFormField(

                    // validator: (e) {
                    //   if (e.isEmpty) {
                    //     return error;
                    //   }
                    // },
                    // onSaved: (e) => nilai = e,
                    decoration: InputDecoration(
                  suffixIcon: IconButton(
                      icon: Icon(Icons.visibility), onPressed: () {}),
                  hintText: 'Konfirmasi Katasandi Baru',
                  hintStyle: TextStyle(
                    fontSize: 16.sp,
                  ),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.grey),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF53B175)),
                  ),
                )),
                SizedBox(
                  height: MediaQueryHeight * 0.15,
                ),
                Center(
                  child: SizedBox(
                    height: 43,
                    width: 135,
                    child: ElevatedButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Color(0xFF53B175))),
                        onPressed: () {},
                        child: Text(
                          'Konfirmasi',
                          style: TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w800),
                        )),
                  ),
                )
              ],
            ),
          ),
        )));
  }
}
