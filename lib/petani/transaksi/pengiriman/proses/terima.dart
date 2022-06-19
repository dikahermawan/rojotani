 import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class terimaPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.only(top: 17.sp),
        decoration: BoxDecoration(
            //color: Colors.blue,
            border: Border.all(
             color: Colors.grey[300], width: 1
            ) ,
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(
                  10,
                ),
                topRight: Radius.circular(10))),
        child: Column(
          children: [
            SizedBox(
              height: 46.h,
            ),
            Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 180.h),
                      child: Image.asset(
                        'asset/icon/kosong.png',
                        height: 55.h,
                        width: 55.w,
                      ),
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    Text('Belum Ada Transaksi',
                        style: TextStyle(
                            fontFamily: 'Mulish',
                            fontWeight: FontWeight.w400,
                            fontSize: 16.sp)),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}