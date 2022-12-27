// import 'dart:html//';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class api {
  final Client = http.Client();
  Future<dynamic> post(url, payload) async {

    if (payload == null) {
    } else {
      var response = await Client.post(Uri.parse(url), body: payload);
      if (response.statusCode == 200) {
        print(response);
        var user = json.decode(response.body);
        if (user == true) {
          return true;
        } 
      } else {
        return true;
      }
    }
  }

  Future<dynamic> getgames() async {
    var response =
        await Client.get(Uri.parse('http://biruksoftware.com/nuhs/'));
    if (response.statusCode == 200) {
      var user = json.decode(response.body);
     

        return user;
    }
  }

  setinpref(key) async {
    final prefs = await SharedPreferences.getInstance();
    print(prefs.getStringList(key));
    return prefs.getStringList(key);
  }

  static ppr(key) async {
    final prefs = await SharedPreferences.getInstance();
    print('ssssssssss');
  }

  disp(num) {
    return ListView(
      children: List.generate(
          num,
          (index) => Container(
                  child:
                      // Text('df  ${index * 10}')
                      Center(
                child: Container(
                    // color: Colors.red,
                    margin: const EdgeInsets.all(20),
                    width: 250,
                    height: 250,
                    color: Colors.red,
                    child: Center(
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            '  ${index == 0 ? index = 1 * 10 : index * 10 * 2}',
                          )),
                    )),
              ))),
    );
  }

  dispmain() {
    return ListView(
      children: List.generate(
          2,
          (index) => Column(
                children: [
                  Flexible(
                      flex: 1,
                      child: Container(
                          width: 100,
                          height: 100,
                          color: Colors.red,
                          child: const Text('  index')))
                ],
              )
          //  Container(color: Colors.red, child: Row)
          ),
    );
  }
}
