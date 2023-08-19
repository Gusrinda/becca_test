import 'package:becca_sales/src/core/config/constant.dart';
import 'package:becca_sales/src/core/utils/formatter.dart';
import 'package:flutter/material.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/config/theme_colors.dart';
import '../../widgets/text_field_widget.dart';
import '../tagihan/confirm_success_page.dart';

class ListSOCopy extends StatefulWidget {


  static const String routeName = '/list_so_copy_page';

  const ListSOCopy({super.key});

  @override
  State<ListSOCopy> createState() => _ListSOCopyState();

}

class _ListSOCopyState extends State<ListSOCopy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("List SO"),
      ),
      body: Container(
        padding: EdgeInsets.all(32),
        child: Column(
          children: [

            SearchFieldGrayBar(
                hintText: "Search ...",
                fillColor: ThemeColors.grey6,
                onSubmitted: (value) {}),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              flex: 1,
              child: ListView.builder(
                  shrinkWrap: true, //MUST TO ADDED
                  itemCount: 3,
                  itemBuilder: (BuildContext c, int index) {
                    return CardListSO(
                      index: index,
                      isSelected: index == 0,
                      onTapCard: () {
                        // Navigator.pushNamed(context, DetailTagihanPage.routeName);
                      },
                    );
                  }),
            ),
            SafeArea(
              minimum: const EdgeInsets.fromLTRB(0, 0, 0, 20),
              child: Container(
                width: MediaQuery.of(context).size.width,
                child: ElevatedButton(
                  onPressed: () async {
                    final isOke = await handleFormSubmit(context);

                    if (isOke != null) {
                      if (isOke) {

                        Navigator.pop(context, true);
                        // Navigator.pushNamed(context, ConfirmSuccessPage.routeName,
                        //     arguments: "Konfirmasi Berhasil !").then((value) {
                        //
                        //   Navigator.popAndPushNamed(context, ResultConfirmDOPage.routeName);
                        //
                        // });
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: themeBlueBg,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30))),
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child: Text(
                      "Lanjut",
                      style: TextStyle(
                          fontSize: 16,
                          color: Colors.white,
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
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
                  "Apakah anda yakin ?",
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


class CardListSO extends StatelessWidget {
  const CardListSO({
    super.key,
    required this.isSelected,
    this.onTapCard,
    required this.index,
  });

  final int index;
  final bool isSelected;
  final VoidCallback? onTapCard;

  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: GestureDetector(
              onTap: onTapCard,
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
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
                              "DO-00${index + 1}",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                                fontWeight: FontWeight.w600,
                              ),
                            )),
                        Text(
                          kBalanceFormat.format(10000000),
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Text("PT. HUTAMA KARYA",
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.black,
                          fontWeight: FontWeight.w400,
                        )),

                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
