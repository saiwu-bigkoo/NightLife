import 'package:flutter/widgets.dart';
import 'package:nightlife/listener/PageViewRollingPositionListener.dart';

class LondonPage extends StatefulWidget{
  List<PageViewRollingPositionListener> listeners;

  LondonPage(this.listeners);

  @override
  State<StatefulWidget> createState() {
    return LondonPageState();
  }
}

class LondonPageState extends State<LondonPage> with AutomaticKeepAliveClientMixin implements PageViewRollingPositionListener{
  @override
  bool get wantKeepAlive => true;

  double rollPosition = 0;
  @override
  void initState() {
    super.initState();
    if (widget.listeners != null)
      widget.listeners.add(this);
  }
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(
          child: Image.asset("assets/images/ic_cloud5.png",  height: 190, fit: BoxFit.fitHeight,),
          top: 200,
          left: 30 + rollPosition*0.3,
        ),
        Positioned(
          child: Image.asset("assets/images/ic_cloud4.png",  height: 120, fit: BoxFit.fitHeight,),
          top: 220,
          left: rollPosition*1.2,
        ),
        Positioned(
          child: Image.asset("assets/images/ic_cloud3.png",  height: 100, fit: BoxFit.fitHeight,),
          top: 160,
          left: 60 + rollPosition*0.6,
        ),
        Positioned(
          child: Image.asset("assets/images/ic_cloud4.png",  height: 100, fit: BoxFit.fitHeight,),
          top: 330,
          left: -10 + rollPosition*0.4,
        ),
        Center(
          child: Image.asset("assets/images/london.png",  width: double.infinity , fit: BoxFit.fitWidth,),
        ),
        Positioned(
          child: Image.asset("assets/images/ic_cloud1.png",  height: 120, fit: BoxFit.fitHeight,),
          top: 280,
          right: 30 + rollPosition*0.6,
        ),
        Positioned(
          child: Image.asset("assets/images/ic_cloud2.png",  height: 80, fit: BoxFit.fitHeight,),
          top: 350,
          right: 10 + rollPosition*1.3,
        ),
        Positioned(
          child: Image.asset("assets/images/ic_cloud5.png",  height: 60, fit: BoxFit.fitHeight,),
          top: 230,
          left: 20 + rollPosition*1.8,
        ),
        Positioned(
          child: Image.asset("assets/images/ic_plan.png", width: 30,height: 30, fit: BoxFit.contain,),
          top: 130,
          right: 30 - rollPosition,
        ),

      ],
    );
  }

  @override
  onRolling(double rollPosition) {
    if(this.rollPosition != rollPosition) {
      if(mounted) {
        setState(() {
          this.rollPosition = rollPosition;
        });
      }
    }
  }

}