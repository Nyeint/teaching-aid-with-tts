import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PuTu extends StatefulWidget {
  @override
  _PuTuState createState() => _PuTuState();
}

class _PuTuState extends State<PuTu> {

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffE1F4FF),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(top: 70)),

              Text(
                  'PuTu',style: TextStyle(fontSize: 80,fontFamily: 'PortLligatSans')
              ),
              Padding(padding: EdgeInsets.only(top: 10)),
              Text(
                  'Teaching Aid',style: TextStyle(fontSize: 18,fontFamily: 'PorPortLligatSanstLligatSans')
              ),
              Padding(padding: EdgeInsets.only(top: 50)),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, '/colors');
                        },
                        child: Container(
                          height: 120,
                          width: 120,
                          padding: EdgeInsets.all(17),
                          margin: EdgeInsets.only(top: 20,bottom: 7),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 2,),
                              color: Colors.white
                          ),
                          child: Image.asset("assets/images/color-flower.png",fit: BoxFit.fill,),
                        ),
                      ),
                      Text('Colors',style: TextStyle(fontSize: 16, fontFamily:  'PortLligatSans')),
                    ],
                  ),
                  Padding(padding: EdgeInsets.only(left: 35)),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: (){
                          Navigator.pushNamed(context, '/alphabets');
                        },
                        child: Container(
                          // width: 120,
                          height: 120,
                          width: 120,
                          padding: EdgeInsets.all(17),
                          margin: EdgeInsets.only(top: 20,bottom: 7),
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(width: 2,),
                              color: Colors.white
                          ),
                          child: Image.asset("assets/images/alphabets.png",fit: BoxFit.fill,),
                        ),
                      ),
                      Text('Alphabets',style: TextStyle(fontSize: 17, fontFamily:  'PortLligatSans')),
                    ],
                  ),
                ],
              ),

              Padding(padding: EdgeInsets.only(top: 15)),

            ],
          ),
        ),
      ),
    );
  }
}
