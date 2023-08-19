import 'package:becca_sales/src/core/model/argument_detail_product.dart';
import 'package:becca_sales/src/presentation/views/product/product_detail_page.dart';
import 'package:becca_sales/src/presentation/widgets/chip_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/config/constant.dart';
import '../../../core/config/theme_colors.dart';
import '../../widgets/text_field_widget.dart';

class CartListPage extends StatefulWidget {
  static const String routeName = '/cart_list_page';

  const CartListPage({super.key, required this.fromSO});

  final bool fromSO;

  @override
  State<CartListPage> createState() => _CartListPageState();
}

class _CartListPageState extends State<CartListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: SafeArea(
          child: Container(
            height: kToolbarHeight,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Isi Keranjang",
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Colors.black,
                      fontSize: 16.sp),
                ),
                const SizedBox(
                  width: 4,
                ),
                const Icon(
                  Icons.shopping_cart,
                  color: Color(0xFFFFBE02),
                )
              ],
            ),
          ),
        ),
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
                shrinkWrap: true, //MUST TO ADDED
                //MUST TO ADDED
                itemCount: 2,
                itemBuilder: (BuildContext c, int index) {
                  return ListCartItem(
                    isFromSO: widget.fromSO,
                  );
                }),
          ),
        ],
      ),
    );
  }
}

class ListCartItem extends StatelessWidget {
  const ListCartItem({
    super.key,
    required this.isFromSO,
  });

  final bool isFromSO;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        var argumentDetail = DetailProductArgument(
            isReadOnly: isFromSO, isOrder: false, isCart: true);

        Navigator.pushNamed(context, DetailProductPage.routeName,
            arguments: argumentDetail);
      },
      child: Container(
        child: Column(
          children: [
            Slidable(
              // Specify a key if the Slidable is dismissible.
              key: ValueKey(0),
              enabled: !isFromSO,
              // The end action pane is the one at the right or the bottom side.
              endActionPane: ActionPane(
                extentRatio: 0.25,
                motion: BehindMotion(),
                children: [
                  SlidableAction(
                    onPressed: null,
                    backgroundColor: Colors.redAccent,
                    foregroundColor: Colors.white,
                    icon: FontAwesomeIcons.trashCan,
                  ),
                ],
              ),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 42, vertical: 20),
                child: Row(
                  children: [
                    Container(
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.redAccent,
                          image: DecorationImage(
                              image: AssetImage(Assets.images.produk1.path),
                              fit: BoxFit.cover)),
                    ),
                    SizedBox(
                      width: 14,
                    ),
                    Expanded(
                        flex: 1,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Tali Tampar Sea Gull 8 mm",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: 4,
                            ),
                            Row(
                              children: [
                                Text(
                                  "Rp 300.000",
                                  style: TextStyle(
                                    fontSize: 10,
                                    color: ThemeColors.greyCaption,
                                    decoration: TextDecoration.lineThrough,
                                  ),
                                ),
                                SizedBox(
                                  width: 4,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Text(
                                    "Rp 290.000",
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                      color: ThemeColors.red,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 8,
                            ),
                            Row(
                              children: [
                                Expanded(flex: 1, child: SizedBox()),
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    padding: EdgeInsets.all(3),
                                    decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xFFD9D9D9)),
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white,
                                    ),
                                    child: IntrinsicHeight(
                                      child: Row(
                                        children: [
                                          SizedBox(
                                            width: 4,
                                          ),
                                          InkWell(
                                              onTap: () {},
                                              child: Icon(
                                                Icons.remove,
                                                color: themeBlueBg,
                                                size: 10,
                                              )),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 2),
                                            child: VerticalDivider(
                                              thickness: 1,
                                              color: Color(0xFFD9D9D9),
                                            ),
                                          ),
                                          Expanded(
                                            flex: 1,
                                            child: Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 3),
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 3, vertical: 2),
                                              child: Center(
                                                child: Text(
                                                  '5',
                                                  style: TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 12),
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                vertical: 2),
                                            child: VerticalDivider(
                                              thickness: 1,
                                              color: Color(0xFFD9D9D9),
                                            ),
                                          ),
                                          InkWell(
                                              onTap: () {},
                                              child: Icon(
                                                Icons.add,
                                                color: themeBlueBg,
                                                size: 10,
                                              )),
                                          SizedBox(
                                            width: 4,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 6,
                                ),
                                ColorChip(
                                  "ROL",
                                  color: Colors.grey,
                                )
                              ],
                            ),
                          ],
                        ))
                  ],
                ),
              ),
            ),
            Container(
              height: 8,
              color: Color(0xFFF0F3F8),
            )
          ],
        ),
      ),
    );
  }
}
