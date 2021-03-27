import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_app/constant.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Pet App',
      theme: ThemeData(
        textTheme: GoogleFonts.latoTextTheme(  Theme.of(context).textTheme),
        scaffoldBackgroundColor: appBackground
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
 Widget build(BuildContext context){
    return Scaffold(
  body: getBody(),
    );
  }
  
  Widget getBody(){
    return SafeArea(child:
      ListView(
     children: <Widget>[
       Padding(padding: EdgeInsets.all(30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 20,),
            Text("Hi",style: appTitle,),
            SizedBox(height: 10,),
            Text("Mr. Milindu ",style: contentBlack,),
            SizedBox(height: 50,),
            Container(
              height: 150,
              width: double.infinity,
              child: Stack(
                children: <Widget>[
                  Padding(padding: EdgeInsets.only(top: 10),
                  child: Container(
                    height: 110,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: primary,
                      borderRadius: BorderRadius.circular(15),
                      boxShadow: [BoxShadow(color: primary,blurRadius: 0.5)]
                    ),
                  ),
                  ),
                  Container(
                    child: Container(
                      height: 110,
                      width: 5000,
                      child: Image.asset("assets/images/image1.png"),
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 5),
            Container(
              height: 450,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [BoxShadow(color: primary,blurRadius: 0.5)]

              ),
              child: Card(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    const ListTile(
                      leading: Icon(Icons.album),
                      title: Text('Name'),
                      subtitle: Text('Roki'),
                    ),
                    const ListTile(
                      leading: Icon(Icons.album),
                      title: Text('Age'),
                      subtitle: Text('2 years'),
                    ),
                    const ListTile(
                      leading: Icon(Icons.album),
                      title: Text('Pet Type'),
                      subtitle: Text('Dog'),
                    ),
                    const ListTile(
                      leading: Icon(Icons.album),
                      title: Text('Breeds'),
                      subtitle: Text('German shepherd'),
                    ),
                    const ListTile(
                      leading: Icon(Icons.album),
                      title: Text('Gender'),
                      subtitle: Text('Male'),
                    ),
                  ],
                ),
              ),

            )
          ],
        ),
       )
     ],
    ),);
  }
}



