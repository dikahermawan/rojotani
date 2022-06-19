import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:rojotani/layout.dart';
import 'package:rojotani/pembeli/produk/product_card.dart';
import 'package:rojotani/pembeli/produk/lelang_card.dart';

class homePage extends StatefulWidget {
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
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

    final bool isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    Widget appbar() {
      return (isLandscape)
          ? Row(
              children: [
                SizedBox(width: 15.w),
                Container(
                  margin: EdgeInsets.only(top: 100.h),
                  width: MediaQuery.of(context).size.width * 0.70,
                  height: MediaQuery.of(context).size.height * 0.10,
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(15)),
                  child: TextField(
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: 'Cari produk',
                      prefixIcon: Icon(Icons.search),
                      // contentPadding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/4)
                    ),
                  ),
                ),
                SizedBox(width: 9.w),
                Container(
                  margin: EdgeInsets.only(top: 100.h),
                  child: IconButton(
                    icon: Icon(Icons.shopping_cart_rounded),
                    onPressed: () {
                      // Route route =
                      //     MaterialPageRoute(builder: (context) => ());
                      // Navigator.push(context, route);
                    },
                  ),
                  width: MediaQuery.of(context).size.width * 0.060,
                  height: MediaQuery.of(context).size.height * 0.11,
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(25)),
                ),
                SizedBox(width: 6.w),
                Container(
                  margin: EdgeInsets.only(top: 100.h),
                  child: IconButton(
                    icon: Icon(Icons.notifications),
                    onPressed: () {
                      // Route route =
                      //     MaterialPageRoute(builder: (context) => ());
                      // Navigator.push(context, route);
                    },
                  ),
                  width: MediaQuery.of(context).size.width * 0.060,
                  height: MediaQuery.of(context).size.height * 0.11,
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(25)),
                ),
              ],
            )
          ///////////////////
          //Potrait
          : Row(
              children: [
                SizedBox(
                  width: 25.w,
                ),
                Container(
                  margin: EdgeInsets.only(top: 50.h),
                  width: MediaQuery.of(context).size.width * 0.6,
                  height: MediaQuery.of(context).size.height * 0.061,
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(15)),
                  child: TextField(
                    style: TextStyle(fontFamily: 'Mulish'),
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: 'Cari produk',
                      prefixIcon: Icon(Icons.search),
                      // contentPadding: EdgeInsets.symmetric(vertical: MediaQuery.of(context).size.height/4)
                    ),
                  ),
                ),
                SizedBox(width: 6.w),
                Container(
                  margin: EdgeInsets.only(top: 50.h),
                  child: IconButton(
                    icon: Icon(Icons.shopping_cart_rounded),
                    onPressed: () {
                      // Route route =
                      //     MaterialPageRoute(builder: (context) => ());
                      // Navigator.push(context, route);
                    },
                  ),
                  width: MediaQuery.of(context).size.width * 0.12,
                  height: MediaQuery.of(context).size.height * 0.062,
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(25)),
                ),
                SizedBox(width: 6.w),
                Container(
                  margin: EdgeInsets.only(top: 50.h),
                  child: IconButton(
                    icon: Icon(Icons.notifications),
                    onPressed: () {
                      // Route route =
                      //     MaterialPageRoute(builder: (context) => ());
                      // Navigator.push(context, route);
                    },
                  ),
                  width: MediaQuery.of(context).size.width * 0.12,
                  height: MediaQuery.of(context).size.height * 0.062,
                  decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(25.r)),
                ),
              ],
            );
    }

    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.0), // here the desired height
            child: appbar()),
        body: SafeArea(
            child: (isLandscape)
                ? SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 25.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 110.sp),
                            child: Text(
                              'Lelang',
                              style: TextStyle(
                                  fontFamily: 'Mulish',
                                  fontSize: 50.sp,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Container(
                            color: Color(0xFF53B175),
                            height: MediaQuery.of(context).size.height * 0.55,
                            width: MediaQuery.of(context).size.width * 1,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 25.w,
                                  ),
                                  lelangCard(
                                    img: 'asset/gambar/jagung.png',
                                    title: 'Pisang Ambon',
                                    harga: 'Rp. 15.000 / Kg',
                                    waktu: '00 : 00 : 00',
                                    press: () {},
                                  ),
                                  lelangCard(
                                    img: 'asset/gambar/jagung.png',
                                    title: 'Pisang Ambon',
                                    harga: 'Rp. 15.000 / Kg',
                                    waktu: '00 : 00 : 00',
                                    press: () {},
                                  ),
                                  lelangCard(
                                    img: 'asset/gambar/jagung.png',
                                    title: 'Pisang Ambon',
                                    harga: 'Rp. 15.000 / Kg',
                                    waktu: '00 : 00 : 00',
                                    press: () {},
                                  ),
                                  lelangCard(
                                    img: 'asset/gambar/jagung.png',
                                    title: 'Pisang Ambon',
                                    harga: 'Rp. 15.000 / Kg',
                                    waktu: '00 : 00 : 00',
                                    press: () {},
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 27.w),
                            child: Text(
                              'Produk',
                              style: TextStyle(
                                  fontFamily: 'Mulish',
                                  fontSize: 50.sp,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                          SizedBox(
                            height: 15.h,
                          ),
                          SingleChildScrollView(
                            child: Container(
                              margin: EdgeInsets.only(left: 25.w, right: 15.w),
                              width: 375.w,
                              height: MediaQuery.of(context).size.height * 0.65,
                              child: GridView.count(
                                crossAxisCount: 3,
                                childAspectRatio: 23 / 25,
                                crossAxisSpacing: 15,
                                mainAxisSpacing: 8,
                                children: [
                                  productCard(
                                    img: 'asset/gambar/pissang.png',
                                    title: 'Pisang Ambon',
                                    harga: 'Rp. 15.000 / Kg',
                                    press: () {},
                                  ),
                                  productCard(
                                    img: 'asset/gambar/lemuru.png',
                                    title: 'Ikan Lemuru',
                                    harga: 'Rp. 10.000 / Kg',
                                    press: () {},
                                  ),
                                  productCard(
                                    img: 'asset/gambar/nangka.png',
                                    title: 'Nangka',
                                    harga: 'Rp. 20.000 / Buah',
                                    press: () {},
                                  ),
                                  productCard(
                                    img: 'asset/gambar/jagung.png',
                                    title: 'Jagung Manis',
                                    harga: 'Rp. 3000 / Kg',
                                    press: () {},
                                  ),
                                  productCard(
                                    img: 'asset/gambar/kakap.png',
                                    title: 'Ikan Kakap',
                                    harga: 'Rp. 17.000 / Kg',
                                    press: () {},
                                  ),
                                  productCard(
                                    img: 'asset/gambar/tengiri.png',
                                    title: 'Ikan Tengiri',
                                    harga: 'Rp. 8000 / Kg',
                                    press: () {},
                                  )
                                ],
                              ),
                            ),
                          ),
                        ]),
                  )
                ////////////////////////////
                //Potrait
                : SingleChildScrollView(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 38.sp),
                            child: Text(
                              'Lelang',
                              style: TextStyle(
                                  fontFamily: 'Mulish',
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            color: Color(0xFF53B175),
                            height: MediaQuery.of(context).size.height * 0.32,
                            width: MediaQuery.of(context).size.width * 1,
                            child: SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  SizedBox(
                                    width: 20.w,
                                  ),
                                  lelangCard(
                                    img: 'asset/gambar/jagung.png',
                                    title: 'Pisang Ambon',
                                    harga: 'Rp. 15.000 / Kg',
                                    waktu: '00 : 00 : 00',
                                    press: () {},
                                  ),
                                  lelangCard(
                                    img: 'asset/gambar/jagung.png',
                                    title: 'Pisang Ambon',
                                    harga: 'Rp. 15.000 / Kg',
                                    waktu: '00 : 00 : 00',
                                    press: () {},
                                  ),
                                  lelangCard(
                                    img: 'asset/gambar/jagung.png',
                                    title: 'Pisang Ambon',
                                    harga: 'Rp. 15.000 / Kg',
                                    waktu: '00 : 00 : 00',
                                    press: () {},
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 38.sp),
                            child: Text(
                              'Produk',
                              style: TextStyle(
                                  fontFamily: 'Mulish',
                                  fontSize: 25.sp,
                                  fontWeight: FontWeight.w800),
                            ),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          SingleChildScrollView(
                            child: Container(
                              margin: EdgeInsets.only(left: 25.w, right: 25.w),
                              width: 375.w,
                              height: MediaQuery.of(context).size.height * 0.45,
                              child: GridView.count(
                                crossAxisCount: 2,
                                childAspectRatio: 16 / 21,
                                crossAxisSpacing: 15,
                                children: [
                                  productCard(
                                    img: 'asset/gambar/pissang.png',
                                    title: 'Pisang Ambon',
                                    harga: 'Rp. 15.000 / Kg',
                                    press: () {},
                                  ),
                                  productCard(
                                    img: 'asset/gambar/lemuru.png',
                                    title: 'Ikan Lemuru',
                                    harga: 'Rp. 10.000 / Kg',
                                    press: () {},
                                  ),
                                  productCard(
                                    img: 'asset/gambar/nangka.png',
                                    title: 'Nangka',
                                    harga: 'Rp. 20.000 / Buah',
                                    press: () {},
                                  ),
                                  productCard(
                                    img: 'asset/gambar/jagung.png',
                                    title: 'Jagung Manis',
                                    harga: 'Rp. 3000 / Kg',
                                    press: () {},
                                  ),
                                  productCard(
                                    img: 'asset/gambar/kakap.png',
                                    title: 'Ikan Kakap',
                                    harga: 'Rp. 17.000 / Kg',
                                    press: () {},
                                  ),
                                  productCard(
                                    img: 'asset/gambar/tengiri.png',
                                    title: 'Ikan Tengiri',
                                    harga: 'Rp. 8000 / Kg',
                                    press: () {},
                                  )
                                ],
                              ),
                            ),
                          ),
                        ]),
                  )));
  }
}
