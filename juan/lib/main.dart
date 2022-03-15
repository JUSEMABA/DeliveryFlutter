import 'package:juan/src/login/login_page.dart';
import 'package:juan/src/register/register_page.dart';
import 'package:juan/src/roles/roles_page.dart';
import 'package:juan/src/utils/my_colors.dart';
import 'package:juan/src/client/products/list/client_products_list_page.dart';
import 'package:juan/src/restaurant/orders/list/restaurant_orders_list_page.dart';
import 'package:juan/src/delivery/orders/list/delivery_orders_list_page.dart';
import 'package:flutter/material.dart';


void main() {

  runApp(MyApp());

}


class MyApp extends StatefulWidget {

  const MyApp({Key? key}) : super(key: key);


  @override

  _MyAppState createState() => _MyAppState();

}


class _MyAppState extends State<MyApp> {

  @override

  Widget build(BuildContext context) {

    return MaterialApp(

      debugShowCheckedModeBanner: false,

      title: 'Delivery App Flutter',

      initialRoute: 'login',

      routes: {

        'login': (BuildContext context) => LoginPage(),
        'register': (BuildContext context) => RegisterPage(),
        'client/products/list':(BuildContext context)=> ClientProductsListPage(),
        'restaurant/orders/list':(BuildContext context)=>RestaurantOrdersListPage(),
        'delivery/orders/list': (BuildContext context) =>DeliveryOrdersListPage(),
        'roles':(BuildContext context)=>RolesPage()
      },

      theme: ThemeData(

          primaryColor: MyColors.primaryColor,

          //

          fontFamily: 'Roboto'),

    );

  }

}
