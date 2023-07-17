import 'package:becca_sales/src/presentation/views/target/detail_target_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../core/config/theme_colors.dart';
import '../../widgets/text_field_widget.dart';

class TargetPage extends StatefulWidget {
  static const String routeName = '/target_page';

  const TargetPage({super.key});

  @override
  State<TargetPage> createState() => _TargetPageState();
}

class _TargetPageState extends State<TargetPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("List Target"),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 32, vertical: 20),
        children: [
          SearchFieldGrayBar(
              hintText: "Search ...",
              fillColor: ThemeColors.grey6,
              onSubmitted: (value) {}),
          const SizedBox(
            height: 20,
          ),
          ListView.builder(
              shrinkWrap: true, //MUST TO ADDED
              physics: NeverScrollableScrollPhysics(), //MUST TO ADDED
              itemCount: 5,
              itemBuilder: (BuildContext c, int index) {
                return CardListTarget();
              })
        ],
      ),
    );
  }
}

class CardListTarget extends StatelessWidget {
  const CardListTarget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailTargetPage.routeName);
      },
      child: Card(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(8))),
        elevation: 1,
        margin: EdgeInsets.only(bottom: 18),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              CircularPercentIndicator(
                radius: 30.0,
                lineWidth: 7.0,
                percent: 0.75,
                animation: true,
                center: Text(
                  "75%",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 12.sp),
                ),
                backgroundColor: Colors.grey,
                circularStrokeCap: CircularStrokeCap.round,
                progressColor: Colors.blue,
              ),
              SizedBox(
                width: 20,
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
        ),
      ),
    );
  }
}
