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
      padding: const EdgeInsets.only(top :10.0,left: 20,bottom: 5,right:20),
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
          decoration: BoxDecoration(
            color: prodcolor,
            borderRadius: BorderRadius.only(topRight: Radius.circular(50),topLeft:Radius.circular(50) ),
          ),

          child: ListTile(
              title:  Container(
                height: 70,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(55)
                ),
                child: Image.asset("assets/prophet.jpg"),),

               subtitle: Text(
                 prodkhalifa,
                 style: TextStyle(
                   fontSize: 25.0,
                   color: Colors.white,
                   fontFamily: "Quando",
                   fontWeight: FontWeight.w900,
                 ),
                 textAlign: TextAlign.center,

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
      backgroundColor: Color(0XFF1D1E70),
      appBar: AppBar(
        title: Text("Muslim",style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
        backgroundColor: Color(0XFF1D1E70),
        centerTitle: true,
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/god.png"),alignment: Alignment.center)
        ),
        child: Kholafa(),
      ),
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
      backgroundColor: Color(0XFF1D1E70),

      appBar: AppBar(
        title: Text(widget.pagekhalifa,style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
        backgroundColor: Color(0XFF1D1E70),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/mohamed.png"),alignment: Alignment.center)
        ),
        child: ListView(
          children: <Widget>[
            Qss(widget.pagepart1,widget.pagepart1 == "" ?Colors.transparent:Colors.deepPurpleAccent.withOpacity(0.5),),
            Qss(widget.pagepart2,widget.pagepart2 == "" ?Colors.transparent: Colors.deepPurple.withOpacity(0.5),),
            Qss(widget.pagepart3,widget.pagepart3 == "" ?Colors.transparent:Colors.indigoAccent.withOpacity(0.5),),
            Qss(widget.pagepart4,widget.pagepart4 == "" ?Colors.transparent:Colors.indigo.withOpacity(0.5),),
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
