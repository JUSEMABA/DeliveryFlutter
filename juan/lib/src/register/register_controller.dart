import 'package:juan/src/models/response_api.dart';
import 'package:juan/src/models/user.dart';
import 'package:juan/src/provider/user_provider.dart';
import 'package:juan/src/utils/my_snackbar.dart';
import 'package:flutter/material.dart';



class RegisterController {

  BuildContext? context;

  TextEditingController emailController = new TextEditingController();

  TextEditingController usernameController = new TextEditingController();

  TextEditingController passController = new TextEditingController();

  TextEditingController confirmPassController = new TextEditingController();

  UserProvider userProvider = new UserProvider();

  Future? init(BuildContext context) {

    this.context = context;

    userProvider.init(context);

  }


  void register() async {

    String email = emailController.text.trim();

    String username = usernameController.text;

    String pass = passController.text.trim();

    String confirmPass = confirmPassController.text.trim();


    if (email.isEmpty ||

        username.isEmpty ||

        pass.isEmpty ||

        confirmPass.isEmpty) {

      MySnackbar.show(context!, 'Debes Ingresar Todos los Datos');


      return;

    }


    if (pass != confirmPass) {

      MySnackbar.show(context!, 'Las Contraseñas no coinciden');

      return;

    }


    if (pass.length < 6) {

      MySnackbar.show(context!, 'Las Contraseña tiene menos de 6 Digitos');

      return;

    }


    User user = new User(

        email: email,

        password: pass,

        username: username,
    );

    ResponseApi responseApi = await userProvider.create(user);


    MySnackbar.show(context!, responseApi.message!);


    if (responseApi.success!) {

      Future.delayed(Duration(seconds: 4), () {

        Navigator.pushReplacementNamed(context!, 'login');

      });

    }


    print('Respuesta: ${responseApi.toJson()} ');

  }



  void back() {

    Navigator.pop(context!);

  }

}