import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class productCard extends StatelessWidget {
  final String title, harga, img;
  final Function press;
  const productCard({
    Key key,
    this.title,
    this.harga,
    this.img,
    this.press,
  }) : super(key: key);

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
              onTap: press,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10.h,
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(40.r),
                        child: Image.asset(
                          img,
                          width: size.width * 0.23,
                          height: size.width * 0.18,
                        )),
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
                        child: Text(
                          title,
                          style: TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: 28.sp,
                              fontWeight: FontWeight.w800),
                        ),
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
                        child: Text(
                          harga,
                          style: TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: 23.sp,
                              fontWeight: FontWeight.w800),
                        ),
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
        : Container(
            margin: EdgeInsets.only(
              left: 10.w,
            ),
            width: MediaQuery.of(context).size.width * 0.38,
            height: MediaQuery.of(context).size.height * 0.25,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15.r),
              border: Border.all(width: 1.w, color: Colors.grey),
            ),
            child: InkWell(
              onTap: press,
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      top: 10.h,
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.asset(
                          img,
                          width: size.width * 0.33,
                        )),
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
                        width: 121,
                        child: Text(
                          title,
                          style: TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w800),
                        ),
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
                          right: 12.0,
                        ),
                        width: 121,
                        child: Text(
                          harga,
                          style: TextStyle(
                              fontFamily: 'Mulish',
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w800),
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
          );
  }
}
