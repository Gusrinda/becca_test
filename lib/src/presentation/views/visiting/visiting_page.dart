import 'package:becca_sales/src/core/utils/formatter.dart';
import 'package:becca_sales/src/presentation/views/visiting/detail_visiting_page.dart';
import 'package:becca_sales/src/presentation/views/visiting/editing_visiting_page.dart';
import 'package:becca_sales/src/presentation/views/visiting/entry_visiting_page.dart';
import 'package:becca_sales/src/presentation/widgets/text_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/config/constant.dart';
import '../../../core/config/theme_colors.dart';
import '../../../core/model/visiting_list_model.dart';
import '../../../core/utils/bottom_sheets.dart';
import '../absensi/checkin_page.dart';

class VisitingPage extends StatefulWidget {
  const VisitingPage({super.key});

  @override
  State<VisitingPage> createState() => _VisitingPageState();
}

class _VisitingPageState extends State<VisitingPage> {
  final listVisitingDummy = [
    DummyVisitingModel(
        namaPT: "PT MULIA JAYA", isRealisasi: false, tipeVisiting: "Plan"),
    DummyVisitingModel(
        namaPT: "PT TIGA PUTERA", isRealisasi: true, tipeVisiting: "Unplanned"),
    DummyVisitingModel(
        namaPT: "PT MAKMUR ABADI", isRealisasi: true, tipeVisiting: "Plan")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Visiting List"),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: InkWell(
              onTap: () async {
                handleFormSort(context);
              },
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Container(
                      width: 36,
                      height: 36,
                      color: themeBlueBg,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: SvgPicture.asset(Assets.material.sortAscending),
                      ))),
            ),
          ),
          SizedBox(
            width: 12,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: InkWell(
              onTap: () async {
                handleFormFilter(context);
              },
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(60),
                  child: Container(
                      width: 36,
                      height: 36,
                      color: themeBlueBg,
                      child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: SvgPicture.asset(Assets.material.filter),
                      ))),
            ),
          ),
          SizedBox(
            width: 20,
          )
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Row(
                      children: [
                        Text(
                          "From",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          flex: 1,
                          child: FormzTextField(
                            textAlign: TextAlign.center,
                            textEditingController: TextEditingController(
                                text: kShortDateFormat.format(
                                    DateTime.now().add(Duration(days: -7)))),
                            readOnly: true,
                            trailing: Icon(
                              Icons.calendar_today_outlined,
                              color: Colors.grey,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 32,
                ),
                Expanded(
                  flex: 1,
                  child: Container(
                    child: Row(
                      children: [
                        Text(
                          "To",
                          style: TextStyle(
                            fontSize: 11,
                            fontWeight: FontWeight.w300,
                          ),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Expanded(
                          flex: 1,
                          child: FormzTextField(
                            textAlign: TextAlign.center,
                            textEditingController: TextEditingController(
                                text: kShortDateFormat.format(DateTime.now())),
                            readOnly: true,
                            trailing: Icon(
                              Icons.calendar_today_outlined,
                              color: Colors.grey,
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
          Expanded(
            flex: 1,
            child: ListView.builder(
                padding: EdgeInsets.symmetric(horizontal: 20),
                shrinkWrap: true, //MUST TO ADDED
                //MUST TO ADDED
                itemCount: listVisitingDummy.length,
                itemBuilder: (BuildContext c, int index) {
                  return CardListVisiting(
                    dataVisiting: listVisitingDummy[index],
                    onTapCallback: () async {
                      if (listVisitingDummy[index].isRealisasi) {
                        Navigator.pushNamed(
                            context, DetailVisitingPage.routeName);
                      } else {
                        final chooseRealisasi = await handleShowModalForm();

                        if (chooseRealisasi != null) {
                          print("CHOOSE REALISASI => ${chooseRealisasi}");
                          if (chooseRealisasi == "Edit Visit Plan") {
                            Navigator.pushNamed(
                                context, EditingVisitingPage.routeName,
                                arguments: {
                                  "isPlannedVisiting":
                                      listVisitingDummy[index].tipeVisiting,
                                  "isEditing": true
                                });
                          } else {
                            Navigator.pushNamed(context, CheckInPage.routeName,arguments: "Realisasi Visit")
                                .then((value) {
                              if (value != null) {
                                if (value == true) {
                                  Navigator.pushNamed(
                                      context, EditingVisitingPage.routeName,
                                      arguments: {
                                        "isPlannedVisiting":
                                            listVisitingDummy[index]
                                                .tipeVisiting,
                                        "isEditing": false
                                      });
                                }
                              }
                            });
                          }
                        }
                      }
                    },
                  );
                }),
          ),
          SafeArea(
            minimum: EdgeInsets.only(bottom: 32, left: 32, right: 32),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(context, CheckInPage.routeName, arguments: "Unplanned Visit")
                              .then((value) {
                            if (value != null) {
                              if (value == true) {
                                Navigator.pushNamed(
                                    context, EntryVisitingPage.routeName,
                                    arguments: false);
                              }
                            }
                          });
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: themeRed,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: const Text('Unplanned',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white)),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 32,
                    ),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pushNamed(
                              context, EntryVisitingPage.routeName,
                              arguments: true);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: themeGreen,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(30))),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16),
                          child: const Text('Plan',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.white)),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<String?> handleShowModalForm() {
    final rxPickup = ValueNotifier('Edit Visit Plan');

    return showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
        top: Radius.circular(20),
      )),
      builder: (BuildContext context) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 50),
          decoration: BoxDecoration(
            borderRadius: kModalBottomShape.borderRadius,
            color: Colors.white,
          ),
          width: MediaQuery.of(context).size.width,
          child: Wrap(
            children: [
              SizedBox(
                height: 48,
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: MediaQuery.of(context).size.width / 9),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ...['Edit Visit Plan', 'Realisasi Visit'].map((pickup) {
                        return ValueListenableBuilder<String>(
                          valueListenable: rxPickup,
                          builder: (context, groupValue, child) {
                            return RadioListTile(
                              contentPadding: EdgeInsets.all(0),
                              value: pickup,
                              activeColor: themeBlue,
                              groupValue: groupValue,
                              onChanged: (value) => rxPickup.value = value!,
                              title: Text(
                                pickup,
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: themeBlack),
                              ),
                            );
                          },
                        );
                      }),
                    ],
                  ),
                ),
              ),
              SafeArea(
                minimum: EdgeInsets.fromLTRB(0, 20, 0, 48),
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: themeBlueBg,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30))),
                      onPressed: () {
                        Navigator.pop(context, rxPickup.value);
                      },
                      child: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 14),
                        child: Text(
                          "Lanjut",
                        ),
                      )),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Future<String?> handleFormSort(BuildContext context) async {
    final rxPickup = ValueNotifier('Terbaru');

    return await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(24, 40, 24, 20),
            constraints: const BoxConstraints(minWidth: 340),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Choose Sort By",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: themeFontDefault),
                ),
                SizedBox(
                  height: 24,
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: MediaQuery.of(context).size.width / 9),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...['Terbaru', 'Terlama'].map((pickup) {
                          return ValueListenableBuilder<String>(
                            valueListenable: rxPickup,
                            builder: (context, groupValue, child) {
                              return RadioListTile(
                                contentPadding: EdgeInsets.all(0),
                                value: pickup,
                                activeColor: themeBlueBg,
                                groupValue: groupValue,
                                onChanged: (value) => rxPickup.value = value!,
                                title: Text(
                                  pickup,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: themeBlack),
                                ),
                              );
                            },
                          );
                        }),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context, "false"),
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
                    SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, "true");
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
                          child: const Text('OK',
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

  Future<String?> handleFormFilter(BuildContext context) async {
    final rxPickup = ValueNotifier('Terealisasi');

    return await showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(20)),
          ),
          child: Container(
            padding: EdgeInsets.fromLTRB(24, 40, 24, 20),
            constraints: const BoxConstraints(minWidth: 340),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "Choose Sort By",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: themeFontDefault),
                ),
                SizedBox(
                  height: 24,
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: MediaQuery.of(context).size.width / 9),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...[
                          'Terealisasi',
                          'Belum Terealisasi',
                          'Tidak Terealisasi',
                          'Planned',
                          'Unplanned'
                        ].map((pickup) {
                          return ValueListenableBuilder<String>(
                            valueListenable: rxPickup,
                            builder: (context, groupValue, child) {
                              return RadioListTile(
                                contentPadding: EdgeInsets.all(0),
                                value: pickup,
                                activeColor: themeBlueBg,
                                groupValue: groupValue,
                                onChanged: (value) => rxPickup.value = value!,
                                title: Text(
                                  pickup,
                                  style: TextStyle(
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400,
                                      color: themeBlack),
                                ),
                              );
                            },
                          );
                        }),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 24,
                ),
                Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () => Navigator.pop(context, "false"),
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
                    SizedBox(width: 16),
                    Expanded(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, "true");
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
                          child: const Text('OK',
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

class CardListVisiting extends StatelessWidget {
  const CardListVisiting({
    super.key,
    required this.dataVisiting,
    this.onTapCallback,
  });

  final DummyVisitingModel dataVisiting;
  final VoidCallback? onTapCallback;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapCallback,
      child: Container(
        margin: EdgeInsets.only(bottom: 18),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: ThemeColors.greyCaption,
                  blurRadius: 1,
                  offset: Offset(0, 0.5))
            ]),
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 100,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Text(
                    dataVisiting.namaPT,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    "Promosi (On Site)",
                    style: TextStyle(
                      fontSize: 11,
                      color: Colors.grey,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 75,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    dataVisiting.tipeVisiting == "Plan"
                        ? "Planned : 23-03-2023"
                        : "Unplanned",
                    style: TextStyle(
                      fontSize: 11,
                      color: dataVisiting.tipeVisiting == "Plan"
                          ? ThemeColors.greyCaption
                          : Colors.red,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    dataVisiting.isRealisasi
                        ? "Realisasi : 30-04-2023"
                        : "Belum Terealisasi",
                    style: TextStyle(
                      fontSize: 11,
                      color: ThemeColors.greyCaption,
                      fontWeight: FontWeight.w300,
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
