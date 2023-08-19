import 'dart:math';

import 'package:becca_sales/src/presentation/views/visiting/realisasi_visiting_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/config/constant.dart';
import '../../../core/config/theme_colors.dart';
import '../../widgets/text_widget.dart';

class DetailVisitingPage extends StatefulWidget {
  static const String routeName = '/detail_visiting_page';
  const DetailVisitingPage({super.key});

  @override
  State<DetailVisitingPage> createState() => _DetailVisitingPageState();
}

class _DetailVisitingPageState extends State<DetailVisitingPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Visiting Plan"),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  border: Border.all(
                    color: Color(0xFFAAD4FF),
                  )),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
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
                  Expanded(
                    flex: 1,
                    child: ListView(
                      shrinkWrap: true,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Nama Customer",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: themeFontLight,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                "Tanggal Visit",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: themeFontLight,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "PT MULIA JAYA",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),

                              Text(
                                "02/05/2023",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        DivideBaris(),
                        TextListJudulSubJudul(
                          judul: "Tujuan Visit",
                          subJudul: "Promosi Apk HRIS",
                        ),
                        DivideBaris(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Jam Mulai",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: themeFontLight,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                "Jam Selesai",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: themeFontLight,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "10:00 WIB",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),

                              Text(
                                "11:00 WIB",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        DivideBaris(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Tipe Visiting Plan",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: themeFontLight,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                "Kategori",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: themeFontLight,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 6,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 1,
                                child: Text(
                                  "Promosi ( On Site )",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),

                              Text(
                                "Planned",
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                        DivideBaris(),
                        TextListJudulSubJudul(
                          judul: "Catatan",
                          subJudul: "30 Audiens",
                        ),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
            minimum: EdgeInsets.only(bottom: 32, left: 32, right: 32),
            child: Container(
              width: MediaQuery.of(context).size.width,
              child: ElevatedButton(
                onPressed: () async {
                  // final isOke = await handleFormSubmit(context, "edit");
                  //
                  // if (isOke != null) {
                  //   if (isOke) {
                  //
                  //     Random random = new Random();
                  //
                  //     Navigator.pushNamed(context, RealisasiVisitingPage.routeName,
                  //         arguments: random.nextBool());
                  //   }
                  // }

                  Navigator.pop(context);

                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFEEEEEE),
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                      borderRadius:
                      BorderRadius.all(Radius.circular(30))),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: const Text('Kembali',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: Colors.black)),
                ),
              ),
            ),
            // child: Column(
            //   children: [
            //     Row(
            //       children: [
            //         Expanded(
            //           child: ElevatedButton(
            //             onPressed: ()async {
            //               final isOke = await handleFormSubmit(context, "delete");
            //
            //               if (isOke != null) {
            //                 if (isOke) {
            //                   Navigator.pop(context);
            //                 }
            //               }
            //             },
            //             style: ElevatedButton.styleFrom(
            //               backgroundColor: themeRed,
            //               elevation: 0,
            //               shape: RoundedRectangleBorder(
            //                   borderRadius:
            //                   BorderRadius.all(Radius.circular(20))),
            //             ),
            //             child: Padding(
            //               padding: const EdgeInsets.all(16),
            //               child: const Text('Delete',
            //                   style: TextStyle(
            //                       fontSize: 16,
            //                       fontWeight: FontWeight.w400,
            //                       color: Colors.white)),
            //             ),
            //           ),
            //         ),
            //         SizedBox(
            //           width: 32,
            //         ),
            //         Expanded(
            //           child: ElevatedButton(
            //             onPressed: () async {
            //               final isOke = await handleFormSubmit(context, "edit");
            //
            //               if (isOke != null) {
            //                 if (isOke) {
            //
            //                   Random random = new Random();
            //
            //                   Navigator.pushNamed(context, RealisasiVisitingPage.routeName,
            //                   arguments: random.nextBool());
            //                 }
            //               }
            //
            //             },
            //             style: ElevatedButton.styleFrom(
            //               backgroundColor: themeBlueBg,
            //               elevation: 0,
            //               shape: RoundedRectangleBorder(
            //                   borderRadius:
            //                   BorderRadius.all(Radius.circular(20))),
            //             ),
            //             child: Padding(
            //               padding: const EdgeInsets.all(16),
            //               child: const Text('Edit',
            //                   style: TextStyle(
            //                       fontSize: 16,
            //                       fontWeight: FontWeight.w400,
            //                       color: Colors.white)),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //
            //   ],
            // ),
          )
        ],
      ),
    );
  }

  Future<bool?> handleFormSubmit(BuildContext context, String tipeKonfirmasi) async {

    String message = tipeKonfirmasi == "edit" ? "Anda yakin akan mengubah data ini ?" :
    "Anda yakin menghapus data ini ?";

    return await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Container(
            padding: const EdgeInsets.fromLTRB(24, 48, 24, 16),
            constraints: const BoxConstraints(minWidth: 340),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image(image: AssetImage(Assets.images.confirmation.path)),
                const SizedBox(height: 16),
                const SizedBox(
                  height: 4,
                ),
                Text(
                  message,
                  style: TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: themeFontDefault),
                ),
                const SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context, false),
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                          backgroundColor: ThemeColors.neutral4,
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: themeFontDefault),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, true);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: themeBlueBg,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                              BorderRadius.all(Radius.circular(20))),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: const Text('Yes',
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

}
