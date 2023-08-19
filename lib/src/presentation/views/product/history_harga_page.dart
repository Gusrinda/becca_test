import 'package:becca_sales/src/core/utils/formatter.dart';
import 'package:becca_sales/src/presentation/views/product/detail_history_harga_page.dart';
import 'package:flutter/material.dart';

import '../../../core/config/theme_colors.dart';
import '../order/order_detail_page.dart';

class HistoryHargaPage extends StatefulWidget {
  static const String routeName = '/history_harga_page';

  const HistoryHargaPage({super.key});

  @override
  State<HistoryHargaPage> createState() => _HistoryHargaPageState();
}

class _HistoryHargaPageState extends State<HistoryHargaPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("List History Harga"),
      ),
      body: Container(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            Text(
              "Nama Produk",
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 4,),
            Text(
              "Tali Tampar Sea Gull 8 mm - Per Roll 200 m",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Expanded(
              flex: 1,
              child: ListView.builder(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  shrinkWrap: true, //MUST TO ADDED
                  //MUST TO ADDED
                  itemCount: 4,
                  itemBuilder: (BuildContext c, int index) {
                    return CardListHistoryHarga(index: 8 -index,);
                  }),
            ),
          ],
        ),
      ),
    );
  }
}

class CardListHistoryHarga extends StatelessWidget {
  const CardListHistoryHarga({
    super.key, required this.index,
  });
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, DetailHistoryHargaPage.routeName);
      },
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
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "PO-00${index}",
              style: TextStyle(
                fontSize: 12,
                color: Colors.black,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                  "Tanggal",
                  style: TextStyle(
                    fontSize: 10,
                    color: ThemeColors.greyCaption,
                    fontWeight: FontWeight.w300,
                  ),
                )),
                Text(
                  "Disc. Amount",
                  style: TextStyle(
                    fontSize: 10,
                    color: ThemeColors.greyCaption,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                  "15/0${index}/2023",
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                )),
                Text(
                  kBalanceFormat.format(18750 + index * 1000),
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
