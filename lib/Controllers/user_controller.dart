import 'package:get/get.dart';
import 'package:social_app/Models/user_model.dart';
import 'package:social_app/Screens/home_screen.dart';
import 'package:social_app/Widgets/UserWidget/user_widget.dart';

class UserController extends GetxController{
  bool loading = true;

  void getUsersInfoFormApi() async {
    try {
      var response = await User.getUserInfo();
      HomeScreen.users =
          (response as List).map((i) => User.fromJson(i)).toList();
      for (int k = 0; k < HomeScreen.users.length; k++) {
        HomeScreen.usersWidget.add(
          UserWidget(
            title: HomeScreen.users[k].login,
            subtitle: HomeScreen.users[k].id.toString(),
            picture: HomeScreen.users[k].avatarUrl,
            id: k,
          ),
        );
      }
    }catch(e){}
    loading  = false;
    update();
  }


  @override
  void onInit() {
    getUsersInfoFormApi();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}