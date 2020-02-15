
import 'package:flutter/material.dart';

import 'lists.dart';




class Tasabyh extends StatefulWidget {
  Tasabyh({Key key}) : super(key: key);

  _TasabyhState createState() => _TasabyhState();
}

class _TasabyhState extends State<Tasabyh> {

  @override
  Widget build(BuildContext context) {
    return GridView.builder(

      itemCount: TasabyhList.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1, // number of button in row
        childAspectRatio: 2
      ),

      itemBuilder: (BuildContext context, int index){
        return SingleTasabyhList(
          prodtasbyh: TasabyhList[index]['tasbyh'],
          prodnum: TasabyhList[index]['num'],
          prodsubtitle: TasabyhList[index]['subtitile'],
      

        );
      },
    );
  }
}

class SingleTasabyhList extends StatelessWidget {
  final prodtasbyh;
  final prodnum;
  final prodsubtitle;
 



  SingleTasabyhList({
    this.prodtasbyh,
    this.prodsubtitle,
    this.prodnum,


  });
  int num =100;




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(top:8.0,left: 5),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: Colors.deepPurpleAccent.withOpacity(0.8),
            borderRadius: BorderRadius.circular(20)
        ),

        child:  Column(
          children: <Widget>[
            Container(
              height: 40,
              width: 80,
              alignment: Alignment.center,

              decoration: BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.only(bottomRight: Radius.circular(25),bottomLeft: Radius.circular(25))
              ),
            child: Text(prodnum,style: TextStyle(color: Colors.white,fontSize: 15,fontWeight: FontWeight.w900),textDirection: TextDirection.rtl,) ,
        ),
            ListTile(title: Text(prodtasbyh,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w900,),textAlign: TextAlign.center,),
              subtitle: Text(prodsubtitle,style: TextStyle(color: Colors.white,fontSize: 15,),textAlign: TextAlign.right),

            ),
          ],
        )
      ),
    );
  }
}
class TasabyhPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomPadding: false,

      backgroundColor: Color(0XFF1D1E70),
      appBar: AppBar(
        title: Text("Muslim",style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
        backgroundColor: Color(0XFF1D1E70),
        centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                image: DecorationImage(image: AssetImage("assets/god.png"),alignment: Alignment.center)
            ),
            child: Tasabyh(),
          ),
        ],
      ),
    );
  }
}