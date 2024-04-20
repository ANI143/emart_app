import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:emart_project/consts/consts.dart';
import 'package:flutter/material.dart';

class UserList extends StatefulWidget {
  const UserList({super.key});

  @override
  State<UserList> createState() => _UserListState();
}

class _UserListState extends State<UserList> {
  var collection = FirebaseFirestore.instance.collection("users");
  late List<Map<String, dynamic>> listData = [];
  late List<Map<String, dynamic>> item;

  method() async {
    var data = await collection.get();
    data.docs.forEach((element) {
      listData.add(element.data());
    });
    setState(() {
      item = listData;
    });
    print(item);
    //jfskd
  }

  @override
  void initState() {
    method();
    print("data");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
