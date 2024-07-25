import 'package:day_9_party_events/animation/fade_animation.dart';
import 'package:flutter/material.dart';

class FindEvent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(246, 248, 253, 1),
      appBar: AppBar(
        backgroundColor: Colors.white,
        // elevation: 0,
        leading: Icon(Icons.menu, color: Colors.black,),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.all(10.0),
            child: Container(
              width: 35,
              height: 35,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage('assets/images/four.jpg'),
                  fit: BoxFit.cover
                )
              ),
              child: Transform.translate(
                offset: Offset(15, -15),
                child: Container(
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(width: 3, color: Colors.white),
                    shape: BoxShape.circle,
                    color: Colors.yellow[800]
                  ),
                ),
              ),
            ),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FadeAnimation(1, Container(
                padding: EdgeInsets.only(top: 5),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black),
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.white
                ),
                child: TextField(
                  decoration: InputDecoration(
                    // border: OutlineInputBorder(
                    //   borderSide: BorderSide(color: Colors.black)
                    // ),
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.search, color: Colors.black,),
                    hintText: "Chercher un paiya",
                    hintStyle: TextStyle(color: Colors.black)
                  ),
                ),
              )),
              SizedBox(height: 30,),
              FadeAnimation(1.2, makeItem(image: 'assets/images/one.jpg', date: 4, titre: "La sunday")),
              SizedBox(height: 20,),
              FadeAnimation(1.3, makeItem(image: 'assets/images/two.jpg', date: 5, titre: "Beach party")),
              SizedBox(height: 20,),
              FadeAnimation(1.4, makeItem(image: 'assets/images/three.jpg', date: 6, titre: "Concert Tm paiya")),
              SizedBox(height: 20,),
              FadeAnimation(1.5, makeItem(image: 'assets/images/four.jpg', date: 7, titre:  "Independance")),
              SizedBox(height: 20,),
            ],
          ),
        ),
      ),
    );
  }

  Widget makeItem({image, date, titre}) {
    return Row(
      children: <Widget>[
        Container(
          width: 50,
          height: 200,
          margin: EdgeInsets.only(right: 20),
          child: Column(
            children: <Widget>[
              Text(date.toString(), style: TextStyle(color: Colors.blue, fontSize: 25, fontWeight: FontWeight.bold),),
              Text("Août", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),)
            ],
          ),
        ),
        Expanded(
          child: Container(
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover
              )
            ),
            child: Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                gradient: LinearGradient(
                  colors: [
                    Colors.black.withOpacity(.4),
                    Colors.black.withOpacity(.1),
                  ]
                )
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(titre, style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
                  SizedBox(height: 10,),
                  Row(
                    children: <Widget>[
                      Icon(Icons.access_time, color: Colors.white,),
                      SizedBox(width: 10,),
                      Text("19:00 ", style: TextStyle(color: Colors.white),)
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}