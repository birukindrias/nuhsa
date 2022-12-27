import 'package:fla/api/api.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  @override
  Splash createState() => Splash();
}

class Splash extends State<SplashScreen>  {

  @override
  void initState() {
    super.initState();

  }
  @override
  Widget build(BuildContext context) {
      

    var assetsImage = new AssetImage(
        'image/ia.jpg'); //<- Creates an object that fetches an image.
    var image = new Image(
        image: assetsImage,
        height:600
        , width:1000); //<- Creates a widget that displays an image.

    return Container(
        /* appBar: AppBar(
          title: Text("MyApp"),
          backgroundColor:
              Colors.blue, //<- background color to combine with the picture :-)
        ),*/
        child: Container(
          
          decoration: new BoxDecoration(color: Color.fromARGB(255, 0, 0, 0)),
          child: 
          // api().dispmain()

          new Center(
            child: image,
          ),
        ), //<- place where the image appears
      );
  }
}