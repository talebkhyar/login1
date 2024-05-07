import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 228, 236, 237),
      appBar: AppBar(
        backgroundColor: Colors.cyan[200],
        title: const Text('profile'),
      ),
      body: ListView(
        children: [
          SizedBox(height: 25),
          const CircleAvatar(
            backgroundColor: Colors.white,
            maxRadius: 60,
          ),
          Padding(
              padding: const EdgeInsets.all(28.0),
              child: Container(
                height: double.maxFinite,
                width: double.maxFinite,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          icon: const Icon(Icons.person),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          hintText: "NOM Et Prenon",
                          enabled: false,
                          //prefix: Icon(Icons.perm_identity),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          icon: const Icon(Icons.perm_identity),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          hintText: "NNI",
                          enabled: false,
                          //prefix: Icon(Icons.perm_identity),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          icon: const Icon(Icons.phone),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          hintText: "PHONE NUMBER",
                          //enabled: false,
                          //prefix: Icon(Icons.perm_identity),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          icon: const Icon(Icons.email),
                          contentPadding: const EdgeInsets.symmetric(
                              horizontal: 15, vertical: 15),
                          hintText: "Email",
                          //enabled: false,
                          //prefix: Icon(Icons.perm_identity),
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(15))),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SizedBox(
                      width: double.maxFinite,
                      child: ElevatedButton(
                        onPressed: () {},
                        child: const Text('Modifier'),
                      ),
                    )
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
