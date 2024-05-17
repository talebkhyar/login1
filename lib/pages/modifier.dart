import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UpDate extends StatefulWidget {
  const UpDate({super.key});

  @override
  State<UpDate> createState() => _UpDateState();
}

class _UpDateState extends State<UpDate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Modifier'),
      ),
      body: Form(
        child: Column(
          children: [
            TextFormField(),
            TextFormField(),
            ElevatedButton(
                onPressed: () {
                  showCupertinoDialog<void>(
                      context: context,
                      builder: (BuildContext context) => CupertinoAlertDialog(
                            title: Icon(
                              Icons.warning,
                              color: Colors.red,
                            ),
                            content: const Text(
                                'vous voullez modifier le  email ou numero de telephone ?'),
                            actions: <CupertinoDialogAction>[
                              CupertinoDialogAction(
                                child: Text('No'),
                                isDefaultAction: true,
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                              ),
                              CupertinoDialogAction(
                                child: Text('Yes'),
                                isDefaultAction: true,
                                onPressed: () {
                                  Navigator.pop(context);
                                  //               Navigator.pushReplacement(
                                  // context,
                                  // MaterialPageRoute(
                                  //     builder: (context) => const UpDate()));
                                  //
                                },
                              )
                            ],
                          ));
                },
                child: Text('Modifier'))
          ],
        ),
      ),
    );
  }
}
