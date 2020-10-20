
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
      padding: const EdgeInsets.all(12.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Color(0xff453658),
        ),
        child: Card(
          margin: EdgeInsets.all(12),

          color: Color(0xff453658),

          elevation: 10,
          child: ListTile(
           title: Text(prodzkr,
             style: TextStyle(color: Colors.blueGrey[100],fontWeight: FontWeight.w900,fontSize: 20),
             textAlign: TextAlign.center,),
               subtitle:    Center(
                   child: FlatButton(child: CircleAvatar(
                     child: Icon(Icons.event_note),backgroundColor: Colors.grey[700],),
                     onPressed: (){
                       showDialog(context: context, builder: (context){
                         return AlertDialog(
                           backgroundColor: Color(0xff392850),
                           elevation: 10,
                           titlePadding: EdgeInsets.all(20),
                           title: Center(
                             child: ListTile(
                               subtitle: Text(prodsubtitle,
                                 style: TextStyle(color: Colors.white,fontSize: 18,fontWeight: FontWeight.bold),
                                 textAlign: TextAlign.left,),
                             ),
                           ),


                         );
                       });
                     },
                   )),

          ),
        ),
      ),
    );
  }
}
class AzkarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return  Scaffold(
        resizeToAvoidBottomPadding: false,
        backgroundColor: Color(0xff392850),
        appBar: AppBar(
          title: Text("Muslim",style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
          backgroundColor: Color(0xff453658),
          centerTitle: true,
          elevation: 10,
        ),
        body:Azkar(),

    );
  }
}
