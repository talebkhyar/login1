import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:login1/login.dart';
import 'package:login1/pages/profil.dart';
import 'package:login1/pages/reclemation.dart';

class Setting extends StatefulWidget {
  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      
      children: [
        ListTile(
          leading: const Icon(Icons.person),
          title: const Text('Profile'),
          onTap: () {
            print('profile');
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => const Profile()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.help),
          title: const Text('Reclemation'),
          onTap: () {
            Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const Rectlmation()));
          },
        ),
        ListTile(
          leading: const Icon(Icons.settings),
          title: const Text('Setting'),
          onTap: () {
            print('Settings');
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
        ),
        ListTile(
          leading: const Icon(Icons.logout),
          title: const Text('Logout'),
          onTap: () async {
            // print('Logout');

            await FirebaseAuth.instance.signOut();
            Navigator.pushReplacement(
                context, MaterialPageRoute(builder: (context) =>const Login()));
          },
        ),
      ],
    );
  }
}
