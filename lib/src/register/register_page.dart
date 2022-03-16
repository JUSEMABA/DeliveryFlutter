import 'package:juan/src/register/register_controller.dart';

import 'package:juan/src/utils/my_colors.dart';

import 'package:flutter/material.dart';

import 'package:flutter/scheduler.dart';


class RegisterPage extends StatefulWidget {

  RegisterPage({Key? key}) : super(key: key);


  @override

  _RegisterPageState createState() => _RegisterPageState();

}


class _RegisterPageState extends State<RegisterPage> {

  RegisterController _con = new RegisterController();
  bool? value = true;


  @override

  void initState() {

    super.initState();

    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {

      _con.init(context);

    });

  }


  @override

  Widget build(BuildContext context) {

    return Scaffold(

      body: Container(

        width: double.infinity,

        color: MyColors.screen,

        child: Stack(

          children: [


            Container(

              width: double.infinity,

              margin: EdgeInsets.only(top: 120),

              child: SingleChildScrollView(

                child: Column(

                  children: [

                    _imageUser(),

                    SizedBox(height: 15),

                    _textFieldEmail(),

                    _textFieldName(),

                    _textFieldPassword(),

                    _textFieldConfirmPassword(),

                    _remenberMe(),

                    _buttonRegister(),
                    
                    SizedBox(height: 170),

                  ],

                ),

              ),

            )

          ],

        ),

      ),

    );

  }


  Widget _imageUser() {

    return Text(

      'SIGN UP',

      style: TextStyle(

          color: Colors.white,

          

          fontWeight: FontWeight.bold,

        

          fontSize: 22,

          fontFamily: 'NimbusSans'),

    );

  }


 


  Widget _textFieldEmail() {

    return Container(

      margin: EdgeInsets.symmetric(horizontal: 60, vertical: 5),

      decoration: BoxDecoration(

          color: MyColors.primaryOpacityColor,

          borderRadius: BorderRadius.circular(5)),

      child: TextField(

        keyboardType: TextInputType.emailAddress,

        controller: _con.emailController,

        decoration: InputDecoration(

            hintText: 'Email',

            hintStyle: TextStyle(color: MyColors.primaryColorDark),

            border: InputBorder.none,

            contentPadding: EdgeInsets.all(15),

            prefixIcon: Icon(

              Icons.email,

              color: MyColors.primaryColor,

            )),

      ),

    );

  }


  Widget _textFieldName() {

    return Container(

      margin: EdgeInsets.symmetric(horizontal: 60, vertical: 5),

      decoration: BoxDecoration(

          color: MyColors.primaryOpacityColor,

          borderRadius: BorderRadius.circular(5)),

      child: TextField(

        controller: _con.usernameController,

        decoration: InputDecoration(

            hintText: 'Username',

            hintStyle: TextStyle(color: MyColors.primaryColorDark),

            border: InputBorder.none,

            contentPadding: EdgeInsets.all(15),

            prefixIcon: Icon(

              Icons.person,

              color: MyColors.primaryColor,

            )),

      ),

    );

  }


  


  


  Widget _textFieldPassword() {

    return Container(

      margin: EdgeInsets.symmetric(horizontal: 60, vertical: 5),

      decoration: BoxDecoration(

          color: MyColors.primaryOpacityColor,

          borderRadius: BorderRadius.circular(5)),

      child: TextField(

        obscureText: true,

        controller: _con.passController,

        decoration: InputDecoration(

            hintText: 'Password',

            hintStyle: TextStyle(color: MyColors.primaryColorDark),

            border: InputBorder.none,

            contentPadding: EdgeInsets.all(15),

            prefixIcon: Icon(

              Icons.lock,

              color: MyColors.primaryColor,

            )),

      ),

    );

  }


  Widget _textFieldConfirmPassword() {

    return Container(

      margin: EdgeInsets.symmetric(horizontal: 60, vertical: 5),

      decoration: BoxDecoration(

          color: MyColors.primaryOpacityColor,

          borderRadius: BorderRadius.circular(5)),

      child: TextField(

        obscureText: true,

        controller: _con.confirmPassController,

        decoration: InputDecoration(

            hintText: 'Confirm password',

            hintStyle: TextStyle(color: MyColors.primaryColorDark),

            border: InputBorder.none,

            contentPadding: EdgeInsets.all(15),

            prefixIcon: Icon(

              Icons.lock_outline,

              color: MyColors.primaryColor,

            )),

      ),

    );

  }


  Widget _buttonRegister() {

    return Container(

      width: double.infinity,

      margin: EdgeInsets.symmetric(horizontal: 60, vertical: 20),

      child: ElevatedButton(

        onPressed: _con.register,

        child: Text('Sing up',
        style: TextStyle(

                fontWeight: FontWeight.bold, color: MyColors.primaryColor),
        ),

        style: ElevatedButton.styleFrom(

            primary: MyColors.buttom,

            shape:

                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),

            padding: EdgeInsets.symmetric(vertical: 15)),

      ),

    );

  }

  Widget _remenberMe() {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 35),
        child: CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          title: Text('I agree to Terms of Use',
              style: TextStyle(
                  fontWeight: FontWeight.w100, color: MyColors.primaryColor)),
          value: this.value,
          onChanged: (bool? value) {
            setState(() {
              this.value = value;
            });
          },
        ));
  }




  

  

}