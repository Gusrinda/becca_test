import 'package:becca_sales/src/presentation/views/visiting/visiting_widget.dart';
import 'package:flutter/material.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/config/constant.dart';
import '../../../core/config/theme_colors.dart';
import '../../../core/utils/formatter.dart';
import '../../widgets/hero_widget.dart';
import '../../widgets/text_field_widget.dart';
import '../absensi/checkout_page.dart';
import '../tagihan/confirm_success_page.dart';

class EntryVisitingPage extends StatefulWidget {
  static const String routeName = '/entry_visiting_page';
  const EntryVisitingPage({super.key, required this.isPlannedVisiting});

  final bool isPlannedVisiting;

  @override
  State<EntryVisitingPage> createState() => _EntryVisitingPageState();
}

class _EntryVisitingPageState extends State<EntryVisitingPage> {
  @override
  Widget build(BuildContext context) {

    String keteranganPlan = widget.isPlannedVisiting ? "Planned" : "Unplanned";

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.isPlannedVisiting ? "Entry Visit Plan" : "Entry Unplanned Visit"),
      ),
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: ListView(
              shrinkWrap: true,
              padding: EdgeInsets.all(30),
              children: [

                FormInputVisitingCustomer(),
                SizedBox(
                  height: 16,
                ),
                FormInputVisitingTanggal(

                ),
                SizedBox(
                  height: 16,
                ),
                FormInputVisitingTujuan(),
                SizedBox(
                  height: 16,
                ),
                Hero(
                  tag: 'Label-RowJamVisiting',
                  flightShuttleBuilder: flightShuttleBuilder,
                  child: Row(
                    children: [
                      Expanded(
                        flex : 1,
                        child: FormTextLabel(
                          label: "Jam Mulai",
                          labelColor: themeFontDefault,
                        ),
                      ),
                      SizedBox(width: 20,),
                      Expanded(
                        flex : 1,
                        child: FormTextLabel(
                          label: "Jam Berakhir",
                          labelColor: themeFontDefault,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 4,),
                Row(
                  children: [
                    Expanded(
                      flex: 1,
                      child: FormzTextField(
                        textAlign: TextAlign.center,
                        textEditingController: TextEditingController(
                            text: kTimeFormat.format(DateTime.now())),
                        readOnly: true,
                        trailing: Icon(
                          Icons.access_time_filled,
                          color: themeBlueBg,
                        ),
                      ),
                    ),
                    SizedBox(width: 20,),
                    Expanded(
                      flex: 1,
                      child: FormzTextField(
                        textAlign: TextAlign.center,
                        textEditingController: TextEditingController(
                            text: kTimeFormat.format(DateTime.now().add(Duration(hours: 1)))),
                        readOnly: true,
                        trailing: Icon(
                          Icons.access_time_filled,
                          color: themeBlueBg,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 18,),
               Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 children: [
                  Icon(Icons.radio_button_checked, color: themeBlue,),
                  SizedBox(width: 4,),
                  Text(keteranganPlan)
                 ],
               ),
                SizedBox(height: 18,),
                FormInputTipeVisiting(),
                SizedBox(
                  height: 16,
                ),
                FormInputCatatanVisiting(),
              ],
            ),
          ),
          SafeArea(
              minimum: EdgeInsets.only(bottom: 32, left: 32, right: 32),
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: OutlinedButton(
                    onPressed: () async {
                      final isOke = await handleFormSubmit(context);

                      if (isOke != null) {
                        if (isOke) {

                          if (widget.isPlannedVisiting) {
                            Navigator.popAndPushNamed(
                                context, ConfirmSuccessPage.routeName, arguments: "Data berhasil disimpan!");

                          }   else {
                            Navigator.pushNamed(context, CheckOutPage.routeName, arguments: "Unplanned Visiting").then((value) {
                              if (value != null) {
                                if (value == true) {
                                  Navigator.popAndPushNamed(
                                      context, ConfirmSuccessPage.routeName,
                                      arguments: "Data berhasil disimpan!");
                                }
                              }
                            });
                          }

                        }
                      }
                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w700),
                    ),
                    style: OutlinedButton.styleFrom(
                        backgroundColor: themeBlueBg,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30)),
                        padding: EdgeInsets.symmetric(vertical: 12)),
                  )))
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
