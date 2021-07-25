import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:date_time_picker/date_time_picker.dart';
import 'package:project1/services/auth.dart';
import 'package:provider/provider.dart';

class UserForm extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => InitState();
}

class InitState extends State<UserForm> {

//Controller
  final TextEditingController nameController = new TextEditingController();
  final TextEditingController ageController = new TextEditingController();
  final TextEditingController addresssController = new TextEditingController();
  final TextEditingController injuryController = new TextEditingController();
  final TextEditingController phoneNumberController = new TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? date;

  String genderValue = 'Male';
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
                      "Form Request",
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
                  controller: nameController,
                  validator: (value) => value!.isEmpty ? 'Name required' : null,
                  keyboardType: TextInputType.name,
                  cursorColor: Color(0xffF5591F),
                  decoration: InputDecoration(
                    icon: Icon(
                      Icons.person,
                      color: Color(0xffF5591F),
                    ),
                    hintText: "Full Name",
                    enabledBorder: InputBorder.none,
                    focusedBorder: InputBorder.none,
                  ),
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  padding: EdgeInsets.only(left: 20, right: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  child: DropdownButton<String>(
                    value: genderValue,
                    hint: Text("Gender"),
                    dropdownColor: Colors.white,
                    icon: Icon(Icons.arrow_drop_down),
                    iconSize: 36,
                    isExpanded: true,
                    underline: SizedBox(),
                    onChanged: (String? newvalue) {
                      setState(() {
                        genderValue = newvalue!;
                      });
                    },
                    items: <String>[
                      'Male',
                      'Female',
                    ].map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
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
                //age1 controller
                controller: ageController,
                validator: (value) => value!.isEmpty ? 'age is required' : null,
                keyboardType: TextInputType.number,
                cursorColor: Color(0xffF5591F),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.timelapse,
                    color: Color(0xffF5591F),
                  ),
                  focusColor: Color(0xffF5591F),
                  hintText: "age",
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
                //age1 controller
                controller: phoneNumberController,
                validator: (value) => value!.isEmpty ? 'phone is required' : null,
                keyboardType: TextInputType.number,
                cursorColor: Color(0xffF5591F),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.phone,
                    color: Color(0xffF5591F),
                  ),
                  focusColor: Color(0xffF5591F),
                  hintText: "phone number",
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
                //liveing1 controller
                controller: addresssController,
                validator: (value) =>
                    value!.isEmpty ? 'Address required' : null,
                cursorColor: Color(0xffF5591F),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.location_city,
                    color: Color(0xffF5591F),
                  ),
                  focusColor: Color(0xffF5591F),
                  hintText: "Address",
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
                //diseases1 controller
                controller: injuryController,
                cursorColor: Color(0xffF5591F),
                decoration: InputDecoration(
                  icon: Icon(
                    Icons.addchart,
                    color: Color(0xffF5591F),
                  ),
                  focusColor: Color(0xffF5591F),
                  hintText: "Diseases",
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
                      color: Color(0xFF181111)),
                ],
              ),

              // Date picker
              child: DateTimePicker(
                  style: TextStyle(),
                  initialValue: '',
                  firstDate: DateTime(1990),
                  lastDate: DateTime(2100),
                  dateLabelText: 'Date',
                  icon: Icon(Icons.calendar_today),
                  onChanged: (val) => print(val),
                  validator: (val) {
                    print(val);
                    return null;
                  },
                  onSaved: (val) => date),
            ),
            GestureDetector(
              onTap: () {
                Map creds = {
                  'name': nameController.text,
                  'gender': genderValue,
                  'addresss': addresssController.text,
                  'age': ageController.text,
                  'injury': injuryController.text,
                  'phone_number': phoneNumberController.text,
                };
                if (_formKey.currentState!.validate()) {
                  Provider.of<Auth>(context, listen: false).store(creds: creds);
                }
                print(creds);
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
                  "Save",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
