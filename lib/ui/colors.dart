import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../controller.dart';

class ColorsPage extends StatefulWidget {

  @override
  _ColorsPageState createState() => _ColorsPageState();
}

class _ColorsPageState extends State<ColorsPage> {
  late FlutterTts flutterTts;
  final controller = Get.put(Controller());
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

    await flutterTts.setVolume(0.8);
    await flutterTts.setSpeechRate(0.3);
    await flutterTts.setPitch(0.9);
    await flutterTts.speak(alphabet);
  }

  widgetColor(String alphabet, Color color, int index ){
    return GestureDetector(
      onTap: (){
        tappedIndex.value=index;
        _speak(alphabet);
      },
      child:
      Container(
        height: index==tappedIndex.value?100:80,
        width: index==tappedIndex.value?100:80,
        padding: EdgeInsets.all(17),
        margin: EdgeInsets.only(top: 20,bottom: 7),
        decoration: BoxDecoration(
            shape: BoxShape.circle,
            border: Border.all(width:  index==tappedIndex.value?1:0,),
            color: color
        ),
      ),
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
                      Text('Colors',style: TextStyle(fontSize: 40, fontFamily:  'PortLligatSans')),
                      Padding(padding: EdgeInsets.only(top: 20)),


                      Container(
                        padding: EdgeInsets.only(left: 35, right: 35,top: 25),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                widgetColor("red", Color(0xffF53333),1),
                                widgetColor("yellow", Colors.yellow,2),
                                widgetColor("blue", Colors.blue,3),
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(top: 17)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                widgetColor("green", Colors.green,4),
                                widgetColor("pink", Color(0xffFB62A2),5),
                                widgetColor("black", Colors.black,6),
                              ],
                            ),
                            Padding(padding: EdgeInsets.only(top: 17)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                widgetColor("brown", Colors.brown,7),
                                widgetColor("white", Colors.white,8),
                                widgetColor("purple", Colors.deepPurple,9),
                              ],
                            ),

                            Padding(padding: EdgeInsets.only(top: 17)),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                widgetColor("orange", Colors.orange,10),
                                widgetColor("grey", Colors.grey,11),
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
