import 'package:flutter/material.dart';
import 'story_brain.dart';


void main() => runApp(Destini());

class Destini extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: StoryPage(),
    );
  }
}




class StoryPage extends StatefulWidget {
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {

  StoryBrain storyBrain= new StoryBrain();








  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(

        padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 15.0),
        decoration: BoxDecoration(
          image:DecorationImage(
            image:AssetImage('images/background.png'),
            fit: BoxFit.cover,

          )
        ),

        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Expanded(
                flex: 12,
                child: Center(
                  child: Text(storyBrain.getStory(),

                    style: TextStyle(
                      fontSize: 25.0,
                      color:Colors.white,
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: TextButton(
                  onPressed: () {
                    //Choice 1 made by user.
                   setState(() {

                     storyBrain.nextStory(1);
                   });
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.red,



                  ),


                  child: Text(

                     storyBrain.getChoice1(),
                    style: TextStyle(
                      fontSize: 20.0,
                      color:Colors.white
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              Visibility(
                visible: storyBrain.shouldBeVisible(),
                child: Expanded(
                  flex: 2,

                  child:TextButton(
                    onPressed: () {
                      //Choice 2 made by user.
                    setState(() {
                      storyBrain.nextStory(2);
                    });
                    },
                    style: TextButton.styleFrom(
                        backgroundColor: Colors.blue
                    ),

                    child: Text(

                     storyBrain.getChoice2(),
                      style: TextStyle(
                        fontSize: 20.0,
                        color:Colors.white
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

