import 'package:becca_sales/src/presentation/views/tagihan/bayar_tagihan_page.dart';
import 'package:becca_sales/src/presentation/widgets/text_field_widget.dart';
import 'package:flutter/material.dart';

import '../../../core/config/constant.dart';
import '../../../core/config/theme_colors.dart';
import '../absensi/checkout_page.dart';
import 'confirm_success_page.dart';

class ListNotaPenagihanPage extends StatefulWidget {
  static const String routeName = '/list_nota_penagihan_page';

  const ListNotaPenagihanPage({super.key});

  @override
  State<ListNotaPenagihanPage> createState() => _ListNotaPenagihanPageState();
}

class _ListNotaPenagihanPageState extends State<ListNotaPenagihanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("List Nota Penagihan"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 12,
          ),
          Text(
            "PT MULIA JAYA",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),
          ),
          SizedBox(
            height: 8,
          ),
          Text(
            "PT-001",
            style: TextStyle(
                color: Colors.black, fontWeight: FontWeight.w600, fontSize: 16),
          ),
          const SizedBox(
            height: 24,
          ),
          Expanded(
            flex: 1,
            child: ListView.builder(
                shrinkWrap: true, //MUST TO ADDED
                //MUST TO ADDED
                itemCount: 4,
                itemBuilder: (BuildContext c, int index) {
                  return CardListNotaPenagihan(
                    isSelected: index == 0,
                  );
                }),
          ),
          SafeArea(
              minimum: EdgeInsets.only(bottom: 32, left: 32, right: 32),
              child: Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: OutlinedButton.icon(
                      onPressed: () async {
                        final alasanGagal = await handleFormAlasanGagal(
                            context);
                        print("ALASAN => ${alasanGagal}");

                        if (alasanGagal != null) {
                          Navigator.pushNamed(context, CheckOutPage.routeName, arguments: "Gagal Bayar").then((value) {
                            if (value != null) {
                              if (value == true) {
                                Navigator.popAndPushNamed(
                                    context, ConfirmSuccessPage.routeName,
                                arguments: "Permintaan Gagal Bayar Berhasil Dikirim!");
                              }
                            }
                          });

                        }

                      },
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.red,
                          side: BorderSide(color: Colors.red),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          padding: EdgeInsets.symmetric(vertical: 8)),
                      icon: Icon(
                        Icons.cancel,
                        color: Colors.red,
                      ),
                      label: Text(
                        "Gagal Bayar",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),

                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    flex: 1,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        Navigator.popAndPushNamed(context, BayarTagihanPage.routeName);
                      },
                      style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.white,
                          foregroundColor: Colors.green,
                          side: BorderSide(color: Colors.green),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          padding: EdgeInsets.symmetric(vertical: 8)),
                      icon: Icon(
                        Icons.check_circle,
                        color: Colors.green,
                      ),
                      label: Text(
                        "Bayar Semua",
                        style: TextStyle(
                            color: Colors.green,
                            fontSize: 14,
                            fontWeight: FontWeight.w400),
                      ),
                    ),

                  ),
                ],
              ))
        ],
      ),
    );
  }


  Future<String?> handleFormAlasanGagal(BuildContext context) async {
    final rxPickup = ValueNotifier('Belum Bayar');

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
                  "Alasan Gagal Bayar",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: themeFontDefault),
                ),
                SizedBox(
                  height: 16,
                ),
                Center(
                  child: Container(
                    padding: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: MediaQuery
                            .of(context)
                            .size
                            .width / 9),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...[
                          'Toko Tutup',
                          'Belum Bayar',
                          'Sudah Lunas',
                          'Reschedule'
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
                        onPressed: () => Navigator.pop(context, null),
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
                          Navigator.pop(context, rxPickup.value);
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

class CardListNotaPenagihan extends StatelessWidget {
  const CardListNotaPenagihan({
    super.key,
    required this.isSelected,
  });

  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      margin: EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Checkbox(
            value: isSelected,
            onChanged: null,
            activeColor: themeBlueBg,
            checkColor: Colors.white,
            fillColor: MaterialStateColor.resolveWith((states) => themeBlueBg),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: ThemeColors.greyCaption,
                        blurRadius: 1,
                        offset: Offset(0, 0.5))
                  ]),
              padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Expanded(
                          child: Text(
                            "S1-001",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.black,
                              fontWeight: FontWeight.w400,
                            ),
                          )),
                      Text(
                        "Rp 10.000.000",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
