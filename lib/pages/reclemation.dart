import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:image_picker/image_picker.dart';

class Rectlmation extends StatefulWidget {
  const Rectlmation({super.key});

  @override
  State<Rectlmation> createState() => _RectlmationState();
}

class _RectlmationState extends State<Rectlmation> {
  File? _selectedImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:   Theme.of(context).colorScheme.primaryContainer,
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text('Reclmation'),
        centerTitle: true,
      ),
      body: Container(
      
        height: double.infinity,
        width: double.infinity,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Nom de Matiere",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Note exacte",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
            const Text('Selectionez la copie du note',textAlign: TextAlign.center,style: TextStyle(fontSize: 19,fontWeight: FontWeight.bold,color: Colors.purple),),
            MaterialButton(
                onPressed: () {
                  _pickImageFromGallery();
                },
                child:const Text('Get Image Ga')),
            MaterialButton(
                onPressed: () {
                  _pickImageFromCamera();
                },
                child:const Text('Get Image Ca')),
            const SizedBox(
              height: 20,
            ),
            _selectedImage != null
                ? Image.file(_selectedImage!)
                : const Text('please get image'),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                decoration: InputDecoration(
                    hintText: "Description",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15))),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: ElevatedButton(onPressed: () {
                showCupertinoDialog<void>(
                      context: context,
                      builder: (BuildContext context) => CupertinoAlertDialog(
                            title:const Icon(
                              Icons.warning,
                              color: Colors.red,
                            ),
                            content: const Text(
                                'vous voullez envoie le reclemation ?'),
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
              }, child: Text('Envoie')),
            )
          ],
        ),
      ),
    );
  }

  Future _pickImageFromGallery() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage!.path);
    });
  }

  Future _pickImageFromCamera() async {
    final returnedImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnedImage == null) return;
    setState(() {
      _selectedImage = File(returnedImage!.path);
    });
  }
}
