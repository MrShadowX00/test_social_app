import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/Controllers/user_controller.dart';
import 'package:social_app/Models/user_model.dart';
import 'package:social_app/Widgets/UserWidget/user_widget.dart';

class HomeScreen extends StatefulWidget {
  static List<User> users = [];
  static List<UserWidget> usersWidget = [];

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  UserController userController = Get.put(UserController());

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Test app',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
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
        body: GetBuilder<UserController>(
          builder: (controller) {
            return (controller.loading)
                ? Center(
                    child: CircularProgressIndicator(
                      color: Colors.green,
                    ),
                  )
                : ListView(
                    children: HomeScreen.usersWidget,
                  );
          },
        ),
      ),
    );
  }
}
