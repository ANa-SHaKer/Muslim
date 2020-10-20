import 'package:flutter/material.dart';

import 'lists.dart';


class Ahades extends StatefulWidget {
  Ahades({Key key}) : super(key: key);

  _AhadesState createState() => _AhadesState();
}

class _AhadesState extends State<Ahades> {

  @override
  Widget build(BuildContext context) {
    return GridView.builder(

      itemCount: AhadesList.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2, // number of button in row
        mainAxisSpacing: 5,
        crossAxisSpacing: 5
      ),

      itemBuilder: (BuildContext context, int index){
        return SingleAhadesList(
          prodtitle: AhadesList[index]['title'],
          prodhokm: AhadesList[index]['hokm'],
          prodcolor: AhadesList[index]['color'],
          prodhades1: AhadesList[index]['hades1'],
          prodhades2: AhadesList[index]['hades2'],
          prodhades3: AhadesList[index]['hades3'],
          prodhades4: AhadesList[index]['hades4'],

        );
      },
    );
  }
}

class SingleAhadesList extends StatelessWidget {
  final prodtitle;
  final prodcolor;
  final prodhokm;
  final prodhades1;
  final prodhades2;
  final prodhades3;
  final prodhades4;



  SingleAhadesList({
    this.prodtitle,
    this.prodcolor,
    this.prodhokm,
    this.prodhades1,
    this.prodhades2,
    this.prodhades3,
    this.prodhades4,


  });

/*
*/

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(top :2.0,left: 10,bottom: 5,right: 5),
      child:  InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Details(
            pageTitle: prodtitle,
            pageColor: prodcolor,
            pageHokm: prodhokm,
            pageHades1: prodhades1,
            pageHades2: prodhades2,
            pageHades3: prodhades3,
            pageHades4: prodhades4,

          )));
        },
        child: Container(
          padding: EdgeInsets.all(10),
          height: 190,
          width: 190,
          decoration: BoxDecoration(
            color: Color(0xff453652),
            borderRadius: BorderRadius.circular(20.0),
          ),
          child: Card(
            color: Color(0xff453658),
            elevation: 10,
            child: ListTile(
              title:  Center(
                child: Text(
                  prodhokm,
                  style: TextStyle(
                    fontSize: 18.0,
                    color: Colors.white,
                    fontFamily: "Quando",
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.center,

                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
class AhadesPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      backgroundColor: Color(0xff392850),
      appBar: AppBar(
        title: Text("Muslim",style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
        backgroundColor: Color(0xff453658),
        centerTitle: true,
        elevation: 10,
      ),
      body: Ahades(),
    );
  }
}

class Details extends StatefulWidget {

  final pageTitle;
  final pageColor;
  final pageHokm;
  final pageHades1;
  final pageHades2;
  final pageHades3;
  final pageHades4;


  Details({this.pageTitle, this.pageColor, this.pageHokm,this.pageHades1,this.pageHades2,this.pageHades3,this.pageHades4});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff392850),

      appBar: AppBar(
        title: Text(widget.pageHokm,style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
        backgroundColor: Color(0xff453658),
        centerTitle: true,
        elevation: 10,
      ),
      body: Container(

        child: ListView(
          children: <Widget>[
            Hades(widget.pageHades1,widget.pageHades1 == "" ?Colors.transparent: Color(0xff453658)),
            Hades(widget.pageHades2,widget.pageHades2 == "" ?Colors.transparent:  Color(0xff453658)),
             Hades(widget.pageHades3,widget.pageHades3 == "" ?Colors.transparent: Color(0xff453658)),
            Hades(widget.pageHades4,widget.pageHades4 == "" ?Colors.transparent: Color(0xff453658)),
          ],

        ),
      ),
    );
  }
}


Widget Hades( String title,Color color,){
 return  Padding(
   padding: const EdgeInsets.only(top:8.0,left: 5),
   child: Container(

     alignment: Alignment.center,
     decoration: BoxDecoration(
         color: color,
         borderRadius: BorderRadius.circular(20)
     ),

     child:  ListTile(title: Text(title,style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold,),textAlign: TextAlign.right,)),


   ),
 );
}