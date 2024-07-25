import 'package:day_9_party_events/animation/fade_animation.dart';
import 'package:day_9_party_events/screen/find_event.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin{
  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;

  bool hide = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _scaleController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 300)
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 30.0
    ).animate(_scaleController)..addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.push(context, PageTransition(child: FindEvent(), type: PageTransitionType.fade));
      }
    });
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();

    _scaleController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/background.jpg'),
            fit: BoxFit.cover
          )
        ),
        child: Container(
          padding: EdgeInsets.all(30),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.bottomCenter,
              colors: [
                Colors.black.withOpacity(.9),
                Colors.black.withOpacity(.6),
                Colors.black.withOpacity(.8),
                Colors.black.withOpacity(.3),
              ]
            )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FadeAnimation(1, Text("Ici trouvez les meilleur position pour passer un bon paiya.", 
              style: TextStyle(color: Colors.white, fontSize: 34, fontWeight: FontWeight.w900, height: 1.1),)),
              SizedBox(height: 26,),
              FadeAnimation(1.2, Text("Nous trouvons les paiya a proximité de chez vous", 
              style: TextStyle(color: Colors.white.withOpacity(.8), fontSize: 25, fontWeight: FontWeight.w400),)),
              SizedBox(height: 150,),
              FadeAnimation(1.4, InkWell(
                onTap: () {
                  setState(() {
                    hide = true;
                  });
                  _scaleController.forward();
                },
                child: AnimatedBuilder(
                  animation: _scaleController,
                  builder: (context, child) => Transform.scale(
                    scale: _scaleAnimation.value,
                    child: Container(
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.yellow[700]
                      ),
                      child: hide == false ? Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: <Widget>[
                          Text("Trouver un paiya prôche", style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.w400),),
                          Icon(Icons.arrow_forward, color: Colors.white,)
                        ],
                      ) : Container(),
                    ),
                  )
                ),
              )),
              SizedBox(height: 60,)
            ],
          ),
        ),
      ),
    );
  }
}