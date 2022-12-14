import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
// import 'package:sicatu_app/presentation/pages/user_create_page.dart';
// import 'package:sicatu_app/presentation/pages/user_detail_page.dart';
import 'package:sicatu_app/presentation/pages/user_page/user_create_page.dart';
import 'package:sicatu_app/presentation/pages/user_page/user_detail_page.dart';
import 'package:sicatu_app/presentation/widgets/search_loading.dart';

import '../../../common/constants.dart';
// import '../../common/constants.dart';
import '../../widgets/navigation_drawer.dart';
import '../../widgets/search_empty.dart';
// import '../widgets/navigation_drawer.dart';

class UserViewPage extends StatelessWidget {
  UserViewPage({Key? key}) : super(key: key);

  // final String url = 'https://covid19.mathdro.id/api';
  final String url = 'http://192.168.106.1:8000/api/user';

  Future getUsers() async {
    var response = await http.get(Uri.parse(url));
    print(json.decode(response.body));
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    getUsers();

    return Scaffold(
      extendBodyBehindAppBar: true,
      drawer: NavigationDrawer(),
      appBar: AppBar(
        iconTheme: IconThemeData(color: biruColor),
        title: Text(
          'User',
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
        actions: [
          IconButton(
            onPressed: () {
              // Navigator.pushNamed(context, SearchPage.ROUTE_NAME);
            },
            icon: Icon(Icons.search),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        backgroundColor: biruColor,
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) {
                return UserCreatePage();
              },
            ),
          );
        },
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: FutureBuilder(
          future: getUsers(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                itemCount: snapshot.data['data'].length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => UserDetailPage(
                            users: snapshot.data['data'][index],
                          ),
                        ),
                      );
                    },
                    child: Container(
                      height: 140,
                      child: Card(
                        color: softBlueColor,
                        elevation: 3,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Row(
                            children: [
                              Expanded(
                                child: Container(
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Text(snapshot.data['data'][index]['nama'],
                                          style: ktittle),
                                      Text(
                                        snapshot.data['data'][index]['email'],
                                        style: kdescriptionhitam,
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Text(
                                        snapshot.data['data'][index]['address'],
                                        style: kdescription,
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Text("Role", style: kdescription),
                              // Text(snapshot.data['data'][index]['role'][index]
                              //     ['nama_role']),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                  // Text(snapshot.data['data'][index]['nama'])
                },
              );
            } else {
              return SearchLoading(
                title: 'Loading Get Data User',
                subtitle: '',
              );

              // SearchEmpty(
              //   icon: Icons.person_off,
              //   title: "No Data User",
              //   subtitle: "",
              // );
            }
          },
        ),
      ),
    );
  }
}
