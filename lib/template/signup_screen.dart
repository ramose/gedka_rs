import 'package:gedka_rs/foundations/color_foundation.dart';
import 'package:gedka_rs/molecules/input_field.dart';
import 'package:gedka_rs/molecules/input_field_bottom_sheet.dart';
import 'package:gedka_rs/molecules/main_button.dart';
import 'package:flutter/material.dart';
import 'package:gedka_rs/tokens/colors.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  bool isActive = true;
  final _formKey = GlobalKey<FormState>();
  final _namaCtrl = TextEditingController();
  final _nikCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _alamatCtrl = TextEditingController();
  final _dobCtrl = TextEditingController();
  final _tempatLahirCtrl = TextEditingController();
  final _kartuJaminanCtrl = TextEditingController();
  final _noKartuJaminanCtrl = TextEditingController();
  final _relativeCtrl = TextEditingController();

  void onSubmit(key) {
    // if (key.currentState!.validate()) {
    //   ScaffoldMessenger.of(context).showSnackBar(
    //       SnackBar(content: Text('Data sukses validasi ${_namaCtrl.text}')));
    // }
    Navigator.pop(context);
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
          title: Text('Data Pasien'),
          backgroundColor: ColorFoundation.activeBgColor,
        ),
        body: SafeArea(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: viewportConstraints.maxHeight
                ),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    children: [
                      Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              InputField(
                                enabled: true,
                                controller: _nikCtrl,
                                label: 'NIK',
                                errorText: 'harap diisi',
                                textInputType: TextInputType.number,
                                type: '',
                              ),
                              InputField(
                                enabled: true,
                                controller: _namaCtrl,
                                label: 'Nama',
                                errorText: 'harap diisi',
                                textInputType: TextInputType.text,
                                type: '',
                              ),

                              InputField(
                                  enabled: true,
                                  controller: _tempatLahirCtrl,
                                  label: 'Tempat Lahir',
                                  errorText: 'harap diisi',
                                  textInputType: TextInputType.text,
                                  type: ''),
                              InputField(
                                  enabled: true,
                                  controller: _dobCtrl,
                                  label: 'Tanggal Lahir',
                                  errorText: 'harap diisi',
                                  textInputType: TextInputType.none,
                                  type: 'date'),
                              InputField(
                                  enabled: true,
                                  controller: _phoneCtrl,
                                  label: 'No Telp',
                                  errorText: 'harap diisi',
                                  textInputType: TextInputType.phone,
                                  type: 'phone'),
                              InputField(
                                  enabled: true,
                                  controller: _relativeCtrl,
                                  label: 'Nama Pasangan/Saudara',
                                  errorText: 'harap diisi',
                                  textInputType: TextInputType.text,
                                  type: ''),

                              InputField(
                                  enabled: true,
                                  controller: _alamatCtrl,
                                  label: 'Alamat',
                                  errorText: 'harap diisi',
                                  textInputType: TextInputType.multiline,
                                  type: ''),

                              InputFieldBottomSheet(
                                enabled: true,
                                controller: _kartuJaminanCtrl,
                                label: 'Kartu Jaminan',
                                textInputType: TextInputType.none,
                                errorText: 'harap diisi',
                                type: 'jaminan',
                                function: () => _showKartuJaminan(context),
                              ),
                              InputField(
                                  enabled: true,
                                  controller: _noKartuJaminanCtrl,
                                  label: 'No Kartu Jaminan',
                                  errorText: 'harap diisi',
                                  textInputType: TextInputType.number,
                                  type: ''),
                            ],
                          )),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton.icon(
                                style: ButtonStyle(backgroundColor: MaterialStateProperty.all(AppColor.mainAppColor[50])),
                                onPressed: () => onSubmit(_formKey),
                                icon: Icon(Icons.check),
                                label: Text('Simpan'))
                          ),
                          // Center(
                          //   child: Row(
                          //     mainAxisSize: MainAxisSize.min,
                          //     children: [
                          //       const Text("Already have an account?"),
                          //       TextButton(
                          //           onPressed: () {},
                          //           child: const Text(
                          //             'Login',
                          //             style:
                          //                 TextStyle(fontWeight: FontWeight.bold),
                          //           ))
                          //     ],
                          //   ),
                          // )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );},
          ),
        ));
  }
}
