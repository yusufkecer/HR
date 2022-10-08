import 'package:cloud_firestore/cloud_firestore.dart';

firestoreAdd(String name, String password) async {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  Map<String, dynamic> auth = {"username": name, "password": password};
  await firestore.collection("value").doc("values").set(auth);
}
