import 'package:flutter/material.dart';

import 'lists.dart';


class Malomat extends StatefulWidget {
  Malomat({Key key}) : super(key: key);

  _MalomatState createState() => _MalomatState();
}

class _MalomatState extends State<Malomat> {

  @override
  Widget build(BuildContext context) {
    return GridView.builder(

      itemCount: MalomatList.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1, // number of button in row
        childAspectRatio: 2,
      ),

      itemBuilder: (BuildContext context, int index){
        return SingleMalomatList(
          prodtitle: MalomatList[index]['title'],
          prodcolor: MalomatList[index]['color'],

        );
      },
    );
  }
}

class SingleMalomatList extends StatelessWidget {
  final prodtitle;
  final prodcolor;




  SingleMalomatList({
    this.prodtitle,
    this.prodcolor,



  });



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.only(top:8.0,left: 5),
      child: Container(

        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: prodcolor,
            borderRadius: BorderRadius.circular(20)
        ),

        child:  ListTile(title: Text(prodtitle,style: TextStyle(color: Colors.white,fontSize: 17,fontWeight: FontWeight.bold,),textAlign: TextAlign.right,)),


      ),
    );

  }
}
class MalomatPage extends StatelessWidget {
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

        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/god.png"),alignment: Alignment.center)
        ),
        child: Malomat()


      ),
    );
  }
}

