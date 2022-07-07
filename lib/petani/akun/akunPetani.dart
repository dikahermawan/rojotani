import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class akunPetani extends StatefulWidget {
  const akunPetani({Key key}) : super(key: key);

  @override
  State<akunPetani> createState() => _akunPetaniState();
}

class _akunPetaniState extends State<akunPetani> {
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
              'Akun',
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
                SizedBox(height: 40.h),
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.22,
                    width: MediaQuery.of(context).size.width * 0.42,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(100.r),
                      image: DecorationImage(
                        image: AssetImage('asset/profil/kosong.png'),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Center(
                  child: Text(
                    'Dika Hermawan',
                    style: TextStyle(
                        fontSize: 23.sp,
                        fontFamily: 'Mulish',
                        fontWeight: FontWeight.w600),
                  ),
                ),
                SizedBox(
                  height: 60.h,
                ),
                Center(
                  child: Container(
                    height: MediaQuery.of(context).size.height * 0.32,
                    width: MediaQuery.of(context).size.width * 0.8,
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 223, 220, 220),
                      borderRadius: BorderRadius.circular(15.r),
                    ),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10.sp,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 223, 220, 220),
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 15.w,
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                width: MediaQuery.of(context).size.width * 0.14,
                                decoration: BoxDecoration(
                                  color: Color(0xFF53B175),
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                                child: Icon(
                                  Icons.person_outline_rounded,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Text(
                                'Profil',
                                style: TextStyle(
                                    fontFamily: 'Mulish',
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                width: 120.w,
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 35.sp,
                              )
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 3,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 223, 220, 220),
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 15.w,
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                width: MediaQuery.of(context).size.width * 0.14,
                                decoration: BoxDecoration(
                                  color: Color(0xFF53B175),
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                                child: Icon(
                                  Icons.password_rounded,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Text(
                                'Password',
                                style: TextStyle(
                                    fontFamily: 'Mulish',
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                width: 80.w,
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 35.sp,
                              )
                            ],
                          ),
                        ),
                        Divider(
                          thickness: 3,
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(255, 223, 220, 220),
                            borderRadius: BorderRadius.circular(15.r),
                          ),
                          child: Row(
                            children: [
                              SizedBox(
                                width: 15.w,
                              ),
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.07,
                                width: MediaQuery.of(context).size.width * 0.14,
                                decoration: BoxDecoration(
                                  color: Color(0xFF53B175),
                                  borderRadius: BorderRadius.circular(15.r),
                                ),
                                child: Icon(
                                  Icons.logout_outlined,
                                  color: Color.fromARGB(255, 255, 255, 255),
                                ),
                              ),
                              SizedBox(
                                width: 20.w,
                              ),
                              Text(
                                'Keluar',
                                style: TextStyle(
                                    fontFamily: 'Mulish',
                                    fontSize: 22.sp,
                                    fontWeight: FontWeight.w700),
                              ),
                              SizedBox(
                                width: 110.w,
                              ),
                              Icon(
                                Icons.arrow_forward_ios_rounded,
                                size: 35.sp,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        )));
  }
}
