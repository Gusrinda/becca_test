import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/config/theme_colors.dart';
import '../../widgets/text_field_widget.dart';

class OrderPage extends StatefulWidget {
  static const String routeName = '/order_page';

  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("List Order"),
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
          ListView(
            padding: EdgeInsets.all(0),
            shrinkWrap: true,
            children: [
              CardListOrder(
                tanggal: "03/06/2023",
                sizeList: 2,
              ),
              CardListOrder(
                tanggal: "02/06/2023",
                sizeList: 3,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class CardListOrder extends StatelessWidget {
  final String? tanggal;
  final int? sizeList;

  const CardListOrder({
    super.key,
    this.tanggal,
    this.sizeList,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            tanggal ?? "01/01/2000",
            style: TextStyle(
              fontSize: 10.sp,
              color: ThemeColors.greyCaption,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          ListView.builder(
              shrinkWrap: true, //MUST TO ADDED
              physics: NeverScrollableScrollPhysics(), //MUST TO ADDED
              itemCount: sizeList ?? 1,
              itemBuilder: (BuildContext c, int index) {
                final listNama = [
                  'Milliard Selang',
                  'Rucika Pipa',
                  'Seagull Tali'
                ];
                final listHarga = ['3.750.000', '2.000.000', '1.500.000'];

                return RowListOrder(
                  namaOrder: listNama[index],
                  hargaOrder: listHarga[index],
                );
              })
        ],
      ),
    );
  }
}

class RowListOrder extends StatelessWidget {
  final String? namaOrder;
  final String? hargaOrder;

  const RowListOrder({
    super.key,
    this.namaOrder,
    this.hargaOrder,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              namaOrder?? "Order X",
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600),
            ),
            Text(
              hargaOrder?? "0",
              style: TextStyle(
                  color: Colors.green,
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w600),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Divider(
          thickness: 1,
          color: ThemeColors.greyCaption,
        )
      ],
    );
  }
}
