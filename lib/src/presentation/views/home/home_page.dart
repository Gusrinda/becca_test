import 'package:becca_sales/src/core/config/constant.dart';
import 'package:becca_sales/src/core/config/theme_colors.dart';
import 'package:becca_sales/src/presentation/views/home/home_grid_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../../core/assets/assets.gen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage(Assets.images.bgBiru.path),
          fit: BoxFit.cover,
        )),
        child: SafeArea(
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.55,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        // height: 48,
                        child: Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(21)),
                              width: 42,
                              height: 42,
                              child: ClipRRect(
                                  borderRadius: BorderRadius.circular(35),
                                  child: Assets.images.profileBella
                                      .image(fit: BoxFit.cover)),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Halo,",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.white,
                                  ),
                                ),
                                // SizedBox(
                                //   height: 2,
                                // ),
                                Text(
                                  "Bella Santi",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 14,
                      ),
                      MenuRangkuman(),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        // height: 186,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(15)),
                          color: Colors.white12,
                        ),
                        padding:
                            EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Target Kamu",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.sp,
                                      fontWeight: FontWeight.w600),
                                ),
                                Text(
                                  "Juni 2023",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 10.sp,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 6,
                            ),
                            Container(
                              // height: 148,
                              decoration: BoxDecoration(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(15)),
                                  color: Colors.white),
                              child: ListView(
                                shrinkWrap: true,
                                children: [
                                  HomeCardListTarget(),
                                  HomeCardListTarget(),
                                  SizedBox(
                                    height: 12,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 20),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          "Lihat Lainnya >",
                                          style: TextStyle(
                                            fontSize: 10.sp,
                                            color: themeBlue,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 6,
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(30),
                          topLeft: Radius.circular(30)),
                      color: Colors.white),
                  child: ListView(
                    shrinkWrap: true,
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    children: [
                      SizedBox(height: 20,),
                      HomeMenuGridView(),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                        height: 140,
                        decoration: BoxDecoration(
                            color: themeBgCard,
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                        child: Stack(
                          children: [
                            Align(
                              alignment: AlignmentDirectional.topEnd,
                              child: Container(
                                height: 140,
                                child: Image.asset(
                                  Assets.images.imageCard.path,
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            Container(
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 10),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Image.asset(
                                      Assets.images.logoBecca.path,
                                      width: 30,
                                    ),
                                    SizedBox(
                                      height: 4,
                                    ),
                                    Text(
                                      "Plan Visit Selanjutnya",
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.black,
                                        fontWeight: FontWeight.w400,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Flexible(
                                      child: ListView(
                                        padding: EdgeInsets.zero,
                                        shrinkWrap: true,
                                        children: [
                                          Text(
                                            "• PT MULIA JAYA",
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                          Text(
                                            "• PT COBRA MAS",
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.black,
                                              fontWeight: FontWeight.w600,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 6,
                                    ),
                                    Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 12, vertical: 4),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.all(Radius.circular(20)),
                                          border:
                                              Border.all(color: Colors.black54)),
                                      child: Text(
                                        "Lihat lainnya  >",
                                        style: TextStyle(
                                          fontSize: 10.sp,
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: 70,),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class HomeCardListTarget extends StatelessWidget {
  const HomeCardListTarget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 16),
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          CircularPercentIndicator(
            radius: 20.0,
            lineWidth: 4.0,
            percent: 0.75,
            animation: true,
            center: Text(
              "75%",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 10.0),
            ),
            backgroundColor: Colors.grey,
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: Colors.blue,
          ),
          SizedBox(
            width: 16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Milliard Selang",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w600),
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Target",
                      style: TextStyle(
                          color: ThemeColors.greyCaption,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Terpenuhi",
                      style: TextStyle(
                          color: ThemeColors.greyCaption,
                          fontSize: 10.sp,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                SizedBox(
                  height: 2,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("5.000.000",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w400)),
                    Text("3.750.000",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 11.sp,
                            fontWeight: FontWeight.w400))
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class MenuRangkuman extends StatelessWidget {
  const MenuRangkuman({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      // height: 118,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(15)),
          color: Colors.white12),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Juni 2023",
            style: TextStyle(
              fontSize: 12.sp,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          SizedBox(
            height: 6,
          ),
          IntrinsicHeight(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  flex: 90,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Jumlah Order",
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "5",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "Lihat detail >",
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      )
                    ],
                  ),
                ),
                VerticalDivider(
                  thickness: 2,
                  color: Colors.white54,
                ),
                SizedBox(
                  width: 12,
                ),
                Expanded(
                  flex: 100,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Total Order",
                        style: TextStyle(
                          fontSize: 10.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Text(
                        "400.000.000",
                        style: TextStyle(
                          fontSize: 16.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: 6,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(CupertinoIcons.arrowtriangle_up_fill,
                              color: Colors.green, size: 10),
                          SizedBox(
                            width: 4,
                          ),
                          Text(
                            "5% dari bulan lalu",
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
