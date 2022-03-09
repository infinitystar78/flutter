import 'package:flutter/material.dart';

void main() {
  runApp(const HelloShopper());




}

class HelloShopper extends StatelessWidget {
  const HelloShopper({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello Shopper',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}




class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

lass _MyHomePageState extends State<MyHomePage> {
TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

@override
Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: Text('Form validation example'),
      ),
      body:
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child:Form(
          key: formGlobalKey,
          child: Column(
            children: [
              const SizedBox(height: 50),
              TextFormField(
                decoration: InputDecoration(
                    labelText: "Email"
                ),
                validator: (email) {
                  if (isEmailValid(email)) return null;
                  else
                    return 'Enter a valid email address';
                },
              ),
              const SizedBox(height: 24),
              TextFormField(
                decoration: InputDecoration(
                  labelText: "Password",
                ),
                maxLength: 6,
                obscureText: true,
                validator: (password) {
                  if (isPas

                  swordValid(password)) return null;
                  else
                    return 'Enter a valid password';
                },
              ),
              const SizedBox(height: 50),
              ElevatedButton(
                  onPressed: () {
                    if (formGlobalKey.currentState.validate()) {
                      formGlobalKey.currentState.save();
                      // use the email provided here
                    }
                  },
                  child: Text("Submit"))
            ],
          ),
        ),
      ));
}



}

mixin InputValidationMixin {
  bool isPasswordValid(String password) => password.length == 6;

  bool isEmailValid(String email) {
    Pattern pattern =
        r'^(([^<>()[\]\\.,;:\s@"]+(\.[^<>()[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    return regex.hasMatch(email);
  }
}