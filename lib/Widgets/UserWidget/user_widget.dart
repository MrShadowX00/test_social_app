import 'package:flutter/material.dart';
import 'package:social_app/Screens/user_screen.dart';

class UserWidget extends StatelessWidget {
  final String? title;
  final String? subtitle;
  final String? picture;
  final int? id;

  const UserWidget({
    Key? key,
    this.id,
    this.title,
    this.subtitle,
    this.picture,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: InkWell(
        onTap: () {
          // Navigator.push(context, MaterialPageRoute(builder: (context) => UserScreen(),),);
        },
        child: PhysicalModel(
          child: Container(
            padding: EdgeInsets.all(5),
            width: MediaQuery.of(context).size.width,
            height: 150,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              color: Colors.white,
            ),
            child: Row(
              children: [
                Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: Center(
                        child: PhysicalModel(
                          color: Colors.blue,
                          shadowColor: Colors.green,
                          shape: BoxShape.circle,
                          elevation: 8.0,
                          borderRadius: BorderRadius.circular(50),
                          child: (this.picture == null)?CircleAvatar(
                            radius: 40,
                            backgroundColor: ThemeData.light().primaryColor,
                            child: Center(
                              child: Text(
                                '${this.title?.substring(0, 1)}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 32,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ):Container(
                            height: 100,
                            width: 100,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              image: DecorationImage(image: NetworkImage(this.picture!),fit: BoxFit.cover),
                            ),
                          ),
                        ),
                      ),
                    )),
                Expanded(
                  flex: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Container(
                              child: Text(
                                '${this.title}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 5),
                            child: Container(
                              child: Text(
                                '${this.subtitle}',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          // Padding(
                          //   padding: const EdgeInsets.symmetric(vertical: 5),
                          //   child: Container(
                          //     child: Text(
                          //       '${this.email}',
                          //       style: TextStyle(
                          //         color: Colors.black,
                          //         fontSize: 16,
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          InkWell(
                            onTap: () {
                              UserScreen.id = this.id;
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => UserScreen(
                                    userImageUrl: this.picture,
                                  ),
                                ),
                              );
                            },
                            child: PhysicalModel(
                              color: Colors.green,
                              shadowColor: Colors.green,
                              borderRadius: BorderRadius.circular(5),
                              elevation: 8.0,
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Colors.green,
                                ),
                                height: 30,
                                child: Center(
                                  child: Text(
                                    'View more',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          color: Colors.green,
          elevation: 1,
          shadowColor: Colors.green,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
