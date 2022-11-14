import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sicatu_app/presentation/pages/change_password_page.dart';
import 'package:sicatu_app/presentation/pages/edit_profile_page.dart';

import '../../common/constants.dart';
import '../widgets/navigation_drawer.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: NavigationDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: biruColor),
        title: Text(
          'Profile',
          style: GoogleFonts.inter(
            color: hitamColor,
            fontSize: 22,
            fontWeight: FontWeight.w700,
            letterSpacing: 0.15,
          ),
          // GoogleFonts.inter()
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: <Widget>[
              Container(
                height: 159,
                decoration: BoxDecoration(
                  color: biruColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.05),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: Offset(0, 0), // changes position of shadow
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.,
                  children: <Widget>[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 68, left: 22),
                          child: CircleAvatar(
                            child: CircleAvatar(
                              child: Icon(Icons.account_circle_outlined),
                              radius: 72,
                              backgroundColor: biruColor,
                            ),
                            radius: 75,
                            backgroundColor: Colors.white,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(right: 16.0),
                          child: IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return EditProfilePage();
                                    },
                                  ),
                                );
                              },
                              icon: Icon(
                                Icons.edit,
                                size: 30,
                                color: Colors.white,
                              )),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 33,
                    ),
                    Text(
                      "Budhi Arta K Giri",
                      style: kHeading5,
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Text(
                      "Panjer",
                      style: kBodyText,
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Text(
                      "debudhiart@gmail.com",
                      style: kBodyText,
                    ),
                    SizedBox(
                      height: 9,
                    ),
                    Text(
                      "Jalan Waturenggong No 104",
                      style: kBodyText,
                    ),
                    SizedBox(
                      height: 122,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 54,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: biruColor,
                          minimumSize: Size(318, 44),
                        ),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return ChangePasswordPage();
                              },
                            ),
                          );
                        },
                        child: Text("Ganti Password"),
                      ),
                    ),
                    SizedBox(
                      height: 22,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width,
                      height: 54,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          elevation: 0,
                          primary: Colors.transparent,
                          minimumSize: Size(318, 44),
                        ),
                        onPressed: () {},
                        child: Text(
                          "Logout",
                          style: TextStyle(
                              color: biruColor,
                              decoration: TextDecoration.underline),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
