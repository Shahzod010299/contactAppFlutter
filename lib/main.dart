import 'package:flutter/material.dart';
import 'package:flutter_application_contact/users_item.dart';
import 'package:flutter_application_contact/UsersList.dart';

void main(List<String> args) {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: foydalanuvchilar_royhati(),
    );
  }
}

class foydalanuvchilar_royhati extends StatefulWidget {
  @override
  _foydalanuvchilar_royhatiState createState() =>
      _foydalanuvchilar_royhatiState();
}

class _foydalanuvchilar_royhatiState extends State<foydalanuvchilar_royhati> {
  UsersList list = new UsersList();

  void deleteUser(String id) {
    print(id);
    setState(() {
      list.usrersList.removeWhere(
        (element) {
          if (element["id"] == id) {
            return true;
          } else {
            return false;
          }
        },
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.purple,
        body: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SafeArea(
                  child: Text(
                    "My Contact",
                    style: TextStyle(
                        fontSize: 45,
                        fontWeight: FontWeight.bold,
                        color: Colors.yellowAccent,
                        fontFamily: "Tangerine"),
                  ),
                ),
              ],
            ),
            Expanded(
                child: ListView(
              itemExtent: 120,
              children: list.usrersList.map((e) {
                return UsersItem(
                  id: e["id"]!,
                  name: e["name"]!,
                  lavozimi: e["lavozimi"]!,
                  rasmManzili: e["rasmManzili"]!,
                  deleteUser: deleteUser,
                );
              }).toList(),
            ))
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          backgroundColor: Colors.purple,
          child: Icon(
            Icons.search,
            color: Colors.yellow,
          ),
        ),
      ),
    );
  }
}
