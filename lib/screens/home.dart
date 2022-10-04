import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';


class HomeScreen extends StatefulWidget{
  @override
  _HomeScreen createState()=> _HomeScreen();
}

class _HomeScreen extends State<HomeScreen>{

  var linkedinUrl=Uri.parse("https://www.linkedin.com/in/ruan-emanuell-649b97247/");
  var githubUrl=Uri.parse("https://github.com/RuanEmanuell");
  var twitterUrl=Uri.parse("https://twitter.com/EmanuellRuan");


  @override
  Widget build(BuildContext context){
    var screenHeight=MediaQuery.of(context).size.height;
    var screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar:AppBar(
        elevation:0,
        backgroundColor:Colors.white,
        actions:[
          IconButton(
            icon:Image.asset("assets/images/linkedin.png"),
            onPressed:(){
              launchUrl(linkedinUrl);
            }
          ),
          IconButton(
            icon:Image.asset("assets/images/github.png"),
            onPressed:(){
              launchUrl(githubUrl);
            } 
          ),
          IconButton(
            icon:Image.asset("assets/images/twitter.jpg"),
            onPressed:(){
              launchUrl(twitterUrl);
            }
          )
        ]
      ),
      body:Container(
        height:screenHeight,
        width:screenWidth,
        decoration:BoxDecoration(
          color:Colors.black
        ),
        child:ListView(
          children: [
            Center(
            child: Container(
              margin:EdgeInsets.only(top: 20),
              child: Column(
                children:[
                  Text("Olá, eu sou", style:GoogleFonts.robotoMono(
                   textStyle:TextStyle(
                    color:Colors.white,
                    fontSize:20
                  ))
                  ),
                  Text("Ruan Emanuell!", style:GoogleFonts.robotoMono(
                   textStyle:TextStyle(
                    color:Colors.white,
                    fontSize:40
                  ))
                  ),
                  Container(
                    margin:EdgeInsets.only(top: 10),
                    width:screenWidth/1.5,
                    height:screenHeight < 700 ? screenHeight/1.5 : screenHeight/2.5,
                    child:Image.asset("assets/images/ruan.png")
                  ),
                   Text("Desenvolvedor Mobile", style:GoogleFonts.robotoMono(
                   textStyle:TextStyle(
                    color:Color.fromARGB(255, 0, 189, 63),
                    fontSize:35
                  ))
                  ),
                  Container(
                    margin:EdgeInsets.only(top: 30, bottom:30),
                    child: Text("Algumas tecnologias que eu conheço:", style:GoogleFonts.robotoMono(
                     textStyle:TextStyle(
                      color:Colors.white,
                      fontSize:20
                    ))
                    ),
                  ),
                  Container(
                    height:400,
                    color:Colors.white
                  )
                ]
              ),
            ),
          )
          ]
        )
      )
    );
  }
}