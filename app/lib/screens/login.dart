export 'package:app/screens/login.dart';
import 'package:app/models/user.dart';
import 'package:app/screens/home.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formKey = GlobalKey<FormState>();
  String message = '';

  Future getData() async {
    final response = await http.get('http://192.168.1.10:8000/app/api/person/',
        headers: {
          "Authorization": "TOKEN c34dc4ef6d55c729b285d0db141049b62dea2458"
        });
    if (response.statusCode == 200) {
      message = response.body;
    } else {
      message = response.body;
    }
    return message;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Column(
      children: [
        Form(
          key: _formKey,
          child: Padding(
            padding: const EdgeInsets.all(52.0),
            child: Column(
              children: <Widget>[
                Icon(
                  Icons.person,
                  size: 60,
                ),
                SizedBox(
                  height: 30.0,
                ),
                TextFormField(
                  controller: usernameController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter username';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      hintText: "Username",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                ),
                SizedBox(
                  height: 15.0,
                ),
                TextFormField(
                  controller: passwordController,
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Enter Password';
                    }
                    return null;
                  },
                  obscureText: true,
                  decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30.0))),
                ),
                SizedBox(
                  height: 25.0,
                ),
                RaisedButton(
                  onPressed: () {
                    FutureBuilder<dynamic>(
                      future: getData(),
                      builder: (BuildContext context, AsyncSnapshot snapshot) {
                        Widget responseText;
                        if (snapshot.hasData) {
                          responseText = Text(message);
                        } else if (snapshot.hasError) {
                          responseText = Text("Error fetching data");
                        } else {
                          responseText = CircularProgressIndicator();
                        }
                        return Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [responseText],
                          ),
                        );
                      },
                    );

                    if (_formKey.currentState.validate()) {
                      final String username = usernameController.text;
                      final String password = passwordController.text;

                      // Scaffold.of(context)
                      //     .showSnackBar(SnackBar(content: Text("Hello")));

                      // Navigator.pop(context);

                      // Navigator.push(
                      //     context,
                      //     MaterialPageRoute(
                      //       builder: (context) => MyHomePage(
                      //         title: 'Home',
                      //       ),
                      //       settings: RouteSettings(
                      //         arguments: User(username: username),
                      //       ),
                      //     ));
                    }
                  },
                  child: Text(
                    "Log In",
                    style: TextStyle(fontSize: 20.0),
                  ),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                )
              ],
            ),
          ),
        ),
        // FutureBuilder<dynamic>(
        //   future: getData(),
        //   builder: (BuildContext context, AsyncSnapshot snapshot) {
        //     Widget responseText;
        //     if (snapshot.hasData) {
        //       responseText = Text(message);
        //     } else if (snapshot.hasError) {
        //       responseText = Text("Error fetching data");
        //     } else {
        //       responseText = CircularProgressIndicator();
        //     }
        //     return Center(
        //       child: Column(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         crossAxisAlignment: CrossAxisAlignment.center,
        //         children: [responseText],
        //       ),
        //     );
        //   },
        // )
      ],
    );
  }
}
