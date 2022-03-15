import 'dart:convert';

import 'package:juan/src/models/rol.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    String? id;
    String? email;
    String? username;
    String? password;
    String? sesionToken;
    List<Rol>? roles=[];

    User({
        this.id,
        this.email,
        this.username,
        this.password,
        this.sesionToken,
        this.roles,
    });

  

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"] is int ? json['id'].toString() : json ['id'],
        email: json["email"],
        username: json["username"],
        password: json["password"],
        sesionToken: json["sesion_token"],
        roles: json["roles"]==null ?[]: List<Rol>.from(json['roles'].map((model)=>Rol.fromJson(model)))
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "email": email,
        "username": username,
        "password": password,
        "sesion_token": sesionToken,
        "roles": roles,
    };
}