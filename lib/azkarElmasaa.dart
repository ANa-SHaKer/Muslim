
import 'package:flutter/material.dart';

import 'lists.dart';




class AzkarElmasaa extends StatefulWidget {
  AzkarElmasaa({Key key}) : super(key: key);

  _AzkarElmasaaState createState() => _AzkarElmasaaState();
}

class _AzkarElmasaaState extends State<AzkarElmasaa> {

  @override
  Widget build(BuildContext context) {
    return GridView.builder(

      itemCount: AzkarElmasa.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1, // number of button in row
          childAspectRatio: 2
      ),

      itemBuilder: (BuildContext context, int index){
        return SingleAzkarElmasa(
          prodzkr: AzkarElmasa[index]['zekr'],
          prodnum: AzkarElmasa[index]['repeat'],
          prodsubtitle: AzkarElmasa[index]['bless'],


        );
      },
    );
  }
}

class SingleAzkarElmasa extends StatelessWidget {
  final prodzkr;
  final prodnum;
  final prodsubtitle;




  SingleAzkarElmasa({
    this.prodzkr,
    this.prodsubtitle,
    this.prodnum,


  });
  int num =100;




  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Column(
      children: <Widget>[
        Flexible(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              height: MediaQuery.of(context).size.height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xff453658),
              ),
              child: Card(

                color: Color(0xff453658),

                elevation: 10,
                child: ListTile(

                  title: Text(prodzkr,
                    style: TextStyle(color: Colors.blueGrey[100],fontWeight: FontWeight.w900,fontSize: 15),
                    textAlign: TextAlign.center,),


                ),
              ),
            ),
          ),
        ),

      ],
    );
  }
}
class ElmasaPage extends StatelessWidget {
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
      body: AzkarElmasaa(),


    );
  }
}
