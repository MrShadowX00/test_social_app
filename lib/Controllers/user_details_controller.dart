import 'package:get/get.dart';
import 'package:social_app/Models/user_details_model.dart';
import 'package:social_app/Models/user_model.dart';
import 'package:social_app/Screens/home_screen.dart';
import 'package:social_app/Screens/user_screen.dart';
import 'package:social_app/Widgets/UserWidget/user_widget.dart';

class UserDetailsController extends GetxController{
  bool loading = true;
  void getUserDetailsFromApi() async {
    try {
      var response = await UserDetails.getUserInfo(UserScreen.id.toString());
      UserScreen.singleUserDetails = UserDetails.fromJson(response);
      print(UserScreen.singleUserDetails.name);
    }catch(e){}
    loading  = false;
    update();
  }



  @override
  void onInit() {
    getUserDetailsFromApi();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}