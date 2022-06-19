import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:rojotani/Awal/loginPetani.dart';
import 'package:rojotani/Awal/registerAs.dart';
import 'package:rojotani/Awal/dataDiri.dart';

class registerPetaniPage extends StatefulWidget {
  @override
  State<registerPetaniPage> createState() => _registerPetaniPageState();
}

class _registerPetaniPageState extends State<registerPetaniPage> {
  bool isHiddenPassword1 = true;
  bool isHiddenPassword2 = true;

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
          elevation: 0,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Route route =
                  MaterialPageRoute(builder: (context) => registerAsPage());
              Navigator.push(context, route);
            },
          ),
          title: Text(
            'Daftar',
            style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'Mulish',
              color: Colors.black,
              fontSize: 23,
            ),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
            child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 36.w),
                child: SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 60.h,
                        ),
                        Image.asset(
                          'asset/gambar/logo.png',
                        ),
                        SizedBox(
                          height: 26.h,
                        ),
                        Text(
                          'Cari produk berkualitas dengan harga terjangkau cuma di Rojotani !!',
                          style: TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w400),
                        ),
                        SizedBox(
                          height: 47.h,
                        ),
                        Text(
                          'Daftar Akun',
                          style: TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w700),
                        ),
                        SizedBox(
                          height: 19.h,
                        ),
                        TextFormField(
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(10.r),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(10.r),
                                  borderSide: BorderSide(
                                      color: Color(0xFF53B175), width: 2.w)),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 14.w, vertical: 14.h),
                              hintText: 'Masukkan Ussername',
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'Mulish',
                                  fontWeight: FontWeight.w400)),
                        ),
                        SizedBox(
                          height: 19.h,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(10.r),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(10.r),
                                  borderSide: BorderSide(
                                      color: Color(0xFF53B175), width: 2.w)),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 14.w, vertical: 14.h),
                              hintText: 'Masukkan E-mail',
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'Mulish',
                                  fontWeight: FontWeight.w400)),
                        ),
                        SizedBox(
                          height: 19.h,
                        ),
                        TextFormField(
                          obscureText: isHiddenPassword1,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(Icons.remove_red_eye),
                                onPressed: _togglePasswordView1,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(10.r),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(10.r),
                                  borderSide: BorderSide(
                                      color: Color(0xFF53B175), width: 2.w)),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 14.w, vertical: 14.h),
                              hintText: 'Masukkan Katasandi',
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'Mulish',
                                  fontWeight: FontWeight.w400)),
                        ),
                        SizedBox(
                          height: 19.h,
                        ),
                        TextFormField(
                          obscureText: isHiddenPassword2,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                icon: Icon(Icons.remove_red_eye),
                                onPressed: _togglePasswordView2,
                              ),
                              border: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(10.r),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(10.r),
                                  borderSide: BorderSide(
                                      color: Color(0xFF53B175), width: 2.w)),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 14.w, vertical: 14.h),
                              hintText: 'Ulangi Katasandi',
                              hintStyle: TextStyle(
                                  color: Colors.grey,
                                  fontFamily: 'Mulish',
                                  fontWeight: FontWeight.w400)),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        SizedBox(
                          height: 33.h,
                        ),
                        new Container(
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
                                Route route = MaterialPageRoute(
                                    builder: (context) => dataDiriPage());
                                Navigator.push(context, route);
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
                        SizedBox(
                          height: 30.h,
                        ),
                        new Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                ' Telah Memiliki Akun? ',
                                style: TextStyle(
                                    fontSize: 18.sp,
                                    color: Colors.black,
                                    fontFamily: 'Mulish',
                                    fontWeight: FontWeight.w600),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Route route = MaterialPageRoute(
                                      builder: (context) => loginPetaniPage());
                                  Navigator.push(context, route);
                                },
                                child: Text(
                                  'Masuk',
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color: Color(0xFF53B175),
                                      fontFamily: 'Mulish',
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ]),
                      ]),
                ))));
  }

  void _togglePasswordView1() {
    if (isHiddenPassword1 == true) {
      isHiddenPassword1 = false;
    } else {
      isHiddenPassword1 = true;
    }
    setState(() {});
  }

  void _togglePasswordView2() {
    if (isHiddenPassword2 == true) {
      isHiddenPassword2 = false;
    } else {
      isHiddenPassword2 = true;
    }
    setState(() {});
  }
}
