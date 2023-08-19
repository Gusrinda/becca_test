import 'package:becca_sales/src/presentation/views/cart/cart_list_page.dart';
import 'package:becca_sales/src/presentation/views/order/list_so_copy.dart';
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
  bool isFromCopy = false;

  bool isCheckedProject = false;
  bool isCheckedDefault = false;

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
                    isFromCopy
                        ? Container(
                            decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                                border: Border.all(color: Colors.grey),
                                borderRadius: BorderRadius.circular(20)),
                            padding: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 8),
                            child: Text(
                              "SO-001",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                            ))
                        : SizedBox(),
                    Expanded(flex: 1, child: SizedBox()),
                    OutlinedButton.icon(
                      onPressed: () async {
                        final isOke = await Navigator.pushNamed(
                            context, ListSOCopy.routeName);

                        print("Hasil copy SO => $isOke");

                        if (isOke != null) {
                          if (isOke == true) {
                            setState(() {
                              isFromCopy = true;
                            });
                          }
                        }
                      },
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
                FormInputCustomerOrder(
                  input: isFromCopy ? "PT MULIA JAYA" : "",
                ),
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
                            value: isCheckedProject,
                            onChanged: (value) {
                              setState(() {
                                isCheckedProject = value!;
                              });
                            },
                          )),
                      Text(
                        "Project",
                        style: TextStyle(
                            fontSize: 10,
                            color: themeBlue,
                            fontStyle: FontStyle.italic),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Transform.scale(
                          scale: 0.75,
                          child: Checkbox(
                            fillColor: MaterialStateProperty.resolveWith(
                                (states) => themeBlue),
                            value: isCheckedDefault,
                            onChanged: (value) {
                              setState(() {
                                isCheckedDefault = value!;
                              });
                            },
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
                          text: isFromCopy
                              ? """JL CANDI LONTAR TENGAH 43 B NO. 1 
RT 03, RW 14
SURABAYA"""
                              : null),
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                FormInputTipeEkspedisi(
                  input: isFromCopy ? "Kontainer" : "",
                ),
                SizedBox(
                  height: 8,
                ),
                FormInputEkspedisiOrder(
                  input: isFromCopy ? "JNE" : "",
                ),
                SizedBox(
                  height: 8,
                ),
                FormInputDepoOrder(
                  input: isFromCopy ? "WH0001" : "",
                ),
                SizedBox(
                  height: 8,
                ),
                FormInputCatatanOrder(
                  input: isFromCopy ? "Catatan A" : "",
                ),
                SizedBox(
                  height: 8,
                ),
                // FormInputToPOrder(),
                // SizedBox(
                //   height: 8,
                // ),
                FormInputDPPOrder(
                  input: isFromCopy ? "24.314" : "",
                ),
                SizedBox(
                  height: 8,
                ),

                Hero(
                  tag: 'Label-RowTotalPPN',
                  flightShuttleBuilder: flightShuttleBuilder,
                  child: FormTextLabel(
                    label: "Total PPN",
                    labelColor: themeFontDefault,
                  ),
                ),
                SizedBox(
                  height: 4,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 30,
                      child: FormzTextField(
                        readOnly: true,
                        textAlign: TextAlign.center,
                        textEditingController:
                            TextEditingController(text: "11%"),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                    SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      flex: 100,
                      child: FormzTextField(
                        textAlign: TextAlign.end,
                        hintText: "0",
                        textEditingController: TextEditingController(
                          text: isFromCopy ? "2.676" : "",
                        ),
                        textInputAction: TextInputAction.next,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 8,
                ),
                FormInputGrandTotalOrder(
                  input: isFromCopy ? "27.000" : "",
                ),
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
                                context, ProductListPage.routeName,
                                arguments: true);
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
                            Navigator.pushNamed(context, CartListPage.routeName,
                                arguments: false);
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
                                    context, ConfirmSuccessPage.routeName,
                                    arguments: "Order Berhasil Dibuat");
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
