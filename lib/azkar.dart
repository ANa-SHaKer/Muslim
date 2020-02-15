
import 'package:flutter/material.dart';

import 'lists.dart';




class Azkar extends StatefulWidget {
  Azkar({Key key}) : super(key: key);

  _AzkarState createState() => _AzkarState();
}

class _AzkarState extends State<Azkar> {

  @override
  Widget build(BuildContext context) {
    return GridView.builder(

      itemCount: AzkarList.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, // number of button in row
          childAspectRatio: 2
      ),

      itemBuilder: (BuildContext context, int index){
        return SingleAzkarList(
          prodzkr: AzkarList[index]['zkr'],
          prodnum: AzkarList[index]['num'],
          prodsubtitle: AzkarList[index]['subtitile'],


        );
      },
    );
  }
}

class SingleAzkarList extends StatelessWidget {
  final prodzkr;
  final prodnum;
  final prodsubtitle;




  SingleAzkarList({
    this.prodzkr,
    this.prodsubtitle,
    this.prodnum,


  });
  int num =100;




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Padding(
      padding: const EdgeInsets.only(left:10.0,bottom: 5,right: 10),
      child: Container(
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
                color: Colors.deepPurpleAccent.withOpacity(0.8),
                borderRadius: BorderRadius.circular(20)
            ),

              child:ListTile(title: Text(prodzkr,style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.w900,),textAlign: TextAlign.center,),
                  subtitle: Text(prodsubtitle,style: TextStyle(color: Colors.white,fontSize: 15,fontStyle: FontStyle.italic),textAlign: TextAlign.right,),


      ),
      )
    );
  }
}
class AzkarPage extends StatelessWidget {
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
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
            image: DecorationImage(image: AssetImage("assets/god.png"),alignment: Alignment.center)
        ),
        child: Azkar(),
      ),
    );
  }
}
