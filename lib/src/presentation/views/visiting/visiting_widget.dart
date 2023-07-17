import 'package:becca_sales/src/core/utils/formatter.dart';
import 'package:flutter/material.dart';

import '../../../core/config/constant.dart';
import '../../widgets/hero_widget.dart';
import '../../widgets/text_field_widget.dart';

class FormInputVisitingCustomer extends StatelessWidget {
  const FormInputVisitingCustomer({
    Key? key,
    this.enabled = true,
    this.input = "",
    this.onTap,
  }) : super(key: key);

  final bool enabled;
  final String input;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const Hero(
          tag: 'Label-CustomerVisiting',
          flightShuttleBuilder: flightShuttleBuilder,
          child: FormTextLabel(
            label: "Nama Customer",
            labelColor: themeFontDefault,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        // ignore: prefer_const_constructors
        Hero(
          tag: 'Form-CustomerVisiting',
          flightShuttleBuilder: flightShuttleBuilder,
          // ignore: prefer_const_constructors
          child: Material(
            color: Colors.transparent,
            // ignore: prefer_const_constructors
            child: FormzTextField(
              readOnly: true,
              enabled: enabled,
              trailing: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(Icons.keyboard_arrow_down_rounded, color: themeBlue,),
              ),
              hintText: "pilih customer",
              onTap: onTap,
              textEditingController: TextEditingController(
                  text: null),
              textInputAction: TextInputAction.next,
            ),
          ),
        )
      ],
    );
  }
}

class FormInputVisitingTanggal extends StatelessWidget {
  const FormInputVisitingTanggal({
    Key? key,
    this.enabled = true,
    this.input = "",
    this.onTap,
  }) : super(key: key);

  final bool enabled;
  final String input;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const Hero(
          tag: 'Label-tanggalVisiting',
          flightShuttleBuilder: flightShuttleBuilder,
          child: FormTextLabel(
            label: "Tanggal",
            labelColor: themeFontDefault,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        // ignore: prefer_const_constructors
        Hero(
          tag: 'Form-tanggalVisiting',
          flightShuttleBuilder: flightShuttleBuilder,
          // ignore: prefer_const_constructors
          child: Material(
            color: Colors.transparent,
            // ignore: prefer_const_constructors
            child: FormzTextField(
              readOnly: true,
              trailing: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(Icons.calendar_today, color: themeBlue,),
              ),
              hintText: "pilih tanggal",
              onTap: onTap,
              textEditingController: TextEditingController(
                  text: kFullDateFormat.format(DateTime.now().add(Duration(days: 1)))),
              textInputAction: TextInputAction.next,
            ),
          ),
        )
      ],
    );
  }
}

class FormInputVisitingTujuan extends StatelessWidget {
  const FormInputVisitingTujuan({
    Key? key,
    this.enabled = true,
    this.input = "",
    this.onTap,
  }) : super(key: key);

  final bool enabled;
  final String input;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const Hero(
          tag: 'Label-TujuanVisiting',
          flightShuttleBuilder: flightShuttleBuilder,
          child: FormTextLabel(
            label: "Tujuan Visiting",
            labelColor: themeFontDefault,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        // ignore: prefer_const_constructors
        Hero(
          tag: 'Form-TujuanVisiting',
          flightShuttleBuilder: flightShuttleBuilder,
          // ignore: prefer_const_constructors
          child: Material(
            color: Colors.transparent,
            // ignore: prefer_const_constructors
            child: FormzTextField(
              enabled: enabled,
              readOnly: true,
              trailing: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(Icons.keyboard_arrow_down_rounded, color: themeBlue,),
              ),
              hintText: "pilih tujuan",
              onTap: onTap,
              textEditingController: TextEditingController(
                  text: null),
              textInputAction: TextInputAction.next,
            ),
          ),
        )
      ],
    );
  }
}

class FormInputTipeVisiting extends StatelessWidget {
  const FormInputTipeVisiting({
    Key? key,
    this.enabled = true,
    this.input = "",
    this.onTap,
  }) : super(key: key);

  final bool enabled;
  final String input;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const Hero(
          tag: 'Label-TipeVisiting',
          flightShuttleBuilder: flightShuttleBuilder,
          child: FormTextLabel(
            label: "Tipe Visiting",
            labelColor: themeFontDefault,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        // ignore: prefer_const_constructors
        Hero(
          tag: 'Form-TipeVisiting',
          flightShuttleBuilder: flightShuttleBuilder,
          // ignore: prefer_const_constructors
          child: Material(
            color: Colors.transparent,
            // ignore: prefer_const_constructors
            child: FormzTextField(
              readOnly: true,
              trailing: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(Icons.keyboard_arrow_down_rounded, color: themeBlue,),
              ),
              hintText: "pilih tipe",
              onTap: onTap,
              textEditingController: TextEditingController(
                  text: null),
              textInputAction: TextInputAction.next,
            ),
          ),
        )
      ],
    );
  }
}

class FormInputCatatanVisiting extends StatelessWidget {
  const FormInputCatatanVisiting({
    Key? key,
    this.enabled = true,
    this.input = "",
    this.onTap,
  }) : super(key: key);

  final bool enabled;
  final String input;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      // ignore: prefer_const_literals_to_create_immutables
      children: [
        const Hero(
          tag: 'Label-CatatanVisiting',
          flightShuttleBuilder: flightShuttleBuilder,
          child: FormTextLabel(
            label: "Catatan",
            labelColor: themeFontDefault,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        // ignore: prefer_const_constructors
        Hero(
          tag: 'Form-CatatanVisiting',
          flightShuttleBuilder: flightShuttleBuilder,
          // ignore: prefer_const_constructors
          child: Material(
            color: Colors.transparent,
            // ignore: prefer_const_constructors
            child: FormzTextField(
              readOnly: true,
              maxLines: 4,
              trailing: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Icon(Icons.keyboard_arrow_down_rounded, color: themeBlue,),
              ),
              hintText: "pilih customer",
              onTap: onTap,
              textEditingController: TextEditingController(
                  text: null),
              textInputAction: TextInputAction.next,
            ),
          ),
        )
      ],
    );
  }
}
