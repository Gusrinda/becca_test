import 'package:becca_sales/src/core/config/constant.dart';
import 'package:becca_sales/src/core/utils/formatter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../../core/config/theme_colors.dart';
import '../../../core/model/TargetBulan.dart';

class DetailTargetPage extends StatefulWidget {
  static const String routeName = '/detail_target_page';

  const DetailTargetPage({super.key});

  @override
  State<DetailTargetPage> createState() => _DetailTargetPageState();
}

class _DetailTargetPageState extends State<DetailTargetPage> {
  @override
  Widget build(BuildContext context) {
    List<TargetBulan> daftarTarget = [
      TargetBulan(target: 4000000, terpenuhi: 2500000),
      TargetBulan(target: 3000000, terpenuhi: 250000),
      TargetBulan(target: 2000000, terpenuhi: 3000000),
      TargetBulan(target: 6000000, terpenuhi: 5000000),
      TargetBulan(target: 5000000, terpenuhi: 2750000),
      TargetBulan(target: 2000000, terpenuhi: 700000),
      TargetBulan(target: 5000000, terpenuhi: 500000),
      TargetBulan(target: 1500000, terpenuhi: 1500000),
      TargetBulan(target: 4000000, terpenuhi: 2300000),
      TargetBulan(target: 6000000, terpenuhi: 5400000),
      TargetBulan(target: 4000000, terpenuhi: 3560000),
      TargetBulan(target: 8000000, terpenuhi: 2500000),
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Target"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                    color: Color(0xFFAAD4FF),
                  )),
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10),
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      color: Color(0xFFAAD4FF),
                      height: 16,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            CupertinoIcons.circle_fill,
                            size: 6,
                            color: Color(0xFF79BBFF),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Icon(
                            CupertinoIcons.circle_fill,
                            size: 6,
                            color: Color(0xFF79BBFF),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          Icon(
                            CupertinoIcons.circle_fill,
                            size: 6,
                            color: Color(0xFF79BBFF),
                          ),
                          SizedBox(
                            width: 8,
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Merk",
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: themeFontLight,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          "Group 1",
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: themeFontLight,
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "MILLIARD",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: themeFontDefault,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "Selang",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: themeFontDefault,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 16),
                    child: Divider(
                      thickness: 1,
                      color: Colors.black26,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Target 2022",
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: themeFontLight,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        Text(
                          "Terpenuhi",
                          style: TextStyle(
                            fontSize: 11.sp,
                            color: themeFontLight,
                            fontWeight: FontWeight.w300,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "25.000.000",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: themeFontDefault,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          "15.000.000",
                          style: TextStyle(
                            fontSize: 12.sp,
                            color: themeFontDefault,
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16),
              child: Text(
                "Target Bulanan",
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            Divider(
              thickness: 1,
              color: Colors.black26,
            ),
            SizedBox(
              height: 18,
            ),
            Expanded(
              child: ListView.builder(
                  shrinkWrap: true, //MUST TO ADDED
                  itemCount: daftarTarget.length,
                  itemBuilder: (BuildContext c, int index) {
                    return CardTargetBulan(
                      indexBulan: index + 1,
                      targetBulan: daftarTarget[index],
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}

class CardTargetBulan extends StatelessWidget {
  final TargetBulan targetBulan;
  final int indexBulan;

  const CardTargetBulan({
    super.key,
    required this.targetBulan,
    required this.indexBulan,
  });

  @override
  Widget build(BuildContext context) {
    double persentase = targetBulan.terpenuhi * 100 / targetBulan.target;

    double persentaseKecil = persentase / 100;

    Color color;

    if (persentase == 0) {
      color = Colors.grey;
    } else if (persentase > 0 && persentase <= 50) {
      color = Colors.redAccent;
    } else if (persentase > 50 && persentase <= 75) {
      color = Colors.orangeAccent;
    } else {
      color = Colors.lightGreenAccent;
    }

    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Row(
        mainAxisSize: MainAxisSize.max,
        children: [
          CircularPercentIndicator(
            radius: 30.0,
            lineWidth: 6.0,
            percent: 1,
            // animation: true,
            center: Text(
              DateFormat("MMM", "id_ID").format(DateTime(0, indexBulan)),
              style: TextStyle(fontWeight: FontWeight.w400, fontSize: 12.sp),
            ),
            backgroundColor: Colors.grey,
            circularStrokeCap: CircularStrokeCap.round,
            progressColor: color,
          ),
          SizedBox(
            width: 20,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Target",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      kBalanceFormat.format(targetBulan.target),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 10),
                    child: LinearPercentIndicator(
                      animation: true,
                      percent: persentaseKecil > 1 ? 1 : persentaseKecil,
                      padding: EdgeInsets.all(0),
                      lineHeight: 10,
                      barRadius: Radius.circular(10),
                      progressColor: Color(0xFF2F80ED),
                      backgroundColor: Color(0xFFEEEEEE),
                    )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(kBalanceFormat.format(targetBulan.terpenuhi),
                        style: TextStyle(
                            color: ThemeColors.greyCaption,
                            fontSize: 10.sp,
                            fontWeight: FontWeight.w400)),
                    Text("${persentase.toStringAsFixed(2)}%",
                        style: TextStyle(
                            color: ThemeColors.greyCaption,
                            fontSize: 10.sp,
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
