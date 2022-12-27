import 'package:fla/api/api.dart';
import 'package:fla/user/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(const register());

class register extends StatelessWidget {
  const register({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text('cartela')),
        body: const MyStatefulWidget(),
      ),
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
  TextEditingController emailController = TextEditingController();
  TextEditingController referialController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  @override
  var error = '';

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
                'Nuhs',
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
                  ' ',
                  style: TextStyle(fontSize: 20),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Full Name',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: phoneController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Phone Number',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'E-mail',
                ),
              ),
            ),
                 Container(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: referialController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Referral Number',
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
         
            Container(
                padding: const EdgeInsets.all(20),
                width: 50,
                height: 80,
                // color: Colors.red,
                child: Text(error,
                    style: const TextStyle(
                        color: Color.fromARGB(255, 255, 4, 4)))),
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Register'),
                  onPressed: () async {
                    if (nameController.text.length > 1) {
                      var res = await api()
                          .post('http://biruksoftware.com/nuhs/', {
                        'username': nameController.text,
                        'email': emailController.text,
                        'password': passwordController.text,
                        'phone': phoneController.text,
                        'reffrial': referialController.text,
                        'key':'fla'

                      });
                        print(res);

                      if (res == true) {
                        print(res);
                        const Text('please input');
                                    setState(() {
                          error = 'successfyll';
                        });
                      } else {
                        setState(() {
                          error = 'input';
                        });
                        print('vaacccccccccccaao');
                        const Text('please input');
                      }
                    } else {
                      setState(() {
                        error = 'please input';
                      });
                    }
                  },
                )),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.center,
            //   children: <Widget>[
            //     const Text(' '),
            //     // TextButton(
            //     //   child: const Text(
            //     //     'Sign in',
            //     //     style: TextStyle(fontSize: 20),
            //     //   ),
            //     //   onPressed: () {
            //     //     //signup
            //     //     Navigator.of(context).push(
            //     //         MaterialPageRoute(builder: (BuildContext context) {
            //     //       return cartela();
            //     //     }));
            //     //   },
            //     // )
            //   ],
            // ),
          ],
        ));
  }
}
