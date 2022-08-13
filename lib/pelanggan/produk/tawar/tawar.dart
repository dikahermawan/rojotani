import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class tawar extends StatefulWidget {
  const tawar({Key key}) : super(key: key);

  @override
  State<tawar> createState() => _tawarState();
}

class _tawarState extends State<tawar> {
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
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(
            'Detail Produk',
            style: TextStyle(
                fontFamily: 'Mulish',
                fontSize: 23.sp,
                fontWeight: FontWeight.w600,
                color: Colors.black),
          ),
          centerTitle: true,
        ),
        body: SafeArea(
            child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.75,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        color: Colors.blue,
                        height: MediaQuery.of(context).size.height * 0.45,
                        child: Image.asset(
                          'asset/gambar/nangka.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Nama Produk',
                            style: TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: 22.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Rp. harga',
                            style: TextStyle(
                              color: Color(0xFF53B175),
                              fontFamily: 'Mulish',
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Sedang Lelang',
                            style: TextStyle(
                              color: Color.fromARGB(255, 182, 20, 8),
                              fontFamily: 'Mulish',
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Divider(
                          thickness: 2,
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'Deskripsi Produk',
                            style: TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: 21.sp,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20.w),
                        child: Align(
                          alignment: Alignment.bottomLeft,
                          child: Text(
                            'angka terutama dipanen buahnya. "Daging buah" yang matang sering kali dimakan dalam keadaan segar, dicampur dalam es, dihaluskan menjadi minuman (jus), atau diolah menjadi aneka jenis makanan daerah: dodol nangka, kolak nangka, selai nangka, nangka-goreng-tepung, keripik nangka, dan lain-lain. Nangka juga digunakan sebagai pengharum es krim dan minuman, dijadikan madu-nangka, konsentrat atau tepung. Biji nangka, dikenal sebagai "beton", dapat direbus dan dimakan sebagai sumber karbohidrat tambahan.Biji nangka juga bisa dijadikan satu dengan masakan kolak nangka. Nangka maupun biji nangka juga bisa digabung dengan masakan kolak pisang atau buah sukun. Biji nangka juga bisa dijadikan tepung. Biji nangka yang direbus secara terpisah atau tidak diikutkan dalam masakan kolak, dapat dimakan seperti halnya kita makan singkong. Biji nangka bisa juga dimasak dengan cara digoreng.Buah nangka muda sangat digemari sebagai bahan sayuran. Di Sumatra, terutama di Minangkabau, dikenal masakan gulai cubadak (gulai nangka). Di Jawa Barat buah nangka muda antara lain dimasak sebagai salah satu bahan sayur asam. Di Jawa Tengah dikenal berbagai macam masakan dengan bahan dasar buah nangka muda (disebut gori), seperti sayur lodeh, masakan megono, oseng-oseng gori, dan jangan gori (sayur nangka muda). Di Jogyakarta nangka muda terutama dimasak sebagai gudeg. Sementara di seputaran Jakarta dan Jawa Barat, bongkol bunga jantan (disebut babal atau tongtolang) kerap dijadikan bahan rujak.',
                            style: TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                    ],
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 1,
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(
                          right: MediaQueryWidth * 0.58,
                          top: MediaQueryHeight * 0.007),
                      child: Text(
                        'Tawar Produk',
                        style: TextStyle(
                            fontFamily: 'Mulish',
                            color: Colors.black,
                            fontSize: 21.sp,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                    SizedBox(
                      height: 17.h,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 18.w,
                        ),
                        Container(
                          width: MediaQueryWidth * 0.5,
                          height: MediaQueryHeight * 0.07,
                          child: TextFormField(
                            validator: (e) {
                              if (e.isEmpty) {
                                return 'masukkan Tawaran';
                              }
                            },
                            // onSaved: (e) => alamat = e,
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(10.r),
                                ),
                                focusedBorder: OutlineInputBorder(
                                    borderRadius:
                                        new BorderRadius.circular(10.r),
                                    borderSide: BorderSide(
                                        color: Color(0xFF53B175), width: 2.w)),
                                contentPadding: EdgeInsets.symmetric(
                                    horizontal: 14.w, vertical: 20.h),
                                hintText: 'Masukkan Tawaran',
                                hintStyle: TextStyle(
                                    color: Colors.grey,
                                    fontFamily: 'Mulish',
                                    fontWeight: FontWeight.w400)),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Container(
                            width: MediaQueryWidth * 0.2,
                            height: MediaQueryHeight * 0.07,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: Color(0xFF53B175),
                            ),
                            child: Center(
                              child: Text(
                                'Tawar ',
                                style: TextStyle(
                                  fontFamily: 'Mulish',
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        InkWell(
                          onTap: (() {}),
                          child: Container(
                            width: MediaQueryWidth * 0.2,
                            height: MediaQueryHeight * 0.07,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.r),
                              color: Color(0xFF53B175),
                            ),
                            child: Center(
                              child: Text(
                                'Batal ',
                                style: TextStyle(
                                  fontFamily: 'Mulish',
                                  color: Colors.white,
                                  fontSize: 16.sp,
                                  fontWeight: FontWeight.w700,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    )
                  ],
                ),
              )
            ],
          ),
        )));
  }
}
