import 'package:flutter/material.dart';
import 'package:sneaker_app/animations/fade_animation.dart';
import 'package:sneaker_app/data/dummy_data.dart';
import 'package:sneaker_app/models/models.dart';
import 'package:sneaker_app/theme/custom_app_theme.dart';
import 'package:sneaker_app/utils/constants.dart';
import 'package:sneaker_app/view/user_profile/components/app_bar.dart';
import 'package:sneaker_app/view/user_profile/components/rounded_list_tile.dart';

class UserProfileView extends StatefulWidget {
  const UserProfileView({Key? key}) : super(key: key);

  @override
  State<UserProfileView> createState() => _UserProfileViewState();
}

class _UserProfileViewState extends State<UserProfileView> {
  int statusCurrentIndex = 0;
  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        appBar: UserViewAppBar(),
        body: SizedBox(
          width: width,
          height: height,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 7),
            child: Column(
              children: [
                _topUserInfo(width),
                SizedBox(
                  height: height * 0.01,
                ),
                _userStatusListView(width, height),
                SizedBox(
                  height: height * 0.01,
                ),
                _roundedList(width, height),
                FadeAnimation(
                    delay: 2.5,
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5),
                      child: SizedBox(
                        width: width,
                        height: height / 6.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "My Account",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.grey,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: height * 0.01,
                            ),
                            const Text(
                              "Switch to Other Account",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.blue,
                                  fontSize: 15),
                            ),
                            SizedBox(
                              height: height * 0.015,
                            ),
                            const Text(
                              "Log Out",
                              style: TextStyle(
                                  fontWeight: FontWeight.w500,
                                  color: Colors.red,
                                  fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _userStatusListView(double width, double height) {
    return FadeAnimation(
        delay: 1.5,
        child: SizedBox(
          width: width,
          height: height * 0.12,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "My Status",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                    fontSize: 18),
              ),
              SizedBox(height: height * 0.005),
              SizedBox(
                width: width,
                height: height * 0.06,
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: userStatus.length,
                    itemBuilder: (context, index) {
                      UserStatus status = userStatus[index];
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            statusCurrentIndex = index;
                          });
                        },
                        child: Container(
                          margin: const EdgeInsets.all(5),
                          width: 120,
                          decoration: BoxDecoration(
                            color: statusCurrentIndex == index
                                ? status.selectColor
                                : status.unSelectColor,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(status.emoji,
                                  style: const TextStyle(fontSize: 16)),
                              SizedBox(
                                width: 3,
                              ),
                              Text(status.txt,
                                  style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: statusCurrentIndex == index
                                          ? Colors.white
                                          : Colors.black)),
                            ],
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ));
  }

  Widget _topUserInfo(double width) {
    return FadeAnimation(
      delay: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundImage: NetworkImage(
              'https://media.licdn.com/dms/image/v2/D5603AQH3oRyVZedgPw/profile-displayphoto-shrink_400_400/B56ZU6_7u3HEAg-/0/1740451593938?e=1752105600&v=beta&t=LF5IJD7631kjWfL54Z4-AqIm13PoZ-PHmjV4bvQn1zs',
            ),
          ),
          SizedBox(width: width * 0.03),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Harshit Suthar",
                style: AppThemes.profileDevName,
              ),
              SizedBox(height: 2),
              Text("Flutter Developer",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.w500,
                      color: Colors.grey)),
            ],
          ),
          SizedBox(width: width * 0.03),
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.edit_outlined,
                color: Colors.grey,
              )),
        ],
      ),
    );
  }

  Widget _roundedList(double width, double height) {
    return FadeAnimation(
        delay: 2,
        child: SizedBox(
          width: width,
          height: height * 0.35,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "DashBoard",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Colors.grey,
                    fontSize: 15),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              RoundedListTile(
                icon: Icons.wallet_travel_outlined,
                title: "Payments",
                leadingBackColor: Colors.green[500],
                trailing: Container(
                  width: 90,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.blue[700],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "2 New",
                        style: TextStyle(
                            color: AppConstantsColor.lightTextColor,
                            fontWeight: FontWeight.w500),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppConstantsColor.lightTextColor,
                        size: 15,
                      ),
                    ],
                  ),
                ),
              ),
              RoundedListTile(
                icon: Icons.archive,
                title: "Achievements",
                leadingBackColor: Colors.yellow[500],
                trailing: Container(
                  width: 90,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppConstantsColor.darkTextColor,
                        size: 15,
                      ),
                    ],
                  ),
                ),
              ),
              RoundedListTile(
                icon: Icons.shield,
                title: "Privacy",
                leadingBackColor: Colors.grey[500],
                trailing: Container(
                  width: 140,
                  height: 40,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.red[500],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Action Needed",
                        style: TextStyle(
                            color: AppConstantsColor.lightTextColor,
                            fontWeight: FontWeight.w500),
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: AppConstantsColor.darkTextColor,
                        size: 15,
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
