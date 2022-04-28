// ignore_for_file: prefer_const_constructors

import 'package:auth_buttons/auth_buttons.dart';

import 'package:flutter/material.dart';
import '../AuthService.dart';
// import '../services/auth_service.dart';
import 'RegisterPage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'homepage.dart';
import 'package:bmi_app/pages/homepage.dart';


//import 'package:auth_buttons/auth_buttons.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _pass = TextEditingController();
  //final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: _formKey, 
        child: ListView(
         // mainAxisAlignment: MainAxisAlignment.center,
          children: [
             SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
             Container(
                height: 213,
                //color: Colors.amber,
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('images/foood.jpg'),
                ))),

            emailInput(),
            paaswordInput(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            signinButton(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            signupButton(),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            const Divider(),
            GoogleAuthButton(
              onPressed: () async {
                UserCredential userCredential = await signInWithGoogle();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(),
                    ));
                // your implementation
              },
              darkMode: false,
            ),
          ],
        ),
      ),
    );
  }

 
  Widget emailInput() {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 236, 236, 236),
          borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25),
        child: TextField(
          controller: _email,
          decoration: InputDecoration(
            labelText: 'E-mail',
            //hintText: hintTitle,
            hintStyle: TextStyle(
                fontSize: 18,
                color: Colors.white70,
                fontStyle: FontStyle.italic),
          ),
          //keyboardType: keyboardType,
        ),
      ),
    );
    // return SizedBox(
    //   width: 250,
    //   child: TextFormField(
    //     controller: _email,
    //     decoration: const InputDecoration(prefixIcon: Icon(Icons.email)),
    //   ),
    // );
  }

 Widget paaswordInput() {
    return Container(
      margin: EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
          color: Color.fromARGB(255, 236, 236, 236),
          borderRadius: BorderRadius.circular(30)),
      child: Padding(
        padding: const EdgeInsets.only(left: 25.0, right: 25),
        child: TextField(
          controller: _pass,
          obscureText: true,
          decoration: InputDecoration(
            labelText: 'Password',
            //hintText: hintTitle,
            hintStyle: TextStyle(
                fontSize: 18,
                color: Colors.white70,
                fontStyle: FontStyle.italic),
          ),
          // keyboardType: keyboardType,
        ),
      ),
    );

    // return SizedBox(
    //   width: 250,
    //   child: TextFormField(
    //     controller: _pass,
    //     obscureText: true,
    //     decoration: const InputDecoration(prefixIcon: Icon(Icons.password)),
    //   ),
    // );
  }

  signupButton() {
  return Container(
      height: 50,
      width: 115,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 141, 237, 166),
        //border: Border.all(color: Colors.grey.withOpacity(0.4), width: 1),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Icon(icon, size: 24),
          TextButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) =>
                          RegisterPage()),
                    ));
              // registerUser(_email.text, _pass.text);
            },
            child: Text(
                'ลงทะเบียน',
                style: TextStyle(color: Colors.brown[800]),
          )),
        ],
      ),
    );
  }

  signinButton() {
    return Container(
      height: 50,
      width: 115,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 136, 252, 186),
        //border: Border.all(color: Colors.grey.withOpacity(0.4), width: 1),
        borderRadius: BorderRadius.circular(100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //Icon(icon, size: 24),
          TextButton(
            onPressed: ()  {
              loginUser(_email.text, _pass.text).then((value) {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => const MyHomePage(),
                ),
              );
            });
            },
             child: Text(
                'เข้าสู่ระบบ',
                style: TextStyle(color: Colors.brown[800]),
          )),
        ],
      ),
    );
  }
}
