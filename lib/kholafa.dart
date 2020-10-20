import 'package:flutter/material.dart';

import 'lists.dart';


class Kholafa extends StatefulWidget {
  Kholafa({Key key}) : super(key: key);

  _KholafaState createState() => _KholafaState();
}

class _KholafaState extends State<Kholafa> {

  @override
  Widget build(BuildContext context) {
    return GridView.builder(

      itemCount: KholafaList.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1, // number of button in row
        childAspectRatio: 2

      ),

      itemBuilder: (BuildContext context, int index){
        return SingleKholafaList(
          prodkhalifa: KholafaList[index]['khalifa'],
          prodcolor: KholafaList[index]['color'],
          prodpart1: KholafaList[index]['part1'],
          prodpart2: KholafaList[index]['part2'],
          prodpart3: KholafaList[index]['part3'],
          prodpart4: KholafaList[index]['part4'],

        );
      },
    );
  }
}

class SingleKholafaList extends StatelessWidget {
  final prodcolor;
  final prodkhalifa;
  final prodpart1;
  final prodpart2;
  final prodpart3;
  final prodpart4;



  SingleKholafaList({
    this.prodcolor,
    this.prodkhalifa,
    this.prodpart1,
    this.prodpart2,
    this.prodpart3,
    this.prodpart4,


  });


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(top :2.0,left: 10,bottom: 5,right: 5),
      child:  InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (BuildContext context) => Details(
            pageColor: prodcolor,
            pagekhalifa: prodkhalifa,
            pagepart1: prodpart1,
            pagepart2: prodpart2,
            pagepart3: prodpart3,
            pagepart4: prodpart4,

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
                  prodkhalifa,
                  style: TextStyle(
                    fontSize: 22.0,
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
class KholafaPage extends StatelessWidget {
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
      body: Kholafa(),
    );
  }
}

class Details extends StatefulWidget {

  final pageTitle;
  final pageColor;
  final pagekhalifa;
  final pagepart1;
  final pagepart2;
  final pagepart3;
  final pagepart4;


  Details({this.pageTitle, this.pageColor, this.pagekhalifa,this.pagepart1,this.pagepart2,this.pagepart3,this.pagepart4});

  @override
  _DetailsState createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff392850),

      appBar: AppBar(
        title: Text(widget.pagekhalifa,style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
        backgroundColor: Color(0xff453658),
        centerTitle: true,
        elevation: 10,
      ),
      body: Container(

        child: ListView(
          children: <Widget>[
            Qss(widget.pagepart1,widget.pagepart1 == "" ?Colors.transparent: Color(0xff453658)),
            Qss(widget.pagepart2,widget.pagepart2 == "" ?Colors.transparent:  Color(0xff453658),),
            Qss(widget.pagepart3,widget.pagepart3 == "" ?Colors.transparent: Color(0xff453658)),
            Qss(widget.pagepart4,widget.pagepart4 == "" ?Colors.transparent: Color(0xff453658)),
          ],

        ),
      ),
    );
  }
}


Widget Qss( String title,Color color,){
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
