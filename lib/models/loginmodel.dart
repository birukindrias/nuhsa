// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

Welcome welcomeFromJson(dynamic str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
    Welcome({
        this.username = '',
        this.email = '',
    });

    String   username;
    String email;

    factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        username: json["username"],
        email: json["email"],
    );

    Map<String, dynamic> toJson() => {
        "username": username,
        "email": email,
    };
}
