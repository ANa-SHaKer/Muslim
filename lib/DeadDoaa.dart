import 'package:flutter/material.dart';

import 'lists.dart';


class DeadDoaa extends StatefulWidget {
  DeadDoaa({Key key}) : super(key: key);

  _DeadDoaaState createState() => _DeadDoaaState();
}

class _DeadDoaaState extends State<DeadDoaa> {

  @override
  Widget build(BuildContext context) {
    return GridView.builder(

      itemCount: DeadDoaaList.length,
      gridDelegate: new SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 1, // number of button in row
        childAspectRatio: 2,
      ),

      itemBuilder: (BuildContext context, int index){
        return SingleDeadDoaaList(
          prodtitle: DeadDoaaList[index]['zekr'],

        );
      },
    );
  }
}

class SingleDeadDoaaList extends StatelessWidget {
  final prodtitle;




  SingleDeadDoaaList({
    this.prodtitle,



  });



  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Flex(

        direction: Axis.vertical,
        children: <Widget>[
          Expanded(
              child: Material(
                elevation: 10,
                borderRadius: BorderRadius.circular(20),
                color:  Color(0xff453658),
                child: Center(
                  child:Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(prodtitle,
                      style: TextStyle(color: Colors.blueGrey[100],fontWeight: FontWeight.w900,fontSize: 18),
                      textAlign: TextAlign.center,),
                  ),
                ),
              )),
        ],
      ),
    );

  }
}
class DeadDoaaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff392850),
      appBar: AppBar(
        title: Text("Muslim",style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
        backgroundColor: Color(0xff453658),
        centerTitle: true,
        elevation: 10,
      ),
      body: DeadDoaa(),
    );
  }
}

