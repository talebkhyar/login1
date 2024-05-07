import 'package:flutter/material.dart';
import 'package:login1/pages/profil.dart';
import 'package:login1/pages/reclemation.dart';

class Setting extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(
          leading: Icon(Icons.person),
          title: Text('Profile'),
          onTap: () {
            print('profile');
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const Profile()));
          },
        ),
        ListTile(
          leading: Icon(Icons.help),
          title: Text('Reclemation'),
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Rectlmation()));
          },
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Setting'),
          onTap: () {
            print('Setting');
          },
        ),
        const AboutListTile(
          icon: Icon(Icons.info),
          applicationIcon: FlutterLogo(),
          applicationName: "Iscae",
          applicationVersion: 'version 2.0.1',
          applicationLegalese: 'hhhhh',
          aboutBoxChildren: [
            Text('this application created by Sidi Med, Tk, Yenj ')
          ],
        )
      ],
    );
  }
}
