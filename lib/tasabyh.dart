
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
      padding: const EdgeInsets.all(12.0),
      child: Card(
        color: Color(0xff453658),
        elevation: 10,
        shape: StadiumBorder(),
        child: Container(
          alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xff453658),
            ),

          child:  ListTile(title: Text(prodtasbyh,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w900,),textAlign: TextAlign.center,),
            subtitle: Text(prodsubtitle,style: TextStyle(color: Colors.white,fontSize: 15,),textAlign: TextAlign.right),

          )
        ),
      ),
    );
  }
}
class TasabyhPage extends StatelessWidget {
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
      body: Tasabyh(),
    );
  }
}