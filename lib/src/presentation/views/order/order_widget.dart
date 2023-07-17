import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/config/constant.dart';
import '../../../core/config/theme_colors.dart';
import '../../widgets/hero_widget.dart';
import '../../widgets/text_field_widget.dart';

class FormInputCustomerOrder extends StatelessWidget {
  const FormInputCustomerOrder({
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
          tag: 'Label-CustomerNameOrder',
          flightShuttleBuilder: flightShuttleBuilder,
          child: FormTextLabel(
            label: "Customer",
            labelColor: themeFontDefault,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        // ignore: prefer_const_constructors
        Hero(
          tag: 'Form-CustomerNameOrder',
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

class FormInputTipeEkspedisi extends StatelessWidget {
  const FormInputTipeEkspedisi({
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
          tag: 'Label-TipeEkspedisiOrder',
          flightShuttleBuilder: flightShuttleBuilder,
          child: FormTextLabel(
            label: "Tipe Ekspedisi",
            labelColor: themeFontDefault,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        // ignore: prefer_const_constructors
        Hero(
          tag: 'Form-TipeEkspedisiOrder',
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
              hintText: "pilih tipe ekspedisi",
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

class FormInputEkspedisiOrder extends StatelessWidget {
  const FormInputEkspedisiOrder({
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
          tag: 'Label-EkspedisiOrder',
          flightShuttleBuilder: flightShuttleBuilder,
          child: FormTextLabel(
            label: "Ekspedisi",
            labelColor: themeFontDefault,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        // ignore: prefer_const_constructors
        Hero(
          tag: 'Form-EkspedisiOrder',
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
              hintText: "pilih ekspedisi",
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

class FormInputDepoOrder extends StatelessWidget {
  const FormInputDepoOrder({
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
          tag: 'Label-DepoOrder',
          flightShuttleBuilder: flightShuttleBuilder,
          child: FormTextLabel(
            label: "Depo",
            labelColor: themeFontDefault,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        // ignore: prefer_const_constructors
        Hero(
          tag: 'Form-DepoOrder',
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
              hintText: "pilih depo",
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

class FormInputCatatanOrder extends StatelessWidget {
  const FormInputCatatanOrder({
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
          tag: 'Label-CatatanOrder',
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
          tag: 'Form-CatatanOrder',
          flightShuttleBuilder: flightShuttleBuilder,
          // ignore: prefer_const_constructors
          child: Material(
            color: Colors.transparent,
            // ignore: prefer_const_constructors
            child: FormzTextField(
              readOnly: true,
              hintText: "input catatan",
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

class FormInputDPPOrder extends StatelessWidget {
  const FormInputDPPOrder({
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
          tag: 'Label-DPPOrder',
          flightShuttleBuilder: flightShuttleBuilder,
          child: FormTextLabel(
            label: "DPP",
            labelColor: themeFontDefault,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        // ignore: prefer_const_constructors
        Hero(
          tag: 'Form-DPPOrder',
          flightShuttleBuilder: flightShuttleBuilder,
          // ignore: prefer_const_constructors
          child: Material(
            color: Colors.transparent,
            // ignore: prefer_const_constructors
            child: FormzTextField(

              textAlign: TextAlign.end,
              hintText: "0",
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

class FormInputGrandTotalOrder extends StatelessWidget {
  const FormInputGrandTotalOrder({
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
          tag: 'Label-GrandTotalOrder',
          flightShuttleBuilder: flightShuttleBuilder,
          child: FormTextLabel(
            label: "Grand Total",
            labelColor: themeFontDefault,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        // ignore: prefer_const_constructors
        Hero(
          tag: 'Form-GrandTotalOrder',
          flightShuttleBuilder: flightShuttleBuilder,
          // ignore: prefer_const_constructors
          child: Material(
            color: Colors.transparent,
            // ignore: prefer_const_constructors
            child: FormzTextField(

              textAlign: TextAlign.end,
              hintText: "0",

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
