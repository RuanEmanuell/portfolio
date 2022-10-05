import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';


class HomeScreen extends StatefulWidget{
  @override
  _HomeScreen createState()=> _HomeScreen();
}

class _HomeScreen extends State<HomeScreen>{

  var linkedinUrl=Uri.parse("https://www.linkedin.com/in/ruan-emanuell-649b97247/");
  var githubUrl=Uri.parse("https://github.com/RuanEmanuell");
  var twitterUrl=Uri.parse("https://twitter.com/EmanuellRuan");

  var projeto={
    ["MobileDex", "Uma Pokédex feita em Flutter usando a Pokemon Go API"],
    ["LotoFacil", "Um checador de resultados da Lotofácil usando a API das Loterias"], 
    ["NarutoDatabase", "Uma mini database de Naruto feita em Flutter"],
    ["WheaterRT", "Um aplicativo feito pra visualizar o clima em tempo real"],
    ["LoadingZ", "Uma recriação de minigames de Dragon Ball usando o Flutter e Flame"],
  }.toList();

  CarouselController buttonCarouselController = CarouselController();



  @override
  Widget build(BuildContext context){
    var screenHeight=MediaQuery.of(context).size.height;
    var screenWidth=MediaQuery.of(context).size.width;
    return Scaffold(
      body:Container(
        height:screenHeight,
        width:screenWidth,
        decoration:BoxDecoration(
          color:Colors.black
        ),
        child:ListView(
          children: [
            Container(
              height:50,
              width:screenWidth,
              color:Colors.white,
              child: Row(
                children: [
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
          ),
              ],
              ),
            ),
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
                    margin:EdgeInsets.only(top: 10, bottom:50),
                    width:screenWidth/1.5,
                    height:screenHeight/2.5,
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
                    margin:EdgeInsets.all(50),
                    width:screenWidth/1.5,
                    height:screenHeight/6.5,
                    decoration:BoxDecoration(
                      color:Colors.white,
                      borderRadius:BorderRadius.circular(30)
                    ),
                    child:Container(
                      margin:EdgeInsets.all(40),
                      child: Row(
                        children:[
                          Expanded(child: Image.asset("assets/images/flutter.png")),
                          Expanded(child: Image.asset("assets/images/dart.png")),
                          Expanded(child: Image.asset("assets/images/firebase.png")),
                          Expanded(child: Image.asset("assets/images/js.png")),
                          Expanded(child: Image.asset("assets/images/git.png")),                        
                        ]
                      ),
                    )
                  ),
                  Container(
                    color:Colors.white,
                    width:screenWidth,
                    height:screenHeight,
                    child:Column(
                      children:[
                        Container(
                          margin:EdgeInsets.only(top: 20, bottom:20),
                          child:Text("Alguns projetos meus:", style:GoogleFonts.robotoMono(
                            textStyle:TextStyle(
                              fontSize:30)
                          ))
                          ),
                  CarouselSlider(
                    carouselController: buttonCarouselController,
                    options:CarouselOptions(height:screenHeight/2),
                    items:[0, 1, 2, 3, 4].map((e) {
                        return Builder(
                          builder:(BuildContext context) {
                            return Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                  ElevatedButton(
                                  onPressed:(){
                                    buttonCarouselController.previousPage();
                                  },
                                  child:Icon(Icons.arrow_back) 
                                ),
                                    Container(
                                      width:screenWidth/7,
                                      margin:EdgeInsets.all(10),
                                      child:Image.asset("assets/images/projeto${e}.png")
                                    ),
                                  ElevatedButton(
                                  onPressed:(){
                                    buttonCarouselController.nextPage();
                                  },
                                  child:Icon(Icons.arrow_forward) 
                                )
                                  ],
                                ),
                                Text(projeto[e][0]),
                                Text(projeto[e][1])
                              ],
                            );
                          },
                        );
                    }).toList()
                  )

                      ]
                    )
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