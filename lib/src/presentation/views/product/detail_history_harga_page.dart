import 'package:becca_sales/src/core/utils/formatter.dart';
import 'package:becca_sales/src/presentation/widgets/text_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/config/constant.dart';

class DetailHistoryHargaPage extends StatefulWidget {
  const DetailHistoryHargaPage({super.key});

  static const String routeName = '/detail_history_harga_page';

  @override
  State<DetailHistoryHargaPage> createState() => _DetailHistoryHargaPageState();
}

class _DetailHistoryHargaPageState extends State<DetailHistoryHargaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Detail History Harga"),
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
                          judul: "Nama Produk",
                          subJudul: "Tali Tampar Sea Gull 8 mm - Per Roll 200 m ",
                          styleSubJudul: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 12),
                        ),

                        DivideBaris(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Kode PO",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: themeFontLight,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                "Tanggal",
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
                                  "PO-005",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                ),
                              ),

                              Text(
                                "15/05/2023",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w600,
                                    fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                        DivideBaris(),
                        TextListJudulSubJudul(
                          judul: "Harga",
                          subJudul: kBalanceFormat.format(300000),
                          styleSubJudul: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 12),
                        ),
                        DivideBaris(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            children: [
                              Expanded(
                                flex : 1,
                                child: TextListJudulSubJudul(
                                  padding: 0,
                                  judul: "Disc 1",
                                  subJudul: "10%",
                                  styleSubJudul: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                ),
                              ),
                              Expanded(
                                flex : 1,
                                child: TextListJudulSubJudul(
                                  padding: 0,
                                  judul: "Disc 2",
                                  subJudul: "-",
                                  styleSubJudul: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                ),
                              ),
                              Expanded(
                                flex : 1,
                                child: TextListJudulSubJudul(
                                  padding: 0,
                                  judul: "Disc 3",
                                  subJudul: "-",
                                  styleSubJudul: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                ),
                              ),
                              Expanded(
                                flex : 1,
                                child: TextListJudulSubJudul(
                                  padding: 0,
                                  judul: "Disc 4",
                                  subJudul: "-",
                                  styleSubJudul: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                ),
                              ),
                              Expanded(
                                flex : 1,
                                child: TextListJudulSubJudul(
                                  padding: 0,
                                  judul: "Disc 5",
                                  subJudul: "-",
                                  styleSubJudul: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12),
                                ),
                              ),

                            ],
                          ),
                        ),
                        DivideBaris(),
                        TextListJudulSubJudul(
                          judul: "Disc. Amount",
                          subJudul: "30.000",
                          styleSubJudul: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 12),
                        ),

                        DivideBaris(),
                        TextListJudulSubJudul(
                          judul: "Total Diskon",
                          subJudul: "30.000",
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
              child: ElevatedButton(
                onPressed: () async {
                  Navigator.pop(context);
                },
                child: Text(
                  "Kembali",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFFEEEEEE),

                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    padding: EdgeInsets.symmetric(vertical: 14)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
