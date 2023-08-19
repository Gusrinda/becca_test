import 'package:becca_sales/src/core/config/constant.dart';
import 'package:becca_sales/src/presentation/views/tagihan/list_nota_tagihan_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../../core/config/theme_colors.dart';
import '../../widgets/text_field_widget.dart';
import '../absensi/checkin_page.dart';

class ListKonfirmasiPage extends StatefulWidget {
  static const String routeName = '/list_konfirmasi_page';
  const ListKonfirmasiPage({super.key});

  @override
  State<ListKonfirmasiPage> createState() => _ListKonfirmasiPageState();
}

class _ListKonfirmasiPageState extends State<ListKonfirmasiPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("List Tagihan Terkonfirmasi"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(32, 16, 32, 0),
            child: SearchFieldGrayBar(
                hintText: "Search ...",
                fillColor: ThemeColors.grey6,
                onSubmitted: (value) {}),
          ),
          const SizedBox(
            height: 20,
          ),

          Expanded(
            flex: 1,
            child: ListView.builder(
              padding: EdgeInsets.symmetric(horizontal: 20),
                shrinkWrap: true, //MUST TO ADDED
                //MUST TO ADDED
                itemCount: 4,
                itemBuilder: (BuildContext c, int index) {
                  return  CardListKonfirmasi();
                }),
          ),
        ],
      ),
    );
  }
}

class CardListKonfirmasi extends StatelessWidget {
  const CardListKonfirmasi({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, CheckInPage.routeName, arguments: "Konfirmasi Tagihan").then((value) {
          if (value != null) {
            if (value == true) {
              Navigator.pushNamed(context, ListNotaPenagihanPage.routeName);
            }
          }
        });
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
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "PT Mulia Jaya",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          "30-04-2023",
                          style: TextStyle(
                              color: themeBlue,
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "Sisa Piutang",
                          style: TextStyle(
                              color: ThemeColors.greyCaption,
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w400),
                        ),
                        Text(
                          "Piutang",
                          style: TextStyle(
                              color: ThemeColors.greyCaption,
                              fontSize: 8.sp,
                              fontWeight: FontWeight.w400),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text("Rp.",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w400)),

                        Text("2.500.000",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600)),
                        Expanded(
                            flex: 1,
                            child: SizedBox()),
                        Text("Rp.",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 8.sp,
                                fontWeight: FontWeight.w400)),

                        Text("10.000.000",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 12.sp,
                                fontWeight: FontWeight.w600)),
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
