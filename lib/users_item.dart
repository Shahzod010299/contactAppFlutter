import 'package:flutter/material.dart';

class UsersItem extends StatelessWidget {
  final String id;
  final String name;
  final String lavozimi;
  final String rasmManzili;
  final Function deleteUser;

  UsersItem(
      {required this.id,
      required this.name,
      required this.lavozimi,
      required this.rasmManzili,
      required this.deleteUser});

  @override
  Widget build(BuildContext context) {
    return Card(
      shadowColor: Colors.black,
      color: Colors.white10,
      child: Center(
        child: ListTile(
          leading: CircleAvatar(
            radius: 30,
            backgroundImage: NetworkImage(rasmManzili),
          ),
          title: Text(
            name,
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 35,
                color: Colors.yellowAccent,
                fontFamily: "Tangerine"),
          ),
          subtitle: Text(lavozimi),
          trailing: IconButton(
              onPressed: () {
                deleteUser(id);
              },
              icon: Icon(
                Icons.delete,
                color: Colors.purpleAccent,
                size: 30,
              )),
        ),
      ),
    );
  }
}
