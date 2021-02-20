import 'package:flutter/widgets.dart';
import 'package:nightlife/listener/PageViewRollingPositionListener.dart';

class NewYorkPage extends StatefulWidget{
  List<PageViewRollingPositionListener> listeners;

  NewYorkPage(this.listeners);

  @override
  State<StatefulWidget> createState() {
    return NewYorkPageState();
  }
}

class NewYorkPageState extends State<NewYorkPage> implements PageViewRollingPositionListener{
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
          child: Image.asset("assets/images/ic_cloud4.png",  height: 100, fit: BoxFit.fitHeight,),
          top: 270,
          left: 10 + rollPosition*0.3,
        ),
        Center(
          child: Image.asset("assets/images/newyork.png",  height: 300, fit: BoxFit.fitHeight,),
        ),
        Positioned(
          child: Image.asset("assets/images/ic_cloud3.png",  height: 80, fit: BoxFit.fitHeight,),
          top: 230,
          right: -200 + rollPosition*0.5,
        ),

        Positioned(
          child: Image.asset("assets/images/ic_cloud1.png",  height: 120, fit: BoxFit.fitHeight,),
          top: 320,
          right: -10 + rollPosition*1.3,
        ),
        Positioned(
          child: Image.asset("assets/images/ic_cloud2.png",  height: 95, fit: BoxFit.fitHeight,),
          top: 160,
          right: 10 + rollPosition*0.3,
        ),
        Positioned(
          child: Image.asset("assets/images/ic_cloud4.png",  height: 120, fit: BoxFit.fitHeight,),
          top: 90,
          right: - rollPosition*0.6,
        ),
        Positioned(
          child: Image.asset("assets/images/ic_cloud5.png",  height: 160, fit: BoxFit.fitHeight,),
          top: 390,
          left: -210 + rollPosition*0.4,
        ),
        Positioned(
          child: Image.asset("assets/images/ic_plan.png", width: 30,height: 30, fit: BoxFit.contain,),
          top: 130,
          left: -30 + rollPosition,
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