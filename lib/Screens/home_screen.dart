import 'package:flutter/material.dart';
import 'package:social_app/Models/user_model.dart';
import 'package:social_app/Widgets/UserWidget/user_widget.dart';

class HomeScreen extends StatefulWidget {
  static List<User> users = [];

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<UserWidget> usersWidget = [];
  bool loading = true;

  getUsersInfoFormApi() async {
    var response = await User.getUserInfo();
    HomeScreen.users = (response as List).map((i) => User.fromJson(i)).toList();
    for (int k = 0; k < HomeScreen.users.length; k++) {
      usersWidget.add(
        UserWidget(
          email: HomeScreen.users[k].email,
          name: HomeScreen.users[k].name,
          userName: HomeScreen.users[k].username,
          id: k,
        ),
      );
    }
    setState(() {
      loading = false;
    });
  }

  @override
  void initState() {
    getUsersInfoFormApi();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Users',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
      ),
      body: (loading)
          ? Center(
              child: CircularProgressIndicator(
                color: Colors.green,
              ),
            )
          : ListView(
              children: usersWidget,
            ),
    );
  }
}
