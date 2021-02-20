import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:nightlife/listener/PageViewRollingPositionListener.dart';

import 'NewYorkPage.dart';
import 'LondonPage.dart';
import 'ParisPage.dart';

class NightLifePage extends StatelessWidget {
  List<PageViewRollingPositionListener> listeners;
  PageController pageController;
  double widthScreen;
  @override
  Widget build(BuildContext context) {
    widthScreen = MediaQuery.of(context).size.width;
    listeners = [];
    pageController = PageController();
    PageView pageView = _getPageView();
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/images/bg_moon.png",width: double.infinity, fit: BoxFit.cover,),
          NotificationListener<ScrollNotification>(
              child: pageView,
              onNotification: (ScrollNotification notification) {
                int index = 0;
                for (PageViewRollingPositionListener listener in listeners){
                  print("===============================================${notification.metrics.pixels}");
                  double rollPosition = notification.metrics.pixels - index * widthScreen;
                  listener.onRolling(rollPosition);
                  index ++;
                }
                return false;
              })
        ],
      ),
    );
  }

  Widget _getPageView() {
    return PageView(
      controller: pageController,
      children: <Widget>[
        ParisPage(listeners),
        LondonPage(listeners),
        NewYorkPage(listeners),
      ],
    );
  }

}
