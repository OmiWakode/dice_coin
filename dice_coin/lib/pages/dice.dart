import 'package:flutter/material.dart';
import 'dart:math';
import 'package:shake/shake.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';

class Dice extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _Dice();
  }
}

class _Dice extends State<Dice> {
  var _minpadding = 5.0;
  int _diceNumber;
  bool diceRolled = false;
  @override
  void initState() {
    ShakeDetector detector = ShakeDetector.waitForStart(
        onPhoneShake: () {
          diceRoll();
        }
    );

    detector.startListening();
    super.initState();
  }
  void diceRoll(){
    setState(() {
      _diceNumber = getNumber() + 1;
      diceRolled = true;
    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
//      appBar: AppBar(
//        centerTitle: true,
//        title: Text(
//          'Virtual Dice',
//        ),
//        backgroundColor: Colors.blueGrey,
//        elevation: 6.0,
//      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(_minpadding),
          child: Column(
            children: <Widget>[
              diceRolled
                  ? _diceNumber == 1
                      ? getImg1()
                      : _diceNumber == 2
                          ? getImg2()
                          : _diceNumber == 3
                              ? getImg3()
                              : _diceNumber == 4
                                  ? getImg4()
                                  : _diceNumber == 5 ? getImg5() : getImg6()
                  : getImageAsset(),
              Padding(
                padding: EdgeInsets.only(top: _minpadding * 15),
                child: SizedBox(
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  child: Material(
                      elevation: 6.0,
                      color: Colors.blueGrey,
                      child: InkWell(
                        onTap: diceRoll ,
                        child: Center(
                            child: Text(
                          'Tap/Shake to Roll!',
                          textAlign: TextAlign.center,
                          textScaleFactor: 2.0,
                        )),

                      )),
                ),
              ),
              diceRolled
                  ? Center(
                      child: Padding(
                        padding: EdgeInsets.only(top: _minpadding * 20),
                        child: SizedBox(
                          height: MediaQuery.of(context).size.height / 6,
                          width: MediaQuery.of(context).size.width / 2,
                          child: Material(
                            elevation: 10.0,
                            color: Colors.blueGrey,
                            child: Center(
                              child: Text('$_diceNumber',
                                  textAlign: TextAlign.center,
                                  textScaleFactor: 6.0),
                            ),
                          ),
                        ),
                      ),
                    )
                  : Container()
            ],
          ),
        ),
      ),
    );
  }

  Widget getImageAsset() {
    AssetImage assetImage = AssetImage('images/dice.png');
    Image image = Image(
      image: assetImage,
      width: 165,
      height: 165,
    );
    return Container(
      child: image,
      margin: EdgeInsets.only(top: 40),
    );
  }

  Widget getImg1() {
    AssetImage assetImage = AssetImage('images/dice1.png');
    Image image = Image(
      image: assetImage,
      width: 165,
      height: 165,
    );
    return Container(
      child: image,
      margin: EdgeInsets.only(top: 40),
    );
  }

  Widget getImg2() {
    AssetImage assetImage = AssetImage('images/dice2.png');
    Image image = Image(
      image: assetImage,
      width: 165,
      height: 165,
    );
    return Container(
      child: image,
      margin: EdgeInsets.only(top: 40),
    );
  }

  Widget getImg3() {
    AssetImage assetImage = AssetImage('images/dice3.png');
    Image image = Image(
      image: assetImage,
      width: 165,
      height: 165,
    );
    return Container(
      child: image,
      margin: EdgeInsets.only(top: 40),
    );
  }

  Widget getImg4() {
    AssetImage assetImage = AssetImage('images/dice4.png');
    Image image = Image(
      image: assetImage,
      width: 165,
      height: 165,
    );
    return Container(
      child: image,
      margin: EdgeInsets.only(top: 40),
    );
  }

  Widget getImg5() {
    AssetImage assetImage = AssetImage('images/dice5.png');
    Image image = Image(
      image: assetImage,
      width: 165,
      height: 165,
    );
    return Container(
      child: image,
      margin: EdgeInsets.only(top: 40),
    );
  }

  Widget getImg6() {
    AssetImage assetImage = AssetImage('images/dice6.png');
    Image image = Image(
      image: assetImage,
      width: 165,
      height: 165,
    );
    return Container(
      child: image,
      margin: EdgeInsets.only(top: 40),
    );
  }

//Widget getImageAccordingNumber (){
//    _diceNumber == 1?
//         getImg1():
//        _diceNumber == 2?
//            getImg2():
//            _diceNumber == 3?
//                getImg3():
//                _diceNumber == 4?
//                    getImg4():
//                    _diceNumber == 5?
//                        getImg5():
//                            getImg6();
//
//
//}
  int getNumber() {
    var random = new Random();
    int num = random.nextInt(6);
    return num;
  }
}
