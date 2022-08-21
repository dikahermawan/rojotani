import 'dart:convert';
import 'dart:ui';
import 'package:http/http.dart' as http;

import 'package:flutter/gestures.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:rojotani/pelanggan/produk/product_card.dart';
import 'package:rojotani/pelanggan/produk/lelang_card.dart';
import 'package:shared_preferences/shared_preferences.dart';

class homePage extends StatefulWidget {
  @override
  State<homePage> createState() => _homePageState();
}

class _homePageState extends State<homePage> {
  var pembeli_id, _future;

  Future getDataPenjual() async {
    SharedPreferences localdata = await SharedPreferences.getInstance();
    setState(() {
      pembeli_id = localdata.getString('pembeli_id');
    });
    final String url =
        'http://192.168.43.56:8000/api/datapembeli'; //api menampilkan data produk
    final response = await http.post(url, body: {
      "pembeli_id": pembeli_id,
    });
    print(jsonDecode(response.body));
    return jsonDecode(response.body);
  }

  // getPref() async {
  //   SharedPreferences localdata = await SharedPreferences.getInstance();
  //   setState(() {
  //     penjual_id = localdata.getString('penjual_id');
  //   });
  // }

  @override
  void initState() {
    // getPref();
    _future = getDataPenjual();
  }

  Future<void> _refresh() {
    setState(() {
      productCard();
      lelangCard();
    });

    return Future.delayed(Duration(seconds: 2));
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
                      icon: Icon(Icons.notifications), onPressed: () {}),
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
          : FutureBuilder(
              future: _future,
              builder: (BuildContext context, AsyncSnapshot snapshot) {
                if (snapshot.hasData) {
                  return Row(
                    children: [
                      SizedBox(
                        width: 40.w,
                      ),
                      Container(
                        width: MediaQueryWidth * 0.3,
                        margin: EdgeInsets.only(top: 70.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Hai, ',
                              style: TextStyle(
                                  fontFamily: 'Mulish',
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF53B175)),
                            ),
                            Text(
                              snapshot.data['nama'],
                              style: TextStyle(
                                  fontFamily: 'Mulish',
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w800,
                                  color: Color(0xFF53B175)),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(width: MediaQueryWidth * 0.4),
                      Container(
                          margin: EdgeInsets.only(top: 40.h),
                          width: 40,
                          height: 40,
                          decoration: ShapeDecoration(
                            color: Colors.blue,
                            shape: CircleBorder(),
                          ),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(500.r),
                              child: Image.network(
                                'http://192.168.43.56:8000/img/userpembeli/' +
                                    snapshot.data['gambar'],
                                fit: BoxFit.fill,
                              )

                              // alamat untuk mengambil gambar
                              )),
                    ],
                  );
                } else {
                  return Center(
                    child: Text('Load...'),
                  );
                }
              });
    }

    return Scaffold(
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.0), // here the desired height
            child: appbar()),
        body: RefreshIndicator(
          color: Color(0xFF53B175),
          onRefresh: _refresh,
          child: SafeArea(
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
                            lelangCard(),
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
                                margin:
                                    EdgeInsets.only(left: 25.w, right: 15.w),
                                width: 375.w,
                                height:
                                    MediaQuery.of(context).size.height * 0.65,
                                child: GridView.count(
                                  crossAxisCount: 3,
                                  childAspectRatio: 23 / 25,
                                  crossAxisSpacing: 15,
                                  mainAxisSpacing: 8,
                                  children: [productCard()],
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
                            lelangCard(),
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
                            productCard(),
                            SizedBox(
                              height: 10.h,
                            ),
                          ]),
                    )),
        ));
  }
}
