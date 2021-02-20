import 'package:flutter/widgets.dart';
import 'package:nightlife/listener/PageViewRollingPositionListener.dart';

class ParisPage extends StatefulWidget{
  List<PageViewRollingPositionListener> listeners;

  ParisPage(this.listeners);

  @override
  State<StatefulWidget> createState() {
    return ParisPageState();
  }
}

class ParisPageState extends State<ParisPage> with AutomaticKeepAliveClientMixin implements PageViewRollingPositionListener{
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
          child: Image.asset("assets/images/ic_cloud3.png",  height: 100, fit: BoxFit.fitHeight,),
          top: 260,
          left: 60 + rollPosition*0.2,
        ),
        Positioned(
          child: Image.asset("assets/images/ic_cloud3.png",  height: 80, fit: BoxFit.fitHeight,),
          top: 230,
          right: 0 + rollPosition*-0.5,
        ),
        Positioned(
          child: Image.asset("assets/images/ic_cloud4.png",  height: 100, fit: BoxFit.fitHeight,),
          top: 270,
          left: 10 + rollPosition*0.3,
        ),

        Center(
          child: Image.asset("assets/images/paris.png",  height: 350, fit: BoxFit.fitHeight,),
        ),
        Positioned(
          child: Image.asset("assets/images/ic_cloud1.png",  height: 130, fit: BoxFit.fitHeight,),
          top: 350,
          left: 0 + rollPosition*-1.8,
        ),
        Positioned(
          child: Image.asset("assets/images/ic_cloud1.png",  height: 120, fit: BoxFit.fitHeight,),
          top: 380,
          right: -20 + rollPosition*1.3,
        ),
        Positioned(
          child: Image.asset("assets/images/ic_cloud2.png",  height: 80, fit: BoxFit.fitHeight,),
          top: 250,
          left: -40 + rollPosition*-0.5,
        ),
        Positioned(
          child: Image.asset("assets/images/ic_cloud2.png",  height: 95, fit: BoxFit.fitHeight,),
          top: 120,
          right: 30 + rollPosition*0.6,
        ),
        Positioned(
          child: Image.asset("assets/images/ic_cloud4.png",  height: 120, fit: BoxFit.fitHeight,),
          top: 290,
          right: -20 + rollPosition*-1.6,
        ),
        Positioned(
          child: Image.asset("assets/images/ic_cloud5.png",  height: 60, fit: BoxFit.fitHeight,),
          top: 390,
          right: -50 + rollPosition*1.4,
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