import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<dynamic> _data = [
    {'title':'Data Pasien', 'icon':Icons.verified_user, 'color':Colors.lightBlue, 'path':'/signup'},
    {'title':'Pendaftaran', 'icon':Icons.app_registration, 'color':Colors.lightGreen, 'path':'/registration'}
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.asset('assets/images/logo_puskesmas_wonodadi.png'),
            Image.asset('assets/images/bg_puskesmas.png'),
            Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GridView.count(
                      crossAxisCount: 2,
                      children: List.generate(
                        2,
                        (index) {
                          return InkWell(
                            onTap: () => context.push(_data[index]['path']),
                            child: Card(child: Center(child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Icon(_data[index]['icon'], size: 50, color: _data[index]['color'],),
                                SizedBox(height: 10,),
                                Text('${_data[index]['title']}'),
                              ],
                            ))),
                          );
                        },
                      )),
                )),
            Center(
              child: Text('Mockup 1.0.0'),
            )
          ],
        ),
      ),
    );
  }
}
