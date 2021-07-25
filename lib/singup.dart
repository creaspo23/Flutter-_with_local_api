import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:project1/login_screen.dart';
import 'package:project1/services/auth.dart';
import 'package:project1/user/form.dart';
import 'package:provider/provider.dart';

class SingUp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<SingUp> {
//Controller
  final TextEditingController fullNameContoller = new TextEditingController();
  final TextEditingController emailController = new TextEditingController();
  final TextEditingController passwordController = new TextEditingController();
  final TextEditingController confirmPasswordController =
      new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  void dispose() {
    fullNameContoller.dispose();
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => initWidget();

  Widget initWidget() {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 250,
              decoration: BoxDecoration(
                borderRadius:
                    BorderRadius.only(bottomLeft: Radius.circular(90)),
                color: new Color(0xffF5591F),
                gradient: LinearGradient(
                  colors: [(new Color(0xffF5591F)), new Color(0xffF2861E)],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                ),
              ),
              child: Center(
                  child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 50),
                    child: Image.asset(
                      "assets/app_logo.png",
                      height: 90,
                      width: 90,
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(right: 20, top: 20),
                    alignment: Alignment.bottomRight,
                    child: Text(
                      "Singup",
                      style: TextStyle(fontSize: 20, color: Colors.white),
                    ),
                  )
                ],
              )),
            ),
            Form(
              key: _formKey,
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20, right: 20, top: 70),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE)),
                  ],
                ),
                child: TextFormField(
                  //full1 controller
                  validator: (value) =>
                      value!.isEmpty ? 'Name cannot be null!' : null,
                  controller: fullNameContoller,
                  keyboardType: TextInputType.name,
                  cursorColor: Color(0xffF5591F),
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: Color(0xffF5591F),
                    ),
                    hintText: "name",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xffEEEEEE),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 20),
                      blurRadius: 100,
                      color: Color(0xffEEEEEE)),
                ],
              ),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                validator: (value) =>
                    value!.isEmpty ? 'please enter valid Email' : null,
                controller: emailController,
                cursorColor: Color(0xffF5591F),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.email,
                    color: Color(0xffF5591F),
                  ),
                  focusColor: Color(0xffF5591F),
                  hintText: "Email",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xffEEEEEE),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 20),
                      blurRadius: 100,
                      color: Color(0xffEEEEEE)),
                ],
              ),
              child: TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                validator: (value) =>
                    value!.isEmpty ? 'password required' : null,
                controller: passwordController,
                cursorColor: Color(0xffF5591F),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.security,
                    color: Color(0xffF5591F),
                  ),
                  focusColor: Color(0xffF5591F),
                  hintText: "password",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(left: 20, right: 20, top: 20),
              padding: EdgeInsets.only(left: 20, right: 20),
              height: 54,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xffEEEEEE),
                boxShadow: [
                  BoxShadow(
                      offset: Offset(0, 20),
                      blurRadius: 100,
                      color: Color(0xffEEEEEE)),
                ],
              ),
              child: TextFormField(
                keyboardType: TextInputType.text,
                obscureText: true,
                validator: (value) =>
                    value!.isEmpty ? 'password required' : null,
                controller: confirmPasswordController,
                cursorColor: Color(0xffF5591F),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.security,
                    color: Color(0xffF5591F),
                  ),
                  focusColor: Color(0xffF5591F),
                  hintText: "Confirm Password",
                  enabledBorder: InputBorder.none,
                  focusedBorder: InputBorder.none,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Map creds = {
                  'name': fullNameContoller.text,
                  'email': emailController.text,
                  'password': passwordController.text,
                };
                if (_formKey.currentState!.validate()) {
                  Provider.of<Auth>(context, listen: false)
                      .register(creds: creds);
                }
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => UserForm(),
                    ));
              },
              child: Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(left: 20, right: 20, top: 70),
                padding: EdgeInsets.only(left: 20, right: 20),
                height: 54,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      colors: [(new Color(0xffF5591F)), new Color(0xffF2861E)],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight),
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.grey[200],
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(0, 10),
                        blurRadius: 50,
                        color: Color(0xffEEEEEE)),
                  ],
                ),
                child: Text(
                  "SingUp",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("All Read Have Account?"),
                  GestureDetector(
                    child: Text(
                      "Login",
                      style: TextStyle(color: Color(0xffF5591F)),
                    ),
                    onTap: () {
                      // Write Tap Code Here.
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => LoginScreen(),
                          ));
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
