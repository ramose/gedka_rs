import 'package:gedka_rs/foundations/color_foundation.dart';
import 'package:gedka_rs/molecules/input_field.dart';
import 'package:gedka_rs/molecules/input_field_bottom_sheet.dart';
import 'package:gedka_rs/molecules/main_button.dart';
import 'package:flutter/material.dart';
import 'package:gedka_rs/tokens/colors.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  bool isActive = true;
  final _formKey = GlobalKey<FormState>();
  final _poliCtrl = TextEditingController();
  final _dateCtrl = TextEditingController();

  void onSubmit(key) {
    Navigator.pop(context);
    // if (key.currentState!.validate()) {
    //   ScaffoldMessenger.of(context)
    //       .showSnackBar(SnackBar(content: Text('Data sukses')));
    // }
  }

  void _showPoli(context) {
    List<Map> poli = [
      {'id': 0, 'title': 'Poli Umum'},
      {'id': 1, 'title': 'Poli Gigi'},
      {'id': 2, 'title': 'Poli KIA'},
      {'id': 3, 'title': 'UGD'}
    ];
    showModalBottomSheet<void>(
        context: context,
        builder: (BuildContext context) {
          return Container(
              padding: EdgeInsets.all(12),
              child: ListView.separated(
                itemCount: poli.length,
                itemBuilder: (BuildContext context, int index) {
                  return ListTile(
                    title: Text('${poli[index]['title']}'),
                    onTap: () {
                      _poliCtrl.text = poli[index]['title'];
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
          title: Text('Pendaftaran'),
          backgroundColor: ColorFoundation.activeBgColor,
        ),
        body: SafeArea(
          child: LayoutBuilder(
            builder:
                (BuildContext context, BoxConstraints viewportConstraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints:
                      BoxConstraints(minHeight: viewportConstraints.maxHeight),
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
                                    controller: _dateCtrl,
                                    label: 'Tanggal Pendaftaran',
                                    errorText: 'harap diisi',
                                    textInputType: TextInputType.none,
                                    type: 'registration_date'),
                                InputFieldBottomSheet(
                                  enabled: true,
                                  controller: _poliCtrl,
                                  label: 'Poli Tujuan',
                                  textInputType: TextInputType.none,
                                  errorText: 'harap diisi',
                                  type: 'poli',
                                  function: () => _showPoli(context),
                                ),
                              ],
                            )),
                        Column(
                          children: [

                            ElevatedButton.icon(
                              style: ButtonStyle(backgroundColor: MaterialStateProperty.all(AppColor.mainAppColor)),
                                onPressed: () => onSubmit(_formKey),
                                icon: Icon(Icons.check),
                                label: Text('Simpan'))
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
