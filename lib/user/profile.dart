import 'package:fla/api/api.dart';
import 'package:fla/user/home.dart';
import 'package:flutter/material.dart';

void main() => runApp(const profile());

class profile extends StatelessWidget {
  const profile({Key? key}) : super(key: key);
  op() {
    print(api().setinpref('data'));
  }

  static const String _title = 'Sample App';

  @override
  Widget build(BuildContext context) {
    return
    MaterialApp(
      theme: ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blueGrey
  ),

      title: 'home',

      home: Scaffold(

        appBar: AppBar(title: const Text('Profile')),
        body: const root(),
      ),
    ); 
    
  }
}

class root extends StatefulWidget {
  const root({super.key});
  // print("api().setinpref('data')");

  @override
  State<root> createState() => _rootState();
}

// ignore: camel_case_types
class _rootState extends State<root> {
  int currentPage = 0;
  int num = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: Container(
              child: Column(
            children: [
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100.0),
                      child: const Image(
                          image: AssetImage('image/ii.jpg'),
                          height: 150,
                          width: 150),
                    ),
                  ),
                  Text('mr '),
                  Text('merfe'),
                ],
              ),
              Column(
                children: [
                  ElevatedButton(onPressed: () {}, child: Text('data')),
                  Text('profile'),
                  Text('profile'),
                ],
              ),
            ],
          )),
        ),
        Container(
            child: Container(
          child: NavigationBar(
            destinations: const [
              NavigationDestination(icon: Icon(Icons.home), label: 'home'),
              NavigationDestination(
                  // onPressed: () {},
                  icon: Icon(Icons.person),
                  label: 'profile')
            ],
            onDestinationSelected: (int index) {
              setState(() {
                currentPage = index;
                print(currentPage);
                if (currentPage == 1) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return profile();
                  }));
                }
                if (currentPage == 0) {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return home();
                  }));
                }
              });
            },
            selectedIndex: currentPage,
          ),
        ))
        //    child: bottomNavigationBar: NavigationBar(
        //   destinations: const [
        //     NavigationDestination(icon: Icon(Icons.home), label: 'home'),
        //     NavigationDestination(icon: Icon(Icons.person), label: 'profile')
        //   ],
        //   onDestinationSelected: (int index) {
        //     setState(() {
        //       currentPage = index;
        //     });
        //   },
        //   selectedIndex: currentPage,
        // ),
      ],
      // body:const home(),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // debugPrint (num++);
      //     num++;
      //     print(num);
      //   },
      //   child: Icon(Icons.add),
      // ),
    );
  }
}
// import 'package:flutter/material.dart';
   
// void main() {
//   runApp(profile());
// }

// class profile extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Profile Challenge 01',
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Colors.red,
//           title: Center(
//             child: const Text('Profile Challenge 01'),
//           ),
//         ),
//         body: ListView(
//           children: <Widget>[
//             Container(
//               height: 250,
//               decoration: BoxDecoration(
//                 gradient: LinearGradient(
//                   colors: [Colors.red, Colors.deepOrange.shade300],
//                   begin: Alignment.centerLeft,
//                   end: Alignment.centerRight,
//                   stops: [0.5, 0.9],
//                 ),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: <Widget>[
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceAround,
//                     children: <Widget>[
//                       CircleAvatar(
//                         backgroundColor: Colors.red.shade300,
//                         minRadius: 35.0,
//                         child: Icon(
//                           Icons.call,
//                           size: 30.0,
//                         ),
//                       ),
//                       CircleAvatar(
//                         backgroundColor: Colors.white70,
//                         minRadius: 60.0,
//                         child: CircleAvatar(
//                           radius: 50.0,
//                           backgroundImage:
//                               NetworkImage('https://avatars0.githubusercontent.com/u/28812093?s=460&u=06471c90e03cfd8ce2855d217d157c93060da490&v=4'),
//                         ),
//                       ),
//                       CircleAvatar(
//                         backgroundColor: Colors.red.shade300,
//                         minRadius: 35.0,
//                         child: Icon(
//                           Icons.message,
//                           size: 30.0,
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: 10,
//                   ),
//                   Text(
//                     'Leonardo Palmeiro',
//                     style: TextStyle(
//                       fontSize: 35,
//                       fontWeight: FontWeight.bold,
//                       color: Colors.white,
//                     ),
//                   ),
//                   Text(
//                     'Flutter Developer',
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 25,
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               child: Row(
//                 children: <Widget>[
//                   Expanded(
//                     child: Container(
//                       color: Colors.deepOrange.shade300,
//                       child: ListTile(
//                         title: Text(
//                           '5000',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 30,
//                             color: Colors.white,
//                           ),
//                         ),
//                         subtitle: Text(
//                           'Followers',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontSize: 20,
//                             color: Colors.white70,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                   Expanded(
//                     child: Container(
//                       color: Colors.red,
//                       child: ListTile(
//                         title: Text(
//                           '5000',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontWeight: FontWeight.bold,
//                             fontSize: 30,
//                             color: Colors.white,
//                           ),
//                         ),
//                         subtitle: Text(
//                           'Following',
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontSize: 20,
//                             color: Colors.white70,
//                           ),
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             ),
//             Container(
//               child: Column(
//                 children: <Widget>[
//                   ListTile(
//                     title: Text(
//                       'Email',
//                       style: TextStyle(
//                         color: Colors.deepOrange,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     subtitle: Text(
//                       'palmeiro.leonardo@gmail.com',
//                       style: TextStyle(
//                         fontSize: 18,
//                       ),
//                     ),
//                   ),
//                   Divider(),
//                   ListTile(
//                     title: Text(
//                       'GitHub',
//                       style: TextStyle(
//                         color: Colors.deepOrange,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     subtitle: Text(
//                       'https://github.com/leopalmeiro',
//                       style: TextStyle(
//                         fontSize: 18,
//                       ),
//                     ),
//                   ),
//                   Divider(),
//                   ListTile(
//                     title: Text(
//                       'Linkedin',
//                       style: TextStyle(
//                         color: Colors.deepOrange,
//                         fontSize: 20,
//                         fontWeight: FontWeight.bold,
//                       ),
//                     ),
//                     subtitle: Text(
//                       'www.linkedin.com/in/leonardo-palmeiro-834a1755',
//                       style: TextStyle(
//                         fontSize: 18,
//                       ),
//                     ),
//                   ),
//                 ],
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }