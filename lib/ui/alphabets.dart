import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';

class Alphabets extends StatefulWidget {
  @override
  _AlphabetsState createState() => _AlphabetsState();
}

class _AlphabetsState extends State<Alphabets> {
  late FlutterTts flutterTts;
  late AssetsAudioPlayer _assetsAudioPlayer;
  var tappedIndex=0.obs;

  @override
  initState() {
    super.initState();
    _assetsAudioPlayer = AssetsAudioPlayer.newPlayer();
    initTts();
  }

  @override
  void dispose() {
    _assetsAudioPlayer.dispose();
    super.dispose();
  }

  Future _setAwaitOptions() async {
    await flutterTts.awaitSpeakCompletion(true);
  }

  Future _getDefaultEngine() async {
    var engine = await flutterTts.getDefaultEngine;
    if (engine != null) {
      print(engine);
    }
  }

  Future _getDefaultVoice() async {
    var voice = await flutterTts.getDefaultVoice;
    if (voice != null) {
      print(voice);
    }
  }

  initTts() {
    flutterTts = FlutterTts();

    _setAwaitOptions();
    _getDefaultEngine();
    _getDefaultVoice();

    flutterTts.setInitHandler(() {
      setState(() {
        print("TTS Initialized");
      });
    });
  }

  Future _speak(String alphabet) async {
    await flutterTts.setVolume(0.9);
    await flutterTts.setSpeechRate(0.4);
    await flutterTts.setPitch(0.3);
    await flutterTts.speak(alphabet);
  }

  widgetAlphabet(String alphabet, Color color,int index ){
    return GestureDetector(
      onTap: (){
        tappedIndex.value=index;
        _speak(alphabet);
      },
      child:
      index==tappedIndex.value?
      Container(
          height: 60,
          width: 60,
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(width: 1),
              color:Color(0xffE1F4FF),
          ),
          child: Center(child: Text(alphabet,style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold,color: color))))
      :
      Container(
        color: Color(0xffE1F4FF),
          child: Text(alphabet,style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold,color: color))),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          backgroundColor: Color(0xffE1F4FF),
          body: Obx(()=>
              SingleChildScrollView(
                  child:
                  Column(
                    children: [
                      Align(
                        alignment: Alignment.topLeft,
                        child: GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 100,
                            height: 45,
                            margin: EdgeInsets.only(top: 30,bottom: 10),
                            decoration: BoxDecoration(
                                color: Color(0xffFFD239),
                                // border: Border.all(width: 4, color: Colors.black)
                                borderRadius: BorderRadius.only(bottomRight: Radius.circular(15), topRight: Radius.circular(15))
                            ),
                            child: Center(child: Text("Main Page",style: TextStyle(fontSize: 18, fontFamily:  'PortLligatSans')),),
                          ),
                        ),
                      ),
                      Text('Alphabets',style: TextStyle(fontSize: 40, fontFamily:  'PortLligatSans')),

                      Container(
                        padding: EdgeInsets.only(left: 35, right: 35,top: 50),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                widgetAlphabet("A", Color(0xffB14545),1),
                                widgetAlphabet("B", Color(0xffCCA210),2),
                                widgetAlphabet("C", Color(0xff45B163),3),
                                widgetAlphabet("D", Color(0xff2D6BC9),4),
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(top: 20)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                widgetAlphabet("E", Color(0xffB123D4),5),
                                widgetAlphabet("F", Color(0xff389A16),6),
                                widgetAlphabet("G", Color(0xff0E83B6),7),
                                widgetAlphabet("H", Color(0xffB14545),8),
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(top: 20)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                widgetAlphabet("I", Color(0xffCCA210),9),
                                widgetAlphabet("J", Color(0xff9D221A),10),
                                widgetAlphabet("K", Color(0xffC116A6),11),
                                widgetAlphabet("L", Color(0xff12B923),12),
                              ],
                            ),

                            Padding(padding: EdgeInsets.only(top: 20)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                widgetAlphabet("M", Color(0xff3C15AB),13),
                                widgetAlphabet("N", Color(0xff7E852E),14),
                                widgetAlphabet("O", Color(0xff1BA854),15),
                                widgetAlphabet("P", Color(0xff8B1286),16),
                              ],
                            ),

                            Padding(padding: EdgeInsets.only(top: 20)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                widgetAlphabet("Q", Color(0xffB14545),17),
                                widgetAlphabet("R", Color(0xff184B0B),18),
                                widgetAlphabet("S", Color(0xff585050),19),
                                widgetAlphabet("T", Color(0xffED8408),20),
                              ],
                            ),

                            Padding(padding: EdgeInsets.only(top: 20)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                widgetAlphabet("U", Color(0xff137F97),21),
                                widgetAlphabet("V", Color(0xffEBC43D),22),
                                widgetAlphabet("W", Color(0xff4549B1),23),
                              ],
                            ),

                            Padding(padding: EdgeInsets.only(top: 20)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                widgetAlphabet("X", Color(0xffB14545),24),
                                widgetAlphabet("Y", Color(0xff1C983F),25),
                                widgetAlphabet("Z", Color(0xffC525ED),26),
                              ],
                            ),

                            Padding(padding: EdgeInsets.only(top: 30)),
                          ],
                        ),
                      ),
                    ],
                  )
              ),)
        ));
  }
}
