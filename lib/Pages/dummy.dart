import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _fs = FirebaseFirestore.instance;

  Widget lineMaker(String stn){
    return Card(
      color: const Color(0xFFA89D9D),
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20)
        ),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.all(16),
        title: Text(
          stn,
          style: GoogleFonts.rajdhani(
              fontSize: 25,
              fontWeight: FontWeight.w700,
              color: Colors.black
          ),
        ),
        leading: Container(
          width: 30,
          height: 30,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(100),
              color: Colors.black54
          ),
          child: const Icon(Icons.credit_card, color: Colors.white, size: 20,),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete, color: Colors.white, size: 20),
          onPressed: () async{
            await _fs.collection("metro_cards").get()
                .then((res) {
              if(res.docs.isNotEmpty){
                res.docs.first.reference.delete()
                    .then((task)  {
                  setState(() {});
                }).catchError((e) {log(e.toString());});
              }
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My app"),
      ),
      body: Column(
        children: [
          StreamBuilder<QuerySnapshot>(
            stream: FirebaseFirestore.instance.collection('folder name').snapshots(),

            builder: (context, snapshot) {
              if(snapshot.hasData){
                final clients = snapshot.data!.docs.toList();
                return ListView.builder(
                  itemCount: clients.length,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    final clientWidget = lineMaker(clients[index]['name']);
                    return clientWidget;
                  },
                );
              }
              else{
                return const SizedBox(
                  height: 60,
                  width: 60,
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                );
              }
            },
          ),
        ],
      )
    );
  }
}