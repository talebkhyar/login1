import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AfficheReclemation extends StatefulWidget {
  const AfficheReclemation({super.key});

  @override
  State<AfficheReclemation> createState() => _AfficheReclemationState();
}

class _AfficheReclemationState extends State<AfficheReclemation> {
  List<Map<String, dynamic>> studentsData = [];
  final credential = FirebaseAuth.instance.currentUser;
    String? _fullNameController;
    String nom='';
  getPdfUrlsFromFirestore() async {
    try {
      CollectionReference pdfCollection =
          FirebaseFirestore.instance.collection('reclemations');
      QuerySnapshot querySnapshot = await pdfCollection.get();
      DocumentSnapshot studentDoc =
          await pdfCollection.doc(credential!.uid).get();
      querySnapshot.docs.forEach((doc) {
        studentsData.add(studentDoc.data() as Map<String, dynamic>);
    
        _fullNameController = studentDoc['full_name'] ?? '';
      
         nom =studentsData[0].toString();
           print(nom);
      });
    } catch (e) {
      print('Erreur lors de la récupération des URLs des PDF: $e');
       // Rejette l'erreur pour la capturer dans catchError
    }
  }

  @override
  void initState() {
    super.initState();
    getPdfUrlsFromFirestore();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Reclemation Envoie'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 15, left: 15, top: 10),
        child: ListView(
          children: const [
            Text( "",
              
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
