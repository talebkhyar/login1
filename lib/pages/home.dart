import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:login1/pages/notif.dart';
import 'package:login1/pages/result.dart';
import 'package:login1/pages/setting.dart';
import 'package:login1/pages/welcome_view.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int intNav = 1;

  List<Widget> listwidget = [Result(), WelcomeView(), Setting()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 193, 169, 238),
      bottomNavigationBar: CurvedNavigationBar(
          onTap: (val) {
            setState(() {
              intNav = val;
            });
          },
          index: intNav,
          backgroundColor: const Color.fromARGB(255, 193, 169, 238),
          buttonBackgroundColor: Colors.blueAccent,
          animationDuration: const Duration(milliseconds: 500),
          items: const [
            Icon(Icons.note),
            Icon(Icons.home),
            Icon(Icons.settings),
          ]),
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.blueAccent,
            pinned: true,
            floating: false,
            leading: IconButton(
              icon: const Icon(
                Icons.notification_add,
                color: Colors.white,
                size: 40,
              ),
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Notifi()));
              },
            ),
            centerTitle: true,
            expandedHeight: 100,
            flexibleSpace: FlexibleSpaceBar(
              title: const Text('ISACEINSQ2'),
              centerTitle: false,
              // background: Image.asset(
              //   'images/FB.jpg',
              //   fit: BoxFit.cover,
              // ),
            ),
          ),
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: Container(
                height: double.maxFinite,
                child: listwidget.elementAt(intNav),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
