import 'package:flutter/material.dart';
import 'package:social_app/Screens/home_screen.dart';


class UserScreen extends StatefulWidget {
  final int? id;
  const UserScreen({Key? key, this.id}) : super(key: key);
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          '${HomeScreen.users[widget.id!].username}',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
    );
  }
}
