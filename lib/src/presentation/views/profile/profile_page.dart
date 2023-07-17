import 'package:becca_sales/src/core/config/constant.dart';
import 'package:becca_sales/src/core/utils/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../core/assets/assets.gen.dart';
import '../../../core/config/theme_colors.dart';
import '../../blocs/auth/auth_bloc.dart';
import '../../widgets/hero_widget.dart';
import '../../widgets/text_field_widget.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 0),
        shrinkWrap: true,
        children: [
          Container(
            decoration:  BoxDecoration(
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
                color: themeBlueBg,
                image: DecorationImage(
                  fit: BoxFit.cover,
                    image: AssetImage(Assets.images.bgBiru.path))),
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            height: 200,
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(35)),
                    width: 70,
                    height: 70,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(35),
                      child: Image.asset(
                        Assets.images.profileBella.path,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Bella Santi",
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 16),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        "20230706",
                        style:
                            const TextStyle(color: Colors.white, fontSize: 12),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Basic Profile",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: themeFontDefault,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const FormInputEmailProfile(),
                const SizedBox(
                  height: 12,
                ),
                const FormInputPhoneProfile(),
                // SizedBox(
                //   height: 12,
                // ),
                // FormInputGenderProfile(),
                const SizedBox(
                  height: 45,
                ),
                const Text(
                  "Change Password",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: themeFontDefault,
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                const FormInputNewPassword(),
                const SizedBox(
                  height: 12,
                ),
                const FormInputNewPasswordConfirmation(),
                const SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  child: ButtonLogout(
                    onTap: () => handleLogOut(context),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
      bottomNavigationBar: SafeArea(
        minimum: const EdgeInsets.fromLTRB(30, 0, 30, kBottomNavigationBarHeight),
        child: ElevatedButton(
          onPressed: () async {},
          style:
              ElevatedButton.styleFrom(backgroundColor: themeBlue,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30)
              )),
          child: const Padding(
            padding: EdgeInsets.symmetric(vertical: 16),
            child: Text(
              "Save",
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.w700),
            ),
          ),
        ),
      ),
    );
  }
}

handleLogOut(BuildContext context) async {
  final bloc = context.read<AuthBloc>();
  final confirm = await context.showConfirmationBottomSheet(
    image: Assets.images.logoBecca.path,
    imageWidth: 0,
    title: 'Konfirmasi Keluar',
    message: 'Apakah Anda yakin akan keluar dari aplikasi ?',
    positiveButton: 'Keluar',
  );

  if (confirm == true) {
    bloc.add(const AuthenticationLogoutRequested());
  }
}

class ButtonLogout extends StatelessWidget {
  const ButtonLogout({
    Key? key,
    this.onTap,
  }) : super(key: key);

  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'Form-logout-user',
      flightShuttleBuilder: flightShuttleBuilder,
      // ignore: prefer_const_constructors
      child: Material(
        color: Colors.transparent,
        child: FormzUnderlineTextField(
          leading: Container(
            padding: const EdgeInsets.all(10),
            height: 16,
            width: 16,
            child: Icon(Icons.logout_rounded, color: Colors.red,),
          ),
          onTap: onTap,
          enabled: true,
          readOnly: true,
          textEditingController: TextEditingController(text: "Logout",),
          textInputAction: TextInputAction.next,
          style: TextStyle(color: Colors.red),
        ),
      ),
    );
  }
}

class FormInputNewPasswordConfirmation extends StatelessWidget {
  const FormInputNewPasswordConfirmation({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'Form-retype-new-password-user',
      flightShuttleBuilder: flightShuttleBuilder,
      // ignore: prefer_const_constructors
      child: Material(
        color: Colors.transparent,
        child: FormzUnderlineTextField(
          leading: Icon(Icons.lock_outline, color: Color(0xFFBFBFBF),),
          enabled: true,
          obscureText: true,
          hintText: 'retype new password',
          textEditingController: null,
          textInputAction: TextInputAction.next,
          trailing: GestureDetector(
            child: const Icon(
              Icons.visibility_rounded,
              color: Color(0xFFBFBFBF),
            ),
            onTap: () {},
          ),
          onChanged: (passwordKonfirmasi) {},
          errorText: () {
            // if (state.fieldNewPasswordConfirmation.invalid &&
            //     state.fieldNewPasswordConfirmation.value.isNotEmpty) {
            //   return 'Silakan ulangi password';
            // }
            //
            // final password = state.fieldNewPassword.value;
            // final confirmPassword =
            //     state.fieldNewPasswordConfirmation.value;
            // if (password.isNotEmpty &&
            //     confirmPassword.isNotEmpty &&
            //     password != confirmPassword) {
            //   return 'Konfirmasi password tidak sesuai';
            // }

            return null;
          }(),
        ),
      ),
    );
  }
}

class FormInputNewPassword extends StatelessWidget {
  const FormInputNewPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'Form-new-password-user',
      flightShuttleBuilder: flightShuttleBuilder,
      // ignore: prefer_const_constructors
      child: Material(
        color: Colors.transparent,
        child: FormzUnderlineTextField(
          leading: Icon(Icons.lock_outline, color: Color(0xFFBFBFBF),),
          trailing: GestureDetector(
            child: Icon(
              Icons.visibility_rounded,
              color: Color(0xFFBFBFBF),
            ),
            onTap: () {},
          ),
          enabled: true,
          obscureText: true,
          hintText: 'enter new password',
          textEditingController: null,
          textInputAction: TextInputAction.next,
          onChanged: (password) => {},
        ),
      ),
    );
  }
}

class FormInputPhoneProfile extends StatelessWidget {
  const FormInputPhoneProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'Form-phone-user',
      flightShuttleBuilder: flightShuttleBuilder,
      // ignore: prefer_const_constructors
      child: Material(
        color: Colors.transparent,
        child: FormzUnderlineTextField(
          trailing: Icon(Icons.edit, color: Color(0xFF508DFF),),
          leading: Container(
            padding: const EdgeInsets.all(10),
            height: 16,
            width: 16,
            child: Icon(Icons.phone_outlined, color: Color(0xFFBFBFBF),),
          ),
          enabled: true,
          keyboardType: TextInputType.phone,
          textEditingController: TextEditingController(text: "0822234566789"),
          onChanged: (phone) {
            // context.read<PersonalDataBloc>().add(OnPersonalChanged(
            //     email: state.fieldEmail.value,
            //     phone: phone,
            //     gender: state.fieldGender.value));
          },
          textInputAction: TextInputAction.next,
        ),
      ),
    );
  }
}

class FormInputEmailProfile extends StatelessWidget {
  const FormInputEmailProfile({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: 'Form-email-user',
      flightShuttleBuilder: flightShuttleBuilder,
      // ignore: prefer_const_constructors
      child: Material(
        color: Colors.transparent,
        child: FormzUnderlineTextField(
          trailing: Icon(Icons.edit, color: Color(0xFF508DFF),),
          leading: Container(
            padding: const EdgeInsets.all(10),
            height: 16,
            width: 16,
            child: Icon(Icons.email_outlined, color: Color(0xFFBFBFBF),),
          ),
          autofocus: false,
          keyboardType: TextInputType.emailAddress,
          textEditingController: TextEditingController(text: "bellashanti@berkatchandra.com"),
          onChanged: (email) {
            // context.read<PersonalDataBloc>().add(OnPersonalChanged(
            //       email: email,
            //       phone: state.fieldPhone.value,
            //       gender: state.fieldGender.value,
            //     ))
          },
          textInputAction: TextInputAction.next,
        ),
      ),
    );
  }
}
