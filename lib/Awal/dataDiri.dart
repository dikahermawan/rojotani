import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:rojotani/petani/produk/dashboard.dart'; 


class dataDiriPage extends StatefulWidget {
  @override
  State<dataDiriPage> createState() => _dataDiriPageState();
}

class _dataDiriPageState extends State<dataDiriPage> {
  Widget getTextForm({String hint}) {
    return TextFormField(
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: new BorderRadius.circular(5.r),
          ),
          focusedBorder: OutlineInputBorder(
              borderRadius: new BorderRadius.circular(5.r),
              borderSide: BorderSide(color: Color(0xFF53B175), width: 2.w)),
          contentPadding:
              EdgeInsets.symmetric(horizontal: 14.w, vertical: 14.h),
          hintText: hint,
          hintStyle: TextStyle(color: Colors.grey)),
    );
  }

  Widget Judul({String judul}) {
    return new Row(
      children: [
        Text(
          judul,
          style: TextStyle(
            fontFamily: 'Mulish',
            fontSize: 18.sp,
            fontWeight: FontWeight.w400,
          ),
        ),
        Text(' *',
            style: TextStyle(
                fontFamily: 'Mulish',
                fontSize: 18.sp,
                fontWeight: FontWeight.w400,
                color: Colors.red))
      ],
    );
  }

  Widget Button({String button}) {
    return new Container(
      width: 317.w,
      height: 60.h,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5.r),
        color: Colors.blueGrey[100],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: () {},
          child: Center(
            child: Column(
              children: [
                SizedBox(
                  height: 10.sp,
                ),
                Icon(
                  Icons.upload_outlined,
                  size: 20.h,
                ),
                SizedBox(
                  height: 0.sp,
                ),
                Text('Unggah',
                    style: TextStyle(
                        fontSize: 14.sp, fontWeight: FontWeight.w600)),
                SizedBox(
                  height: 0.sp,
                ),
              ],
            ),
          ),
        ),
      ),
    );
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
        orientation: Orientation.portrait);
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: Text(
            'Data Diri',
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
                          height: 28.h,
                        ),
                        Judul(judul: 'Nama'),
                        SizedBox(
                          height: 7.h,
                        ),
                        getTextForm(hint: ''),
                        SizedBox(
                          height: 12.h,
                        ),
                        Judul(judul: 'Alamat'),
                        SizedBox(
                          height: 7.h,
                        ),
                        getTextForm(hint: ''),
                        SizedBox(
                          height: 12.h,
                        ),
                        Judul(judul: 'Nomor Rekening'),
                        SizedBox(
                          height: 7.h,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: new BorderRadius.circular(5.r),
                              ),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: new BorderRadius.circular(5.r),
                                  borderSide: BorderSide(
                                      color: Color(0xFF53B175), width: 2.w)),
                              contentPadding: EdgeInsets.symmetric(
                                  horizontal: 14.w, vertical: 14.h),
                              hintText: '',
                              hintStyle: TextStyle(color: Colors.grey)),
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        Judul(judul: 'Nama Pemilik Rekening'),
                        SizedBox(
                          height: 7.h,
                        ),
                        getTextForm(hint: ''),
                        SizedBox(
                          height: 12.h,
                        ),
                        Judul(judul: 'Unggah Foto KTP'),
                        SizedBox(
                          height: 7.h,
                        ),
                        Button(button: ''),
                        SizedBox(
                          height: 12.h,
                        ),
                        Judul(judul: 'Unggah Foto Diri Memegang KTP'),
                        SizedBox(
                          height: 7.h,
                        ),
                        Button(button: ''),
                        SizedBox(
                          height: 27.h,
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
                        builder: (context) => homePage());
                    Navigator.push(context, route);
                              },
                              child: Center(
                                child: Text(
                                  'Lanjutkan',
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
                      ]),
                ))));
  }
}
