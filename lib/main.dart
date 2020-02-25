import 'package:flutter/material.dart';
import 'pages/dice.dart';
import 'pages/coin.dart';
import 'package:page_view_indicators/circle_page_indicator.dart';
import 'package:page_view_indicators/page_view_indicators.dart';
import 'package:admob_flutter/admob_flutter.dart';


void main() {
  Admob.initialize("ca-app-pub-8776712646869584~2411021327");
  runApp(DiceCoin());
}

class DiceCoin extends StatelessWidget {
  final List<Widget> pages = [Dice(), Coin()];
  final _currentPageNotifier = ValueNotifier<int>(0);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Dice & Coin',
        theme: ThemeData(
          brightness: Brightness.dark,
        ),
        home: Column(
          children: <Widget>[
            Expanded(
              child: Stack(
                children: <Widget>[
                  PageView.builder(
                      itemCount: pages.length,
                      itemBuilder: (BuildContext context, int index) {
                        return pages[index];
                      },
                      onPageChanged: (int index) {
                        _currentPageNotifier.value = index;
                      }),
                  Positioned(
                    bottom: 16.0,
                    left: 0.0,
                    right: 0.0,
                    child: CirclePageIndicator(
                      dotColor: Colors.blueGrey,
                      selectedDotColor: Colors.white,
                      itemCount: pages.length,
                      currentPageNotifier: _currentPageNotifier,
                    ),
                  )
                ],
              ),
            ),
            AdmobBanner(adUnitId: 'ca-app-pub-8776712646869584/8943025689', adSize: AdmobBannerSize.BANNER)
          ],
        ));
  }
}
