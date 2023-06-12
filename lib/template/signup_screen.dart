import 'package:gedka_rs/foundations/color_foundation.dart';
import 'package:gedka_rs/molecules/input_field.dart';
import 'package:gedka_rs/molecules/input_field_bottom_sheet.dart';
import 'package:gedka_rs/molecules/main_button.dart';
import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isActive = true;
  final _formKey = GlobalKey<FormState>();
  final _namaCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _alamatCtrl = TextEditingController();
  final _dobCtrl = TextEditingController();
  final _kartuJaminanCtrl = TextEditingController();

  void onSubmit(key) {
    if (key.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Data sukses validasi ${_namaCtrl.text}')));
    }
    // key.currentState?.fields['email']?.invalidate('Email already taken');
    //         // OR invalidate using Field Key
    //_emailFieldKey.currentState?.invalidate('Email already taken');

    // if (_formKeySignup.currentState!.saveAndValidate()) {
    //   if (kDebugMode) {
    //     print('--> Submitted!');
    //   }
    // } else {
    //   if (kDebugMode) {
    //     print('--> ada yg salah!');
    //   }
    // }
  }

  void _showKartuJaminan(context) {
    List<Map> jaminan = [
      {'id': 0, 'title': 'BPJS'},
      {'id': 1, 'title': 'Asuransi'},
      {'id': 2, 'title': 'Bla bla'},
    ];
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
              padding: EdgeInsets.all(12),
              child: ListView.separated(
                itemCount: jaminan.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('${jaminan[index]['title']}'),
                    onTap: () {
                      _kartuJaminanCtrl.text = jaminan[index]['title'];
                      Navigator.pop(context);
                    },
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(
                    color: Colors.grey,
                  );
                },
              ));
        });
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
                        child: Form(
                            key: _formKey,
                            child: Column(
                              children: [
                                InputField(
                                  enabled: true,
                                  controller: _namaCtrl,
                                  label: 'Nama *',
                                  errorText: 'harap diisi',
                                  textInputType: TextInputType.text,
                                  type: '',
                                ),
                                InputField(
                                    enabled: true,
                                    controller: _phoneCtrl,
                                    label: 'No. HP *',
                                    errorText: 'harap diisi',
                                    textInputType: TextInputType.phone,
                                    type: ''),
                                InputField(
                                    enabled: true,
                                    controller: _emailCtrl,
                                    label: 'Email *',
                                    errorText: 'harap diisi',
                                    textInputType: TextInputType.emailAddress,
                                    type: ''),
                                InputField(
                                    enabled: true,
                                    controller: _alamatCtrl,
                                    label: 'Alamat *',
                                    errorText: 'harap diisi',
                                    textInputType: TextInputType.multiline,
                                    type: ''),
                                InputField(
                                    enabled: true,
                                    controller: _dobCtrl,
                                    label: 'Tanggal Lahir *',
                                    errorText: 'harap diisi',
                                    textInputType: TextInputType.none,
                                    type: 'date'),
                                // InkWell(
                                //   onTap:
                                //   () => _showKartuJaminan(context)
                                //   ,
                                //   child: IgnorePointer(
                                //     child: InputField(
                                //       enabled: true,
                                //       controller: _kartuJaminanCtrl,
                                //       label: 'Kartu Jaminan *',
                                //       textInputType: TextInputType.none,
                                //       errorText: 'harap diisi',
                                //       type: 'jaminan',
                                //     ),
                                //   ),
                                // ),
                                InputFieldBottomSheet(
                                  enabled: true,
                                  controller: _kartuJaminanCtrl,
                                  label: 'Kartu Jaminan *',
                                  textInputType: TextInputType.none,
                                  errorText: 'harap diisi',
                                  type: 'jaminan',
                                  function: () => _showKartuJaminan(context),
                                ),
                              ],
                            ))),
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: MainButton(
                            leftIconPath: '',
                            title: 'Sign Up',
                            isActive: isActive,
                            callback: () => onSubmit(_formKey),
                          ),
                        ),
                        Center(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Text("Already have an account?"),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Login',
                                    style:
                                        TextStyle(fontWeight: FontWeight.bold),
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
