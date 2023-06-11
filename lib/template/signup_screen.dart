import 'package:gedka_rs/foundations/color_foundation.dart';
import 'package:gedka_rs/molecules/input_text.dart';
import 'package:gedka_rs/molecules/main_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';

import '../molecules/input_text_no_icon.dart';


class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isActive = true;
  final _formKeySignup = GlobalKey<FormBuilderState>();
  final _nameFieldKeySignup = GlobalKey<FormBuilderFieldState>();
  final _emailFieldKeySignup = GlobalKey<FormBuilderFieldState>();
  final _passwordFieldKeySignup = GlobalKey<FormBuilderFieldState>();
  final _phoneFieldKeySignup = GlobalKey<FormBuilderFieldState>();

  void onSubmit(key) {
    // key.currentState?.fields['email']?.invalidate('Email already taken');
    //         // OR invalidate using Field Key
    //_emailFieldKey.currentState?.invalidate('Email already taken');

    if (_formKeySignup.currentState!.saveAndValidate()) {
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
        appBar: AppBar(
          title: Text('Pasien Baru'),
          backgroundColor: ColorFoundation.activeBgColor,
        ),
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
                      children: [
                        FormBuilder(
                            key: _formKeySignup,
                            child: Column(
                              children: [
                                MainInputNoIcon(
                                  fieldKey: _nameFieldKeySignup,
                                  name: 'name',
                                  label: 'full name',
                                  validators: [
                                    FormBuilderValidators.required(),
                                    FormBuilderValidators.email()
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                MainInputNoIcon(
                                  fieldKey: _emailFieldKeySignup,
                                  name: 'email',
                                  label: 'email',
                                  validators: [
                                    FormBuilderValidators.required(),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                MainInputNoIcon(
                                  fieldKey: _passwordFieldKeySignup,
                                  name: 'password',
                                  label: 'password',
                                  validators: [
                                    FormBuilderValidators.required(),
                                  ],
                                ),
                                const SizedBox(
                                  height: 20,
                                ),
                                MainInputNoIcon(
                                  fieldKey: _phoneFieldKeySignup,
                                  name: 'phone',
                                  label: 'phone',
                                  validators: [
                                    FormBuilderValidators.required(),
                                  ],
                                ),
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
                        title: 'Sign Up',
                        isActive: isActive,
                        callback: () => onSubmit(_formKeySignup),
                      ),
                    ),
                    Center(
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text("Already have an account?"),
                          TextButton(onPressed: (){}, child: const Text('Login', style: TextStyle(fontWeight: FontWeight.bold),))
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
