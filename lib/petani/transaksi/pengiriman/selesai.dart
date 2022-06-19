import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class selesaiPage extends StatelessWidget {
  TabController controller;

  selesaiPage(this.controller);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 57.h,
            ),
            Divider(
              thickness: 3,
            ),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Padding(
                padding: EdgeInsets.only(top: 215.h),
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
          ],
        ),
      ),
    );
  }
}
