import 'package:flutter/material.dart';
import 'package:sicatu_app/presentation/pages/dashboard_page.dart';
// import 'package:sicatu_app/presentation/pages/user_view_page.dart';

import '../../common/constants.dart';
import '../widgets/navigation_drawer.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // drawer: NavigationDrawer(),
      // appBar: AppBar(
      //   title: Text('Sicatu'),
      // ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.all(
              16.0,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                Text(
                  "SICATU: Pengelolaan Sampah",
                  style: kHeading5,
                ),
                SizedBox(
                  height: 9,
                ),
                Text(
                  "Sistem Informasi Catatan Akuntabilitas Transparansi Usaha Transparansi Usaha",
                  style: kBodyText,
                ),
                SizedBox(
                  height: 253,
                ),
                Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                        bottomLeft: Radius.circular(10),
                        bottomRight: Radius.circular(10),
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          spreadRadius: 5,
                          blurRadius: 7,
                          offset: Offset(0, 0), // changes position of shadow
                        ),
                      ]),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        top: 48.0, bottom: 48.0, left: 32, right: 32),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Sign into your account',
                          style: kHeading6,
                        ),
                        SizedBox(
                          height: 29.0,
                        ),
                        Column(
                          children: [
                            TextField(
                              // cursorColor: softBlueColor,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide.none,
                                ),
                                fillColor: softBlueColor,
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                                hintText: "Username",
                                hintStyle: TextStyle(
                                  color: placeholderColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              style: kSubtitle,
                              // controller: fullNameController,
                            ),
                            SizedBox(
                              height: 29.0,
                            ),
                            TextField(
                              // cursorColor: softBlueColor,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(4),
                                  borderSide: BorderSide.none,
                                ),
                                fillColor: softBlueColor,
                                filled: true,
                                contentPadding: EdgeInsets.symmetric(
                                  horizontal: 16,
                                  vertical: 12,
                                ),
                                hintText: "Password",
                                hintStyle: TextStyle(
                                  color: placeholderColor,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),

                              style: kSubtitle,
                              // controller: fullNameController,
                            ),
                            SizedBox(
                              height: 29.0,
                            ),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                primary: biruColor,
                                minimumSize: Size(318, 44),
                              ),
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) {
                                      return DashboardPage();
                                    },
                                  ),
                                );
                              },
                              child: Text("SIGN IN"),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
