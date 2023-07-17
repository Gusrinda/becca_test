import 'package:becca_sales/src/presentation/views/cart/cart_list_page.dart';
import 'package:becca_sales/src/presentation/views/order/order_widget.dart';
import 'package:becca_sales/src/presentation/views/product/product_favorite_page.dart';
import 'package:becca_sales/src/presentation/views/product/product_list_page.dart';
import 'package:flutter/material.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/config/constant.dart';
import '../../../core/config/theme_colors.dart';
import '../../widgets/hero_widget.dart';
import '../../widgets/text_field_widget.dart';
import '../tagihan/confirm_success_page.dart';

class AddOrderPage extends StatefulWidget {
  static const String routeName = '/add_order_page';

  const AddOrderPage({super.key});

  @override
  State<AddOrderPage> createState() => _AddOrderPageState();
}

class _AddOrderPageState extends State<AddOrderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Sales Order"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              shrinkWrap: true,
              children: [
                Row(
                  children: [
                    Expanded(flex: 1, child: SizedBox()),
                    OutlinedButton.icon(
                      onPressed: () {},
                      style: OutlinedButton.styleFrom(
                          foregroundColor: themeBlue,
                          backgroundColor: themeBlue,
                          side: BorderSide(color: themeBlue),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30)),
                          padding: EdgeInsets.symmetric(
                              vertical: 2, horizontal: 20)),
                      icon: Icon(
                        Icons.copy,
                        size: 12,
                        color: Colors.white,
                      ),
                      label: Text(
                        "Copy SO",
                        style: TextStyle(fontSize: 12, color: Colors.white),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                FormInputCustomerOrder(),
                SizedBox(
                  height: 8,
                ),
                Hero(
                  tag: 'Label-RowJudulAlamat',
                  flightShuttleBuilder: flightShuttleBuilder,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: FormTextLabel(
                          label: "Alamat",
                          labelColor: themeFontDefault,
                        ),
                      ),
                      Transform.scale(
                          scale: 0.75,
                          child: Checkbox(
                            fillColor: MaterialStateProperty.resolveWith(
                                (states) => themeBlue),
                            value: false,
                            onChanged: null,
                          )),
                      Text(
                        "Change Default",
                        style: TextStyle(
                            fontSize: 10,
                            color: themeBlue,
                            fontStyle: FontStyle.italic),
                      )
                    ],
                  ),
                ),
                // ignore: prefer_const_constructors
                Hero(
                  tag: 'Form-AlamatOrder',
                  flightShuttleBuilder: flightShuttleBuilder,
                  // ignore: prefer_const_constructors
                  child: Material(
                    color: Colors.transparent,
                    // ignore: prefer_const_constructors
                    child: FormzTextField(
                      readOnly: true,
                      maxLines: 3,
                      hintText: "input alamat",
                      textEditingController: TextEditingController(
                          text: null),
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                FormInputTipeEkspedisi(),
                SizedBox(
                  height: 8,
                ),
                FormInputEkspedisiOrder(),
                SizedBox(
                  height: 8,
                ),
                FormInputDepoOrder(),
                SizedBox(
                  height: 8,
                ),
                FormInputCatatanOrder(),
                SizedBox(
                  height: 8,
                ),
                FormInputDPPOrder(),
                SizedBox(height: 8,),
                Hero(
                  tag: 'Label-RowTotalPPN',
                  flightShuttleBuilder: flightShuttleBuilder,
                  child: FormTextLabel(
                    label: "Total PPN",
                    labelColor: themeFontDefault,
                  ),
                ),
                SizedBox(height: 4,),
                Row(
                  children: [
                    Expanded(
                      flex: 30,
                      child: FormzTextField(
                        readOnly: true,
                        textAlign: TextAlign.center,
                        textEditingController: TextEditingController(
                            text: "11%"),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      flex: 100,
                      child: FormzTextField(
                        textAlign: TextAlign.end,
                        hintText: "0",
                        textEditingController: TextEditingController(
                            text: null),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                FormInputGrandTotalOrder(),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          SafeArea(
            minimum: EdgeInsets.only(bottom: 32, left: 32, right: 32),
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: ButtonBottomOrder(
                          colorButton: themeBlue,
                          iconButton: Icons.add,
                          textButton: "Add Item",
                          onTapButton: () async {
                            Navigator.pushNamed(
                                context, ProductListPage.routeName);
                          },
                        )),
                    SizedBox(
                      width: 32,
                    ),
                    Expanded(
                        flex: 1,
                        child: ButtonBottomOrder(
                          colorButton: Color(0xFFEDB000),
                          iconButton: Icons.star,
                          textButton: "Add From Fav",
                          onTapButton: () async {
                            Navigator.pushNamed(
                                context, ProductFavoritePage.routeName);
                          },
                        )),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  children: [
                    Expanded(
                        flex: 1,
                        child: ButtonBottomOrder(
                          onTapButton: () async {
                            Navigator.pushNamed(
                                context, CartListPage.routeName);
                          },
                          colorButton: themeOrange,
                          iconButton: Icons.shopping_cart,
                          textButton: "Show Cart",
                        )),
                    SizedBox(
                      width: 32,
                    ),
                    Expanded(
                        flex: 1,
                        child: ButtonBottomOrder(
                          colorButton: themeGreen,
                          iconButton: Icons.check,
                          textButton: "Save",
                          onTapButton: () async {
                            final isOke = await handleFormSubmit(context);

                            if (isOke != null) {
                              if (isOke) {
                                Navigator.popAndPushNamed(
                                    context, ConfirmSuccessPage.routeName, arguments: "Order Berhasil Dibuat");
                              }
                            }
                          },
                        )),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  Future<bool?> handleFormSubmit(BuildContext context) async {
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
                const Text(
                  "Apakah anda yakin?",
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

class ButtonBottomOrder extends StatelessWidget {
  const ButtonBottomOrder({
    super.key,
    required this.textButton,
    this.onTapButton,
    required this.colorButton,
    required this.iconButton,
  });

  final String textButton;
  final VoidCallback? onTapButton;
  final Color colorButton;
  final IconData iconButton;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton.icon(
      onPressed: onTapButton,
      icon: Icon(
        iconButton,
        color: Colors.white,
        size: 14,
      ),
      label: Text(
        textButton,
        style: TextStyle(
            color: Colors.white, fontSize: 12, fontWeight: FontWeight.w400),
      ),
      style: OutlinedButton.styleFrom(
          backgroundColor: colorButton,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
          padding: EdgeInsets.symmetric(vertical: 8, horizontal: 20)),
    );
  }
}
