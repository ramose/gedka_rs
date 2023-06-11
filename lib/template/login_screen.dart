import 'package:gedka_rs/molecules/input_text.dart';
import 'package:gedka_rs/molecules/main_button.dart';
import 'package:gedka_rs/tokens/colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:go_router/go_router.dart';


class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool isActive = true;
  final _formKey = GlobalKey<FormBuilderState>();
  final _emailFieldKey = GlobalKey<FormBuilderFieldState>();
  final _emailFieldKey2 = GlobalKey<FormBuilderFieldState>();

  void onSubmit(key) {
    // key.currentState?.fields['email']?.invalidate('Email already taken');
    //         // OR invalidate using Field Key
    //_emailFieldKey.currentState?.invalidate('Email already taken');

    if (_formKey.currentState!.saveAndValidate()) {
      if (kDebugMode) {
        print('--> Submitted!');
      }
    } else {
      if (kDebugMode) {
        print('--> ada yg salah!');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Expanded(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        FormBuilder(
                            key: _formKey,
                            child: Column(
                              children: [
                                const Align(
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      "Selamat Datang",
                                      style: TextStyle(
                                          fontSize: 28,
                                          fontWeight: FontWeight.bold),
                                    )),
                                const SizedBox(
                                  height: 50,
                                ),
                                SDinputText(
                                  fieldKey: _emailFieldKey,
                                  name: 'email',
                                  label: 'email',
                                  icon: Icons.email_outlined,
                                  validators: [
                                    FormBuilderValidators.required(),
                                    FormBuilderValidators.email()
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                SDinputText(
                                  fieldKey: _emailFieldKey2,
                                  name: 'password',
                                  label: 'password',
                                  icon: Icons.lock_outline,
                                  validators: [
                                    FormBuilderValidators.required(),
                                  ],
                                ),
                                TextButton(
                                    onPressed: () {},
                                    child: const Text(
                                      'Lupa Password',
                                      style: TextStyle(color: AppColor.primary),
                                    ))
                              ],
                            )),
                      ],
                    ),
                  ),
                ),
                Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: MainButton(
                        leftIconPath: '',
                        title: 'Login',
                        isActive: isActive,
                        callback: () => onSubmit(_formKey),
                      ),
                    ),
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text("Belum punya akun?"),
                          TextButton(
                              onPressed: () {
                                context.push('/signup');
                              },
                              child: const Text(
                                'Daftar',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ))
                        ],
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
          // Align(
          //   alignment: Alignment.bottomCenter,
          //   child: Column(mainAxisSize: MainAxisSize.min, children: [
          //     MainButton(
          //       leftIconPath: 'assets/images/user.png',
          //       title: 'Login',
          //       isActive: isActive,
          //       callback: () => onSubmit(_formKey),
          //     ),
          //     const SizedBox(height: 20,)
          //   ]),
          // ),
        ],
      ),
    ));
  }
}
