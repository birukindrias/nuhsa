import 'package:fla/api/api.dart';
import 'package:fla/auth/register.dart';
import 'package:fla/user/home.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() => runApp(const login());

class login extends StatelessWidget {
  _saveList(key, item) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setInt(key, item);
    return prefs.getInt(key);
  }

// set value
  const login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:
          AppBar(title: const Text('Nuhs'), backgroundColor: Colors.green),
      body: const MyStatefulWidget(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  var error = '';
  ppr() {
    print('working');
  }

  void saveList(key, item) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    // prefs.setStringList("key", lis t);
    await prefs.setInt(key, item);
    print(prefs.getInt(key));
    // return await prefs.getInt(key);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              padding: const EdgeInsets.all(10),
              child: const Text(
                'cartel',
                style: TextStyle(
                    color: Colors.blue,
                    fontWeight: FontWeight.w500,
                    fontSize: 30),
              ),
            ),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Sign in',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'User Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Password',
                ),
              ),
            ),
            SizedBox(
                width: 50,
                height: 50,
                // color: Colors.red,
                child: Text(error,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 255, 4, 4)))),
            Container(
                color: Colors.red,
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Login'),
                  onPressed: () async {
                    var res = await api().post(
                        'http://localhost:8080/api/v1/login', {
                      'email': nameController.text,
                      'password': passwordController.text
                    });
                    print(res);
                    if (res == true) {
                      Navigator.pop(context);
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const home();
                      }));
                      print(nameController.text);
                      print(passwordController.text);
                    } else {
                      setState(() {
                        error = 'email or password is wrong!';
                      });
                    }
                    saveList('ii', 5);
                  },
                )),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    //  child:const Text('forget eae')
                    child: const Text(
                      'Forgot Password',
                    ),
                  ),

                  // const Text('Does not have account?'),
                  TextButton(
                    child: const Text(
                      'Register',
                      style: TextStyle(fontSize: 20),
                    ),
                    onPressed: () {
                      saveList('ii', 5);
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return const register();
                      }));
                    },
                  )
                ],
              ),
            )
          ],
        ));
  }
}
