import 'package:becca_sales/src/core/config/constant.dart';
import 'package:becca_sales/src/presentation/views/order/add_order_page.dart';
import 'package:becca_sales/src/presentation/views/order/order_detail_page.dart';
import 'package:flutter/material.dart';

import '../../../core/config/theme_colors.dart';
import '../../widgets/text_field_widget.dart';

class SalesOrderListPage extends StatefulWidget {
  static const String routeName = '/sales_order_list_page';

  const SalesOrderListPage({super.key});

  @override
  State<SalesOrderListPage> createState() => _SalesOrderListPageState();
}

class _SalesOrderListPageState extends State<SalesOrderListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sales Order List"),
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
                  return CardListSalesOrder();
                }),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AddOrderPage.routeName);
        },
        child: Icon(
          Icons.add,
          size: 32,
          color: Colors.white,
        ),
        backgroundColor: themeBlue,
      ),
    );
  }
}

class CardListSalesOrder extends StatelessWidget {
  const CardListSalesOrder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, OrderDetailPage .routeName);
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
              "PT MULIA JAYA",
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
                  "CP : Inneke",
                  style: TextStyle(
                    fontSize: 12,
                    color: ThemeColors.greyCaption,
                    fontWeight: FontWeight.w300,
                  ),
                )),
                Text(
                  "Selvi",
                  style: TextStyle(
                    fontSize: 12,
                    color: ThemeColors.greyCaption,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Row(
              children: [
                Expanded(
                    child: Text(
                  "Phone : 081122224545",
                  style: TextStyle(
                    fontSize: 12,
                    color: ThemeColors.greyCaption,
                    fontWeight: FontWeight.w300,
                  ),
                )),
                Text(
                  "23-3-2023",
                  style: TextStyle(
                    fontSize: 12,
                    color: ThemeColors.greyCaption,
                    fontWeight: FontWeight.w300,
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
