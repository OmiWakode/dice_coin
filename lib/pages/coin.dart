import 'package:flutter/material.dart';
import 'package:shake/shake.dart';
import 'dart:math';

class Coin extends StatefulWidget {
  @override
  _CoinState createState() => _CoinState();
}

class _CoinState extends State<Coin> {
  var _minpadding = 5.0;
  int _coinNumber;
  bool coinTossed = false;

  @override
  void initState() {
    ShakeDetector detector = ShakeDetector.waitForStart(onPhoneShake: () {
      coinToss();
    });

    detector.startListening();
    super.initState();
  }

  void coinToss() {
    setState(() {
      _coinNumber = getNumber();
      coinTossed = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,

//      appBar: AppBar(
//        centerTitle: true,
//        title: Text(
//          'Virtual Coin',
//        ),
//        backgroundColor: Colors.blueGrey,
//        elevation: 6.0,
//      ),
      body: Center(
        child: Container(
          margin: EdgeInsets.all(_minpadding),
          child: Column(
            children: <Widget>[
              coinTossed ? getCoin() : getImageAsset(),
              Padding(
                padding: EdgeInsets.only(top: _minpadding * 15),
                child: SizedBox(
                  height: 70,
                  width: MediaQuery.of(context).size.width,
                  child: Material(
                      elevation: 6.0,
                      color: Colors.blueGrey,
                      child: InkWell(
                        onTap: coinToss,
                        child: Center(
                            child: Text(
                          'Tap/Shake to Toss!',
                          textAlign: TextAlign.center,
                          textScaleFactor: 2,
                        )),
                      )),
                ),
              ),
              coinTossed
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
                              child: Text(
                                  _coinNumber == 0 ? 'Heads!' : 'Tails!',
                                  textAlign: TextAlign.center,
                                  textScaleFactor: 3.5),
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
    AssetImage assetImage = AssetImage('images/cointoss.gif');
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

  Widget getCoin() {
    return Padding(
      padding: EdgeInsets.only(top: 40.0),
      child: SizedBox(
        height: 165,//MediaQuery.of(context).size.width / 3,
        width: 165,//MediaQuery.of(context).size.width / 3,
        child: Material(
          color: Colors.blueGrey,
          borderRadius: BorderRadius.all(Radius.circular(1000)),
          elevation: 22.0,
          child: Center(
            child: Text(
              _coinNumber == 0 ? 'H' : 'T',
              textAlign: TextAlign.center,
              textScaleFactor: 3.0,
              style: TextStyle(color: Colors.white70),
            ),
          ),
        ),
      ),
    );
  }

  int getNumber() {
    var random = new Random();
    int num = random.nextInt(2);
    return num;
  }
}
