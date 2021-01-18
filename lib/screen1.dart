import 'dart:math';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class screen1 extends StatefulWidget {
  @override
  _screen1State createState() => _screen1State();
}

class _screen1State extends State<screen1> {
 var player = AudioPlayer();
  Map<String, bool> score = {};
  Map<String, Color> choice = {
    '🍎': Colors.red,
    '📗': Colors.green,
    '☄': Colors.blue,
    '👩': Colors.yellow,
    '🐅': Colors.orange,
    '🍆': Colors.purple,
    '🌰': Colors.brown,
  };
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple.withOpacity(0.5),
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity(0.3),
        title: Text("Gaming",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold),),
        centerTitle: true,
        elevation: 0,
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh,color: Colors.white,),
        backgroundColor: Colors.black87,
        onPressed: (){
          setState(() {
            score.clear();
            index++;

          });
        },
      ),
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: choice.keys.map((e) {
              return Expanded(
                  child: Draggable<String>(
                data: e,
                ignoringFeedbackSemantics: false,
                child: movable(score[e]==true?'❤':e),
                feedback: movable(e),
                childWhenDragging: movable('😀'),
              ));
            }).toList(),
          ),
          SizedBox(width: 100,),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: choice.keys.map((e) {
              return buildtarget(e);
            }).toList()
              ..shuffle(Random(index)),
          ),
        ],
      ),
    );
  }

  Widget buildtarget(String e) {
    return DragTarget<String>(
      builder: (context,incoming,rejected){
        if(score[e]==true){
          return Container(
            margin: EdgeInsets.all(2),
            color: Colors.black87,
            child: Text("Congratulations!!",style: TextStyle(color: Colors.white,fontWeight: FontWeight.bold,fontSize: 15),),
            alignment: Alignment.center,
            height: 80,
            width: 150,
          );
        }else{
          return Container(
            color: choice[e],
            height: 80,
            width: 150,
          );
        }
      },
      onWillAccept: (data)=>data==e,
      onAccept: (data){
        setState(() {
          score[e]=true;
          player.play("assets/m1.mp3");
        });
      },
      onLeave: (data){

      },
    );
  }
}
class movable extends StatelessWidget{
  final String emoji;
   movable(this.emoji);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Material(
      color: Colors.transparent,
      child: Container(
        alignment: Alignment.center,
        height: 120,
       // padding: EdgeInsets.all(20),
        child: Text(emoji,style: TextStyle(color: Colors.black,fontSize: 60),),
      ),
    );
  }
}
