import 'dart:math';

import 'package:flutter/material.dart';
import 'package:submission_dicoding/data/image_list.dart';
import 'package:submission_dicoding/main_page.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  String nama = "Anonim";

  OutlineInputBorder outlineInputBorder() => OutlineInputBorder(
        borderSide: BorderSide(
          width: 3.0,
          color: Color.fromARGB(255, 46, 255, 255),
        ),
        borderRadius: BorderRadius.circular(20.0),
      );

  TextStyle textStyle() => TextStyle(
        fontFamily: 'PT Sans',
        fontSize: 24,
      );

  String image() {
    int count = Random().nextInt(imageList.length);
    return imageList[count];
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      print(constraints);
      bool keyboardLanscape = true;
      if (constraints.maxHeight < 500.0) {
        keyboardLanscape = false;
      }
      return Scaffold(
        resizeToAvoidBottomInset: keyboardLanscape,
        body: Column(
          children: <Widget>[
            Flexible(
              flex: 1,
              child: Stack(
                children: <Widget>[
                  Opacity(
                    opacity: 0.5,
                    child: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(image()),
                              repeat: ImageRepeat.repeat)),
                    ),
                  ),
                  Center(
                    child: Text(
                      'MyFood',
                      style: TextStyle(
                        fontFamily: 'Pacifico',
                        fontSize: constraints.maxWidth < 550
                            ? constraints.maxWidth * 0.17
                            : constraints.maxWidth * 0.1,
                        color: Color.fromARGB(255, 46, 255, 255),
                        shadows: <Shadow>[
                          Shadow(
                            offset: Offset(5.0, -5.0),
                            color: Color.fromARGB(175, 143, 219, 242),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Flexible(
              flex: 1,
              child: Stack(
                children: <Widget>[
                  Container(
                    color: Colors.amber.withAlpha(120),
                  ),
                  Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: constraints.maxWidth * 0.1),
                          child: TextFormField(
                            onTap: () {},
                            textAlign: TextAlign.center,
                            style: textStyle(),
                            decoration: InputDecoration(
                              enabledBorder: outlineInputBorder(),
                              focusedBorder: outlineInputBorder(),
                              border: outlineInputBorder(),
                              hintText: 'Masukkan nama Anda...',
                              hintStyle: textStyle(),
                              labelText: 'Username',
                              labelStyle: textStyle(),
                              errorStyle: TextStyle(fontSize: 18.0),
                            ),
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Please enter some text';
                              }
                              nama = value;
                              return null;
                            },
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(top: 30.0),
                          height: 50.0,
                          width: 200.0,
                          child: ElevatedButton(
                            style: ButtonStyle(
                                padding: MaterialStateProperty.all(
                                    EdgeInsets.all(5.0)),
                                shape: MaterialStateProperty.all(
                                    RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(20.0)))),
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                Navigator.pushReplacement(context,
                                    MaterialPageRoute(builder: (context) {
                                  return MainPage(nama: nama);
                                }));
                              }
                            },
                            child: Text(
                              'Sign In',
                              style: TextStyle(
                                  fontFamily: 'PT Sans', fontSize: 30.0),
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );
    });
  }
}
