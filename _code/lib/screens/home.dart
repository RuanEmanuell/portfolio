import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'dart:async';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreen createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  //Definindo as variáveis das URL's 
  var linkedinUrl = Uri.parse("https://www.linkedin.com/in/ruan-emanuell-649b97247/");
  var githubUrl = Uri.parse("https://github.com/RuanEmanuell");
  var twitterUrl = Uri.parse("https://twitter.com/EmanuellRuan");

  //Array com as informações
  List projeto = [
    ["MobileDex", "Uma Pokédex feita em Flutter usando a Pokémon Go API."],
    ["LotoFacil", "Um checador de resultados da Lotofácil."],
    ["NarutoDatabase", "Uma mini database de Naruto feita em Flutter."],
    ["WheateRT", "Um app feito para visualizar o clima em tempo real."],
    ["LoadingZ", "Minigames de Dragon Ball usando FlutterFlame."],
  ];

  //Variáveis de animações
  bool loaded=false;
  bool clicked = false;
  bool small = false;
  bool timeup = true;

  //Atalho pras cores principais
  var black = const Color.fromARGB(255, 10, 10, 10);
  var white = const Color.fromARGB(255, 241, 241, 241);
  var green = const Color.fromARGB(255, 0, 143, 36);

  //Controlador do Carousel
  CarouselController buttonCarouselController = CarouselController();

  @override
  void initState() {
    super.initState();
    //Tela de loading, acaba em 3 segundos
    Future.delayed(const Duration(seconds: 3), (){
      setState(() {
        loaded=true;
      });
    });
    //Diminuir a foto 1 segundo depois
    Future.delayed(const Duration(seconds: 4), () {
      setState(() {
        small = true;
      });
    });
    //Mostrar o texto de dica depois de 2 segundos
    Future.delayed(const Duration(seconds: 6), () {
      setState(() {
        timeup = false;
      });
    });
    //Remover ele 4 segundos depois
    Future.delayed(const Duration(seconds: 10), () {
      setState(() {
        timeup = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {

    //Pegando a altura e largura da tela
    var screenHeight = MediaQuery.of(context).size.height;
    var screenWidth = MediaQuery.of(context).size.width;

    //Estilos de exto
    TextStyle smallTextStyle(){
     return GoogleFonts.robotoMono(
              textStyle: TextStyle(
                color: white, 
                fontSize: 14 + screenWidth / 150)
             );
    }

    TextStyle bigTextStyle(){
     return GoogleFonts.robotoMono(
              textStyle: TextStyle(
                color: white, 
                fontSize: 27 + screenWidth / 125)
             );
    }

    TextStyle smallerTextStyleBlack(){
     return GoogleFonts.robotoMono(
              textStyle: TextStyle(
                color: black, 
                fontSize: 9 + screenWidth / 130)
             );
    }

     TextStyle bigTextStyleBlack(){
     return GoogleFonts.robotoMono(
              textStyle: TextStyle(
                color: black, 
                fontSize: 21 + screenWidth / 125)
             );
    }

    TextStyle biggerTextStyleGreen(){
     return GoogleFonts.robotoMono(
              textStyle: TextStyle(
                color: green, 
                fontSize: 21 + screenWidth / 125)
             );
    }

    return Scaffold(
       body: loaded ? Container(
       color: black,
       child: ListView(children: [
        //Header da página
        Container(
          height: 50,
          width: screenWidth,
          color: white,
          child: Row(
            children: [
              IconButton(
                  icon: Image.asset("assets/images/linkedin.png"),
                  onPressed: () {
                    launchUrl(linkedinUrl);
                  }),
              IconButton(
                  icon: Image.asset("assets/images/github.png"),
                  onPressed: () {
                    launchUrl(githubUrl);
                  }),
              IconButton(
                  icon: Image.asset("assets/images/twitterl.png"),
                  onPressed: () {
                    launchUrl(twitterUrl);
                  }),
            ],
          ),
        ),
        //Primeira sessão
        Stack(
          children: [
          Center(
            child: Container(
              color: black,
              margin: const EdgeInsets.only(top: 30),
              child: Column(children: [
                Text("Olá, eu sou",
                    style: smallTextStyle()
                ),
                Text("Ruan Emanuell!",
                    style: bigTextStyle()
                ),
                AnimatedContainer(
                    width: small ? screenWidth / 1.75 : screenWidth / 1.25,
                    height: small ? screenHeight / 2.5 : screenHeight,
                    duration: const Duration(seconds: 2),
                    curve: Curves.easeInOut,
                    child: Image.asset("assets/images/ruan.png")
                ),
                Text("Desenvolvedor Mobile Jr",
                    style: biggerTextStyleGreen()
                ),
                Container(
                  margin: const EdgeInsets.only(top: 10),
                  child: Text("Algumas tecnologias que eu conheço:",
                      style: smallTextStyle()),
                ),
                //Container que mostra as tecnologias
                Container(
                    margin: const EdgeInsets.all(30),
                    width: screenWidth / 1.5,
                    height: screenHeight / 6.5,
                    decoration:
                        BoxDecoration(color: white, borderRadius: BorderRadius.circular(30)),
                    child: Container(
                      margin: const EdgeInsets.all(20),
                      child: Row(children: [
                        Expanded(child: Image.asset("assets/images/flutter.png")),
                        Expanded(child: Image.asset("assets/images/dart.png")),
                        Expanded(child: Image.asset("assets/images/firebase.png")),
                        Expanded(child: Image.asset("assets/images/js.png")),
                        Expanded(child: Image.asset("assets/images/git.png")),
                      ]),
                    )),
                //Inicio da segunda sessão    
                Container(
                    color: white,
                    width: screenWidth,
                    child: Column(children: [
                      Container(
                          margin: const EdgeInsets.only(top: 40, bottom: 20),
                          child: Text("Alguns projetos meus:",
                              style: bigTextStyleBlack())
                      ),
                      //Carousel de imagens
                      CarouselSlider(
                          carouselController: buttonCarouselController,
                          options: CarouselOptions(
                              height: screenHeight / 1.2,
                              autoPlay: clicked ? false : true,
                              viewportFraction: 1.1),
                          items: [0, 1, 2, 3, 4].map((e) {
                            return Builder(
                              builder: (BuildContext context) {
                                return Column(children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(backgroundColor: black),
                                          onPressed: () {
                                            buttonCarouselController.previousPage(
                                                curve: Curves.easeInOutSine,
                                                duration: const Duration(seconds: 1));
                                            setState(() {
                                              clicked = true;
                                            });
                                          },
                                          child: const Icon(Icons.arrow_back, size: 30)),
                                      Container(
                                          margin: const EdgeInsets.only(right: 5, left: 5),
                                          width: screenWidth > 420 ? 280 : 200,
                                          height: screenHeight / 1.9,
                                          decoration: BoxDecoration(
                                              border: Border.all(width: 5, color: black),
                                              image: DecorationImage(
                                                  image:
                                                      AssetImage("assets/images/projeto$e.png")))),
                                      ElevatedButton(
                                          style: ElevatedButton.styleFrom(backgroundColor: black),
                                          onPressed: () {
                                            buttonCarouselController.nextPage(
                                                curve: Curves.easeInOutSine,
                                                duration: const Duration(seconds: 1));
                                            setState(() {
                                              clicked = true;
                                            });
                                          },
                                          child: const Icon(Icons.arrow_forward, size: 30))
                                    ],
                                  ),
                                  Container(
                                      margin: const EdgeInsets.only(top: 20, bottom: 10),
                                      child: Text(projeto[e][0],
                                          style: bigTextStyleBlack())
                                  ),
                                  Container(
                                    margin:const EdgeInsets.only(
                                      left:20,
                                      right:20,
                                      bottom:20
                                    ),
                                    child: Text(projeto[e][1],
                                        style: smallerTextStyleBlack()
                                    ),
                                  ),
                                  SizedBox(
                                    width: 250,
                                    height: 80,
                                    child: ElevatedButton(
                                        style: ElevatedButton.styleFrom(
                                            backgroundColor: black,
                                            shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(20))),
                                        onPressed: () {
                                          launchUrl(Uri.parse(
                                              "https://github.com/RuanEmanuell/${projeto[e][0]}"));
                                        },
                                        child: Row(
                                          children: [
                                            Container(
                                                margin: const EdgeInsets.only(right: 10),
                                                child: const Text("Veja mais no Github",
                                                    style: TextStyle(fontSize: 20))),
                                            Container(
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(30),
                                                    border: Border.all(color: white, width: 2)),
                                                child: Image.asset("assets/images/github.png",
                                                    width: 25))
                                          ],
                                        )),
                                  )
                                ]);
                              },
                            );
                          }).toList())
                    ]))
              ]),
            ),
          ),
          //Texto de dica
          AnimatedOpacity(
              opacity: timeup ? 0 : 1,
              duration: const Duration(seconds: 1),
              child: Container(
                  width: 190,
                  padding: const EdgeInsets.all(10),
                  margin: const EdgeInsets.all(10),
                  color: const Color.fromARGB(255, 241, 241, 241),
                  child: Column(
                    children: [
                      Container(
                          margin: const EdgeInsets.only(right: 190),
                          child: const Icon(Icons.arrow_upward)),
                      const Text("Você pode entrar em contato comigo por aqui!"),
                    ],
                  ))
          )
        ])
      ]),
    ):Container(
      color:black,
      child: Center(
        child:SizedBox(
          height:screenHeight/6,
          width:screenWidth/7,
          child: CircularProgressIndicator(
            color:white,
          )
        ),
       ),
    ),
   );
  }
}
