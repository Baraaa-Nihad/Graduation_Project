import 'package:flutter/material.dart';
import 'package:graduation_projectflutter/main.dart';
import 'package:graduation_projectflutter/ui/patientsregister.dart';
import 'package:graduation_projectflutter/ui/questions.dart';
import 'package:graduation_projectflutter/utility/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PatientLogin extends StatefulWidget {
  const PatientLogin({Key? key}) : super(key: key);

  @override
  _PatientLoginState createState() => _PatientLoginState();
}

class _PatientLoginState extends State<PatientLogin> {
  TextEditingController username = new TextEditingController();
  TextEditingController Password = new TextEditingController();

  savePref(String username) async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    preferences.setString("username", username);
    //preferences.setString("email", email);
    print(preferences.getString("username"));
    //print(preferences.getString("email"));
  }

  @override
  Widget build(BuildContext context) {
    final forgotLabel = Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        FlatButton(
          padding: const EdgeInsets.all(0.0),
          child: const Text("   Don't have an account?",
              style: const TextStyle(fontWeight: FontWeight.w400)),
          onPressed: () {
//            Navigator.pushReplacementNamed(context, '/reset-password');
          },
        ),
        FlatButton(
          padding: const EdgeInsets.only(left: 0.0),
          child: const Text("Sign up",
              style: TextStyle(fontWeight: FontWeight.w400)),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => PatientsRegister()));
          },
        ),
      ],
    );

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: HexColor('#5C5EDD').withOpacity(0.5),
          centerTitle: true,
          title: const Text(
            'Patient Login',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            height: MediaQuery.of(context).size.height,
            width: double.infinity,
            padding: const EdgeInsets.all(40.0),
            child: Form(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 15.0,
                  ),
                  const Text(
                    "Uesrname",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    autofocus: false,
                    controller: username,

                    //  validator: validateEmail,
                    // onSaved: (value) => _userName = value!,
                    decoration:
                        buildInputDecoration('Enter Uesrname', Icons.email),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  const Text(
                    "Password",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 17,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  TextFormField(
                    autofocus: false,
                    obscureText: true,
                    validator: (value) =>
                        value!.isEmpty ? "Please enter password" : null,
                    // onSaved: (value) => _password = value!,
                    decoration:
                        buildInputDecoration('Enter Password', Icons.lock),
                  ),
                  const SizedBox(
                    height: 20.0,
                  ),
                  MaterialButton(
                    minWidth: double.infinity,
                    height: 60,
                    onPressed: () {
                      if (username != null) {
                        savePref(username.text);
                      }

                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => qusetions()));
                    },
                    color: Colors.black.withOpacity(0.4),
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50),
                    ),
                    child: const Text(
                      "Login",
                      style: TextStyle(
                          fontWeight: FontWeight.w800,
                          fontSize: 20,
                          color: Colors.white),
                    ),
                  ),
                  forgotLabel
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
