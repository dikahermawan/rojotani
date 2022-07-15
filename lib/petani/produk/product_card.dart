import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:rojotani/petani/models/produkModel.dart';
import 'package:http/http.dart' as http;
import 'package:rojotani/petani/produk/tambah_produk/editProduk.dart';
import 'package:rojotani/petani/produk/tambah_produk/tambahProduk.dart';
import 'package:shared_preferences/shared_preferences.dart';

class productCard extends StatefulWidget {
  const productCard({Key key}) : super(key: key);

  @override
  State<productCard> createState() => _productCardState();
}

// class productCard extends StatelessWidget
class _productCardState extends State<productCard> {
  var penjual_id;
  final String url = 'http://192.168.168.56:8000/api/getproduk';
  var _future;

  // Future getProducts() async {
  //   var response = await http.get(Uri.parse(url));
  //   print(jsonDecode(response.body));
  //   return jsonDecode(response.body);
  // }

  Future getProducts() async {
    SharedPreferences localdata = await SharedPreferences.getInstance();
    setState(() {
      penjual_id = localdata.getString('penjual_id');
    });

    final response = await http.post(url, body: {
      "penjual_id": penjual_id,
    });
    // var response = await http.get(Uri.parse(url));

    // final data = jsonDecode(response.body);
    // int value = data['success'];
    // var pesan = data['message'];

    return jsonDecode(response.body);
  }

  Future getDataBarang(barang_id) async {
    SharedPreferences localdata = await SharedPreferences.getInstance();
    localdata..setString('barang_id', barang_id.toString());
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _future = getProducts();
  }

  @override
  Widget build(BuildContext context) {
    // getProducts();
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

    Size size = MediaQuery.of(context).size;
    return (isLandscape)
        ? Container(
            margin: EdgeInsets.only(
              top: 10.h,
            ),
            width: MediaQuery.of(context).size.width * 0.38,
            height: MediaQuery.of(context).size.height * 0.28,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(width: 1.w, color: Colors.grey),
            ),
            child: InkWell(
              onTap: () {},
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10.h,
                    ),
                    // child: ClipRRect(
                    //     borderRadius: BorderRadius.circular(40.r),
                    //     child: Image.asset(
                    //       img,
                    //       width: size.width * 0.23,
                    //       height: size.width * 0.18,
                    //     )),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 12.w,
                      ),
                      Container(
                        //color: Colors.blue,
                        margin: const EdgeInsets.only(
                          right: 16.0,
                        ),
                        width: 86.w,
                        // child: Text(
                        //   title,
                        //   style: TextStyle(
                        //       fontFamily: 'Mulish',
                        //       fontSize: 28.sp,
                        //       fontWeight: FontWeight.w800),
                        // ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 12.w,
                      ),
                      Container(
                        margin: const EdgeInsets.only(
                          right: 18.0,
                        ),
                        width: 161,
                        // child: Text(
                        //   harga,
                        //   style: TextStyle(
                        //       fontFamily: 'Mulish',
                        //       fontSize: 23.sp,
                        //       fontWeight: FontWeight.w800),
                        // ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                ],
              ),
            ),
          )
        /////////////////////////////////////////////////
        //Potrait
        : FutureBuilder(
            future: _future,
            builder: (BuildContext context, AsyncSnapshot snapshot) {
              if (snapshot.hasData) {
                return Container(
                  color: Colors.grey[200],
                  height: MediaQuery.of(context).size.height * 0.29,
                  width: MediaQuery.of(context).size.width * 3,
                  child: Row(
                    children: [
                      SizedBox(
                        width: 20.w,
                      ),
                      InkWell(
                        onTap: () {
                          Route route = MaterialPageRoute(
                              builder: (context) => tambahProduk());
                          Navigator.push(context, route);
                        },
                        child: Container(
                          margin: EdgeInsets.only(right: 6.w),
                          width: MediaQuery.of(context).size.width * 0.25,
                          height: MediaQuery.of(context).size.height * 0.25,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(15.r),
                            border: Border.all(width: 1.w, color: Colors.grey),
                          ),
                          child: Icon(
                            Icons.add,
                            size: 40,
                          ),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.68,
                        child: ListView.builder(
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index) {
                            return Row(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(
                                    left: 10.w,
                                  ),
                                  width:
                                      MediaQuery.of(context).size.width * 0.38,
                                  height:
                                      MediaQuery.of(context).size.height * 0.25,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(15.r),
                                    border: Border.all(
                                        width: 1.w, color: Colors.grey),
                                  ),
                                  child: InkWell(
                                    onTap: () {
                                      getDataBarang(snapshot.data[index]['id']);
                                      Route route = MaterialPageRoute(
                                          builder: (context) => editProduk());
                                      Navigator.push(context, route);
                                    },
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.only(
                                            top: 10.h,
                                          ),
                                          // child: ClipRRect(
                                          //     borderRadius: BorderRadius.circular(10),
                                          //     child: Image.asset(
                                          //       img,
                                          //       width: size.width * 0.33,
                                          //     )),
                                        ),
                                        SizedBox(
                                          height: 3.h,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 12.w,
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                right: 12.0,
                                              ),
                                              width: 110,
                                              child: Text(
                                                snapshot.data[index]['nama'],
                                                style: TextStyle(
                                                    fontFamily: 'Mulish',
                                                    fontSize: 16.sp,
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 10.h,
                                        ),
                                        Row(
                                          children: [
                                            SizedBox(
                                              width: 12.w,
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                right: 1,
                                              ),
                                              width: 20,
                                              child: Text(
                                                'Rp.',
                                                style: TextStyle(
                                                    fontFamily: 'Mulish',
                                                    fontSize: 14.sp,
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                            ),
                                            Container(
                                              width: 40,
                                              child: Text(
                                                snapshot.data[index]['harga']
                                                    .toString(),
                                                style: TextStyle(
                                                    fontFamily: 'Mulish',
                                                    fontSize: 14.sp,
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                right: 1,
                                              ),
                                              width: 10,
                                              child: Text(
                                                ' / ',
                                                style: TextStyle(
                                                    fontFamily: 'Mulish',
                                                    fontSize: 14.sp,
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                            ),
                                            Container(
                                              margin: const EdgeInsets.only(
                                                right: 1,
                                              ),
                                              width: 35,
                                              child: Text(
                                                snapshot.data[index]['satuan'],
                                                style: TextStyle(
                                                    fontFamily: 'Mulish',
                                                    fontSize: 14.sp,
                                                    fontWeight:
                                                        FontWeight.w800),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 8.h,
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            );
                          },
                          // arah kekiri
                          scrollDirection: Axis.horizontal,
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return Text(' Data Eror');
              }
            });
  }
}
