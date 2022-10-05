import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:async';


class HomeScreen extends StatefulWidget{
  @override
  _HomeScreen createState()=> _HomeScreen();
}

class _HomeScreen extends State<HomeScreen>{

  var linkedinUrl=Uri.parse("https://www.linkedin.com/in/ruan-emanuell-649b97247/");
  var githubUrl=Uri.parse("https://github.com/RuanEmanuell");
  var twitterUrl=Uri.parse("https://twitter.com/EmanuellRuan");

  var projeto={
    ["MobileDex", "Uma Pokédex feita em Flutter usando a Pokémon Go API."],
    ["LotoFacil", "Um checador de resultados da Lotofácil usando a API das Loterias."], 
    ["NarutoDatabase", "Uma mini database de Naruto feita em Flutter."],
    ["WheateRT", "Um aplicativo feito pra visualizar o clima em tempo real."],
    ["LoadingZ", "Uma recriação de minigames de Dragon Ball usando o Flutter e Flame."],
  }.toList();

  bool clicked=false;
  bool small=false;
  bool timeup=true;


  CarouselController buttonCarouselController = CarouselController();

  @override
  void initState(){
    super.initState();
    Future.delayed(Duration(seconds: 1),(){
      setState((){
        small=true;
      });
    });
    Future.delayed(Duration(seconds: 3), (){
      setState((){
        timeup=false;
      });
    });
    Future.delayed(Duration(seconds: 8),(){
      setState((){
        timeup=true;
      });
    });
  }


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
            Stack(
              children:[
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
                    AnimatedContainer(
                      width:small?screenWidth/1.75:screenWidth/1.25,
                      height:small?screenHeight/2.5:screenHeight,
                      duration:Duration(seconds: 2),
                      curve:Curves.easeInOut,
                      child: Image.asset("assets/images/ruan.png")),
                     Text("Desenvolvedor Mobile", style:GoogleFonts.robotoMono(
                     textStyle:TextStyle(
                      color:Color.fromARGB(255, 0, 189, 63),
                      fontSize:35
                    ))
                    ),
                    Container(
                      margin:EdgeInsets.only(top: 10, bottom:10),
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
                      options:CarouselOptions(
                      height:screenHeight-80, 
                      autoPlay:clicked ? false : true,
                      viewportFraction: 1.1),
                      items:[0, 1, 2, 3, 4].map((e) {
                          return Builder(
                            builder:(BuildContext context) {
                              return Column(
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                    Container(
                                      margin:EdgeInsets.only(left:25),
                                      child: ElevatedButton(
                                      style:ElevatedButton.styleFrom(
                                        backgroundColor:Colors.black
                                      ),
                                      onPressed:(){
                                        buttonCarouselController.previousPage(
                                          curve:Curves.easeInOutSine,
                                          duration:Duration(milliseconds: 750)         
                                        );
                                        setState((){
                                          clicked=true;
                                        });
                                      },
                                      child:Icon(Icons.arrow_back, size:30) 
                                  ),
                                    ),
                                      Container(
                                        margin:EdgeInsets.all(5),
                                        decoration:BoxDecoration(
                                          border:Border.all(
                                            width:5,
                                            color:Colors.black
                                          )
                                        ),
                                        child:Image.asset("assets/images/projeto${e}.png")
                                      ),
                                    Container(
                                      margin:EdgeInsets.only(right:25),
                                      child: ElevatedButton(
                                      style:ElevatedButton.styleFrom(
                                        backgroundColor:Colors.black
                                      ),                                    
                                      onPressed:(){
                                        buttonCarouselController.nextPage(
                                          curve:Curves.easeInOutSine,
                                          duration:Duration(milliseconds: 750)                                        
                                        );
                                        setState((){
                                          clicked=true;
                                        });                                      
                                      },
                                      child:Icon(Icons.arrow_forward, size:30) 
                                  ),
                                    )
                                    ],
                                  ),
                                  Container(
                                    margin:EdgeInsets.only(top: 10, bottom:10),
                                    child: Text(projeto[e][0], style:TextStyle(
                                      fontSize:30
                                    ))),
                                  Text(projeto[e][1]),
                                  Container(
                                    width:250,
                                    height:100,
                                    margin:EdgeInsets.only(top: 30),
                                    child: ElevatedButton(
                                      style:ElevatedButton.styleFrom(
                                        backgroundColor:Colors.black,
                                        shape:RoundedRectangleBorder(
                                          borderRadius:BorderRadius.circular(20)
                                        )
                                      ),
                                      onPressed:(){
                                        launchUrl(Uri.parse("https://github.com/RuanEmanuell/${projeto[e][0]}"));
                                      },
                                      child:Row(
                                        children: [
                                          Container(
                                            margin:EdgeInsets.only(right: 10),
                                           child: Text("Veja mais no Github", style:TextStyle(
                                            fontSize:20
                                           ))),
                                          Container(
                                            decoration:BoxDecoration(
                                              borderRadius:BorderRadius.circular(20),
                                              border:Border.all(
                                                color:Colors.white,
                                                width:2
                                              )
                                            ),
                                            child: Image.asset("assets/images/github.png", width:25))
                                        ],
                                      )
                                    ),
                                  )
                                ]
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
               ),
               AnimatedOpacity(
                 opacity: timeup ? 0:1,
                 duration:Duration(seconds: 1),
                 child: Container(
                  width:190,
                  padding:EdgeInsets.all(10),
                  margin:EdgeInsets.all(10),
                  color:Colors.white,
                  child:Column(
                    children: [
                      Container(
                        margin:EdgeInsets.only(right: 190),
                        child: Icon(Icons.arrow_upward)),
                      Text("Você pode entrar em contato comigo por aqui!"),
                    ],
                  )
                 ),
               )
              ]
            )
          ]
        )
      )
    );
  }
}