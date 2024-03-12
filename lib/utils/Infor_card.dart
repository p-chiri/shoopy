import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class InforCard extends StatelessWidget {
  final String name, email;
  const InforCard({Key? key, required this.name, required this.email}) : super(key: key);



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          leading: const CircleAvatar(backgroundColor: Colors.blueGrey,child:
          Icon(CupertinoIcons.person),),
          title: Text(
            name,
            style: const TextStyle(color: Colors.white),
          ),
          subtitle:Text(
            email,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
