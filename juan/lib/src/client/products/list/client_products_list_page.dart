import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:juan/src/client/products/list/client_product_list_controller.dart';
import 'package:juan/src/utils/my_colors.dart';

class ClientProductsListPage extends StatefulWidget {
  ClientProductsListPage({Key? key}) : super(key: key);

  @override
  _ClientProductsListPageState createState() => _ClientProductsListPageState();
}

class _ClientProductsListPageState extends State<ClientProductsListPage> {
  
  ClientProductsListController _con = new ClientProductsListController();

  @override

  void initState() {

    super.initState();


    SchedulerBinding.instance!.addPostFrameCallback((timeStamp) {

      _con.init(context,refresh);

    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _con.key,
      appBar: AppBar(
        leading: _menuDrawer(),
      ),
      drawer: _drawer(),
      
      body: Center(

        child: ElevatedButton(

          child: Text('Sign off'),

          onPressed: _con.logout,
        ),
      ),
    );

  }

  Widget _menuDrawer() {

    return GestureDetector(
      onTap: _con.openDrawer,
      child: Container(
        margin: EdgeInsets.only(left: 20),
        alignment: Alignment.centerLeft,
        child: Image.asset(
          'assets/img/menu.png',
          width: 20,
          height: 20,

        ),

      ),

    );

  }



  Widget _drawer() {

    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: BoxDecoration(color: MyColors.primaryColor),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Text(
                    '${_con.user?.username ?? ' '} ',
                    style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                  ),

                  Text(
                    _con.user?.email ?? ' ',
                    style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[200],
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.italic),
                    maxLines: 1,
                  ),
                ],

              )),

          ListTile(
            title: Text('Editar perfil'),
            trailing: Icon(Icons.edit_outlined),

          ),

          ListTile(
            title: Text('Mis pedidos'),
            trailing: Icon(Icons.shopping_cart_outlined),

          ),

          _con.user != null
              ? _con.user!.roles!.length > 1
                  ? ListTile(
                      onTap: _con.goToRoles,
                      title: Text('Seleccionar Rol'),
                      trailing: Icon(Icons.person_outline),
                    )
                  : Container()
              : Container(),

          ListTile(

            onTap: _con.logout,
            title: Text('Cerrar Sesion'),
            trailing: Icon(Icons.power_settings_new_outlined),

          )

        ],

      ),

    );

  }

  void refresh() {

    setState(() {});
  }

}