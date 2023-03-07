import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/FormHelper.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import 'package:snippet_coder_utils/hex_color.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool isApiCallProces = false;
  bool hidePassword = true;

  GlobalKey<FormState> globalFormKey = GlobalKey<FormState>();
  String? Nombres;
  String? Apellidos;
  String? email;
  String? pais;
  String? username;
  String? password;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SafeArea(
        child: Scaffold(
      backgroundColor: HexColor("#16285A"),
      body: ProgressHUD(
        child: Form(
          key: globalFormKey,
          child: _RegisterUI(context),
        ),
        inAsyncCall: isApiCallProces,
        key: UniqueKey(),
        opacity: 0.3,
      ),
    ));
  }

  Widget _RegisterUI(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width / 2,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.white,
                      Colors.white,
                    ]),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(100),
                  bottomRight: Radius.circular(100),
                )),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Align(
                  alignment: Alignment.center,
                  child: Image.asset("assets/images/logo_app.png",
                      width: 200, fit: BoxFit.contain),
                ),
              ],
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, bottom: 30, top: 50),
              child: Text(
                "REGISTRO",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                    color: Colors.white),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormHelper.inputFieldWidget(
                context,
                "Nombre de Usuario",
                "Nombre de Usuario",
                (String onval) => {
                      if (onval.isEmpty) {"Usename cant\'t be empty"}
                    },
                (String onsave) => {username = onsave},
                borderFocusColor: Colors.white,
                prefixIconColor: Colors.white,
                borderColor: Colors.white,
                textColor: Colors.white,
                hintColor: Colors.white.withOpacity(0.7),
                borderRadius: 10,
                prefixIcon: Icon(Icons.person),
                prefixIconPaddingLeft: 15,
                showPrefixIcon: true,
                paddingLeft: 11),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: FormHelper.inputFieldWidget(
                context,
                "password",
                "Contraseña",
                (String onval) => {
                      if (onval.isEmpty) {"Usename cant\'t be empty"}
                    },
                (String onsave) => {username = onsave},
                borderFocusColor: Colors.white,
                prefixIconColor: Colors.white,
                borderColor: Colors.white,
                textColor: Colors.white,
                hintColor: Colors.white.withOpacity(0.7),
                borderRadius: 10,
                prefixIcon: Icon(Icons.key_rounded),
                prefixIconPaddingLeft: 15,
                obscureText: hidePassword,
                showPrefixIcon: true,
                suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        hidePassword = !hidePassword;
                      });
                    },
                    icon: Icon(hidePassword
                        ? Icons.visibility_off
                        : Icons.visibility)),
                paddingLeft: 11),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.only(right: 25, top: 10),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    color: Colors.grey,
                    fontSize: 14.0,
                  ),
                  children: [
                    TextSpan(
                        text: "Olvidaste tu contraseña?",
                        style: TextStyle(
                            color: Colors.white,
                            decoration: TextDecoration.underline),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print("Olvidaste la contrasena");
                          }),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: FormHelper.submitButton("Login", () => {},
                btnColor: HexColor("#283B71"),
                borderColor: HexColor("#EBEBF5"),
                txtColor: HexColor("#EBEBF5"),
                borderRadius: 10),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: Text(
              "O",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Center(
            child: FormHelper.submitButton(
                "Registrate",
                () => {
                      print("Registrate"),
                      Navigator.pushNamed(context, "/register")
                    },
                btnColor: HexColor("#283B71"),
                borderColor: HexColor("#EBEBF5"),
                txtColor: HexColor("#EBEBF5"),
                borderRadius: 10),
          ),
        ],
      ),
    );
  }
}
