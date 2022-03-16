import 'package:juan/src/login/login_controller.dart';

import 'package:juan/src/utils/my_colors.dart';

import 'package:flutter/material.dart';

import 'package:flutter/scheduler.dart';



class LoginPage extends StatefulWidget {

  LoginPage({Key? key}) : super(key: key);


  @override

  _LoginPageState createState() => _LoginPageState();

}


class _LoginPageState extends State<LoginPage> {

  LoginController _con = new LoginController();

  bool? value = true;


  @override

  void initState() {
    _con.init(context);
  
    super.initState();
}


  @override

  Widget build(BuildContext context) {

    return Scaffold(

        body: Container(

      width: double.infinity,

      color: MyColors.screen,

      child: Stack(

        children: [

          

        

          SingleChildScrollView(

            child: Column(

              children: [

                SizedBox(height: 235),

                _textLogin(),

                SizedBox(height: 30),

                _textFieldEmail(),

                _textFieldPassword(),

                _remenberMe(),

                _buttonLogin(),

                _textDontHaveAccount(),

                

                SizedBox(height: 130),

              ],

            ),

          ),

        ],

      ),

    ));

  }


  Widget _textDontHaveAccount() {

    return Row(

      mainAxisAlignment: MainAxisAlignment.center,

      children: [

        GestureDetector(

          onTap: _con.goToRegisterPage,

          child: Text(

            'Sign up here',

            style: TextStyle(

                fontWeight: FontWeight.bold, color: MyColors.primaryColor),

          ),

        )

      ],

    );

  }


  Widget _buttonLogin() {

    return Container(

      width: double.infinity,

      margin: EdgeInsets.symmetric(horizontal: 60, vertical: 20),

      child: ElevatedButton(

        onPressed: _con.login,

        child: Text('Sing in',
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


  Widget _textFieldEmail() {

    return Container(

      margin: EdgeInsets.symmetric(horizontal: 60, vertical: 5),

      decoration: BoxDecoration(

          color: MyColors.primaryOpacityColor,

          borderRadius: BorderRadius.circular(5)),

      child: TextField(

        controller:_con.emailController,

        keyboardType: TextInputType.emailAddress,

        decoration: InputDecoration(

            hintText: 'Username',

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


  Widget _textFieldPassword() {

    return Container(

      margin: EdgeInsets.symmetric(horizontal: 60, vertical: 5),

      decoration: BoxDecoration(

          color: MyColors.primaryOpacityColor,

          borderRadius: BorderRadius.circular(5)),

      child: TextField(

        obscureText: true,
        controller: _con.passwordController,

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


  


  Widget _textLogin() {

    return Text(

      'LOGIN',

      style: TextStyle(

          color: Colors.white,

          

          fontWeight: FontWeight.bold,

        

          fontSize: 22,

          fontFamily: 'NimbusSans'),

    );

  }

  Widget _remenberMe() {
    return Container(
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 35),
        child: CheckboxListTile(
          controlAffinity: ListTileControlAffinity.leading,
          title: Text('Remember me',
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