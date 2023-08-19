import 'package:becca_sales/src/presentation/views/cart/cart_list_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../core/config/constant.dart';
import '../../widgets/text_widget.dart';

class OrderDetailPage extends StatefulWidget {
  static const String routeName = '/order_detail_page';

  const OrderDetailPage({super.key});

  @override
  State<OrderDetailPage> createState() => _OrderDetailPageState();
}

class _OrderDetailPageState extends State<OrderDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Detail Order"),
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
                          judul: "Nama Customer",
                          subJudul: "PT MULIA JAYA",
                        ),
                        DivideBaris(),
                        TextListJudulSubJudul(
                          judul: "Alamat",
                          subJudul: "JL CANDI LONTAR TENGAH 43 B NO. 1 RT 03, RW 14 SURABAYA",
                        ),
                        DivideBaris(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Tipe Ekspedisi",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: themeFontLight,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                "Ekspedisi",
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
                                  "Kontainer",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),

                              Text(
                                "JNE",
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
                          judul: "Depo",
                          subJudul: "WH001",
                        ),
                        DivideBaris(),
                        TextListJudulSubJudul(
                          judul: "Catatan",
                          subJudul: "Catatan A",
                        ),
                        DivideBaris(),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "DPP",
                                style: TextStyle(
                                  fontSize: 11,
                                  color: themeFontLight,
                                  fontWeight: FontWeight.w300,
                                ),
                              ),
                              Text(
                                "Pajak",
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
                                  "24.314",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),

                              Text(
                                "11%",
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
                          judul: "Grand Total",
                          subJudul: "27.000",
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
              child: OutlinedButton.icon(
                onPressed: () async {
                  Navigator.pushNamed(context, CartListPage.routeName, arguments: true);
                },
                icon: Icon(Icons.shopping_cart, color: Colors.white,),
                label: Text(
                  "Show Cart",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.w600),
                ),
                style: OutlinedButton.styleFrom(
                    backgroundColor: themeOrange,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)),
                    padding: EdgeInsets.symmetric(vertical: 8)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
