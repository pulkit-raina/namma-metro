import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:namma_metro/firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  var snap = await FirebaseFirestore.instance
      .collection("user_details")
      .where("user_id", isEqualTo: "0Wi7OLvYM5e83GaDmghIzl5x6X92")
      .limit(1)
      .get();
  log(snap.toString());
  // await fs.collection("users").doc("0Wi7OLvYM5e83GaDmghIzl5x6X92").get()
  // .then((res) {
  //   log()
  // });


  // Reading Data
  // QuerySnapshot qc = await fs.collection("users").get();
  //
  // for(var doc in qc.docs){
  //   log(doc.id);
  //   log(doc.data().toString());
  // }
  //
  // DocumentSnapshot dc = await fs.collection("users").doc("CGNa24LpR1GbKuwnsDLU").get();
  // log(dc.toString());
  //
  // // Writing Data
  // Map<String, dynamic> newData = {
  //   "User_Name": "Rachit Mehta",
  //   "Email": "rachit.cs21@bmsce.ac.in",
  //   "Phone_Number": 0985671234
  // };
  // await fs.collection("users").add(newData);
  // log("Done");
  //
  // // Creating user with custom id
  // // await fs.collection("users").doc("custom-id").set(newData);
  //
  // // Updating / Changing existing data
  // await fs.collection("users").doc("custom-id").update({
  //   "name": "Ramu"
  // });
  //
  // // Deleting Data
  // await fs.collection("users").doc("custom-id").delete();


}

// class ProfilePage extends StatefulWidget {
//   const ProfilePage({super.key});
//
//   @override
//   State<ProfilePage> createState() => _ProfilePageState();
// }
//
// class _ProfilePageState extends State<ProfilePage> {
//   @override
//   Widget build(BuildContext context) {
//
//   }
// }
