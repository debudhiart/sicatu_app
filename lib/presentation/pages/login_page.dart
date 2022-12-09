import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sicatu_app/presentation/pages/dashboard_page.dart';
// import 'package:sicatu_app/presentation/pages/user_view_page.dart';

import '../../common/constants.dart';
import '../../data/network/api.dart';
import '../widgets/navigation_drawer.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _isLoading = false;
  final _formKey = GlobalKey<FormState>();
  var email, password;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  bool _secureText = true;

  showHide() {
    setState(() {
      _secureText = !_secureText;
    });
  }

  _showMsg(msg) {
    final snackBar = SnackBar(
      content: Text(msg),
    );
    // _scaffoldKey.currentState.showSnackBar(snackBar);
  }

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
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Login",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 18),
                          TextFormField(
                              cursorColor: Colors.blue,
                              keyboardType: TextInputType.text,
                              decoration: InputDecoration(
                                hintText: "Email",
                              ),
                              validator: (emailValue) {
                                if (emailValue!.isEmpty) {
                                  return 'Please enter your email';
                                }
                                email = emailValue;
                                return null;
                              }),
                          SizedBox(height: 12),
                          TextFormField(
                              cursorColor: Colors.blue,
                              keyboardType: TextInputType.text,
                              obscureText: _secureText,
                              decoration: InputDecoration(
                                hintText: "Password",
                                suffixIcon: IconButton(
                                  onPressed: showHide,
                                  icon: Icon(_secureText
                                      ? Icons.visibility_off
                                      : Icons.visibility),
                                ),
                              ),
                              validator: (passwordValue) {
                                if (passwordValue!.isEmpty) {
                                  return 'Please enter your password';
                                }
                                password = passwordValue;
                                return null;
                              }),
                          SizedBox(height: 12),
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: biruColor,
                              minimumSize: Size(318, 44),
                            ),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                _login();
                              }
                            },
                            child: Text(
                              _isLoading ? 'Proccessing..' : 'Sign In',
                              textDirection: TextDirection.ltr,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18.0,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.normal,
                              ),
                            ),
                          ),
                        ],
                      ),
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

  void _login() async {
    setState(() {
      _isLoading = true;
    });
    var data = {'email': email, 'password': password};

    var res = await Network().auth(data, 'login');
    var body = json.decode(res.body);
    // Token.fromJson(res.body);

    print(res);
    if (body['success']) {
      SharedPreferences localStorage = await SharedPreferences.getInstance();
      localStorage.setString('token', json.encode(body['token']));
      localStorage.setString('user', json.encode(body['user']));
      Navigator.pushReplacement(
        context,
        new MaterialPageRoute(builder: (context) => DashboardPage()),
      );
    } else {
      _showMsg(body['message']);
    }

    setState(() {
      _isLoading = false;
    });
  }
}
