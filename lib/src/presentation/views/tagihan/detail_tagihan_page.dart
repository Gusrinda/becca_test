import 'package:becca_sales/src/presentation/views/tagihan/bayar_tagihan_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/config/constant.dart';
import '../../widgets/text_widget.dart';

class DetailTagihanPage extends StatefulWidget {
  static const String routeName = '/detail_tagihan_page';

  const DetailTagihanPage({super.key});

  @override
  State<DetailTagihanPage> createState() => _DetailTagihanPageState();
}

class _DetailTagihanPageState extends State<DetailTagihanPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Detail Tagihan"),
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
                        TextListJudulSubJudul(
                          judul: "No. Penagihan",
                          subJudul: "PT001",
                        ),
                        DivideBaris(),
                        TextListJudulSubJudul(
                          judul: "Nama Customer",
                          subJudul: "PT MULIA JAYA",
                        ),
                        DivideBaris(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Nama CP",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: themeFontLight,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                "No. HP",
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
                                  "Inneke",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                              OutlinedButton.icon(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                    foregroundColor: themeBlue,
                                    side: BorderSide(color: themeBlue),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(30)),
                                    padding: EdgeInsets.symmetric(vertical: 2, horizontal: 12)),
                                icon: Icon(
                                  Icons.copy,
                                  size: 12,
                                  color: themeBlue,
                                ),
                                label: Text(
                                  "Copy",
                                  style:
                                      TextStyle(fontSize: 12, color: themeBlue),
                                ),
                              ),
                              SizedBox(width: 8,),
                              Text(
                                "081122224545",
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
                          judul: "Piutang",
                          subJudul: "Rp 10.000.000",
                        ),
                        DivideBaris(),
                        TextListJudulSubJudul(
                          judul: "Piutang Terbayar",
                          subJudul: "Rp 7.500.000",
                        ),
                        DivideBaris(),
                        TextListJudulSubJudul(
                          judul: "Pembayaran Belum Confirm",
                          subJudul: "Rp 0",
                        ),
                        DivideBaris(),
                        TextListJudulSubJudul(
                          judul: "Sisa Piutang",
                          subJudul: "Rp 2.500.000",
                          styleSubJudul: TextStyle(
                              color: Colors.red,
                              fontWeight: FontWeight.w600,
                              fontSize: 12),
                        ),
                        DivideBaris(),
                        TextListJudulSubJudul(
                          judul: "Status Tagihan",
                          subJudul: "Belum Lunas",
                          styleSubJudul: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 12),
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
                  child: OutlinedButton(
                    onPressed: () async {
                      Navigator.pushNamed(context, BayarTagihanPage.routeName);
                    },
                    child: Text(
                      "Bayar",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    style: OutlinedButton.styleFrom(
                        backgroundColor: themeBlueBg,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        padding: EdgeInsets.symmetric(vertical: 8)),
                  )))
        ],
      ),
    );
  }
}

