import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';

class pesananBayarPage extends StatelessWidget {
  TabController controller;

  pesananBayarPage(this.controller);

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
                  'Order ID',
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
                      Image.asset('asset/gambar/BSI.png', width:103.w , height:55.h,),
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
                Container(
                  height: 58.h,
                  width: 326.w,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey[300], width: 1),
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
                ),
                SizedBox(
                  height: 28.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left: 40.w),
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
                            'Batal',
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
                SizedBox(height: 54.h)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
