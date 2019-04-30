import 'dart:async';

import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Animation(),
    );
  }
}

class Animation extends StatefulWidget {
  @override
  _AnimationState createState() => _AnimationState();
}

class _AnimationState extends State<Animation> {
  String mode = "Play";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          SizedBox(
            height: 400.0,
            child: Builder(
              builder: (context) {
                return FlareActor(
                  "assets/flare/toaster.flr",
                  alignment: Alignment.center,
                  fit: BoxFit.contain,
                  animation: mode,
                  isPaused: !mounted,
                  callback: (String text) {
                    Scaffold.of(context).showSnackBar(SnackBar(
                      content: Text("'Play Once' completed"),
                    ));
                  },
                );
              },
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: <Widget>[
              RaisedButton(
                child: Text("Once"),
                onPressed: () {
                  setState(() {
                    mode = "Play";
                    Timer(Duration(milliseconds: 100), () {
                      setState(() {
                        mode = "Play Once";
                      });
                    });
                  });
                },
              ),
              RaisedButton(
                child: Text("Loop"),
                onPressed: () {
                  setState(() {
                    mode = "Play";
                  });
                },
              )
            ],
          )
        ],
      ),
    );
  }
}
