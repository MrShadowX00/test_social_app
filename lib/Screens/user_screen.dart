import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:social_app/Controllers/user_details_controller.dart';
import 'package:social_app/Models/user_details_model.dart';
import 'package:social_app/Screens/home_screen.dart';
import 'package:social_app/Widgets/UserWidget/user_details_widget.dart';


class UserScreen extends StatefulWidget {
  static late UserDetails singleUserDetails;
  static int? id;
  final String? userImageUrl;
  const UserScreen({Key? key, this.userImageUrl}) : super(key: key);
  @override
  _UserScreenState createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {

  UserDetailsController userDetailsController = Get.put(UserDetailsController());
  @override
  void initState() {
    userDetailsController.loading = true;
    userDetailsController.getUserDetailsFromApi();
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          centerTitle: true,
          title: Text(
            '${HomeScreen.users[UserScreen.id!].login}',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        body: GetBuilder<UserDetailsController>(
          builder: (userDetailsController) {
            return (!userDetailsController.loading)?SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: UserDetailsWidget(
                userImageUrl: UserScreen.singleUserDetails.avatarUrl,
                company: UserScreen.singleUserDetails.company,
                dateTime: UserScreen.singleUserDetails.createdAt,
                email: UserScreen.singleUserDetails.email,
                followers:  UserScreen.singleUserDetails.followers.toString(),
                followings: UserScreen.singleUserDetails.following.toString(),
                id: UserScreen.id!.toString(),
                name: UserScreen.singleUserDetails.name,
              ),
            ):Center(child: CircularProgressIndicator(color: Colors.green,),);
          }
        ),
    );
  }
}
