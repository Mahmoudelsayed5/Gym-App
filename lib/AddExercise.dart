import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gym_app/Exercise.dart';
import 'package:gym_app/ExistExercise.dart';
import 'package:gym_app/NewExercise.dart';
import 'package:gym_app/images.dart';

class AddExercise extends StatefulWidget {
  @override
  _AddExerciseState createState() => _AddExerciseState();
}

class _AddExerciseState extends State<AddExercise> {
  get icon => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
        backgroundColor: Colors.grey,
        elevation: 0.0,
        leading: IconButton(onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(builder: (Context) => Exercise())
          );
        } ,
            icon: Icon(Icons.arrow_back_ios ,
              color: Colors.white,
              size: 30,)
        ),
          title: const Center(
            child: Text('Add Exercise',
                     textAlign: TextAlign.center,
                     style: TextStyle(
                            color: Colors.white,
                            fontSize: 30
                        ),
                        ),
                    ),
          centerTitle:  true,
            actions: [
            IconButton(onPressed: () {} ,
                 icon: Icon(Icons.more_vert ,
                                  color: Colors.transparent,
                                  size: 30,)
                            ),
    ]
                ),
          body: Container(
            child: Column(
              children: [
                Image.asset(GymImages.gymBg),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 40,
                  vertical: 70,
                ),
                child: Row(
                  children: [
                    TextButton(onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (Context) => ExistExercise())
                      );
                    }, child: Text('Add existing exercise'),
                      style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(Colors.white),
                          backgroundColor: MaterialStateProperty.all(Colors.green),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              )
                          )
                      ),
                    ),
                    Spacer(),
                    TextButton(
                      onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(builder: (Context) => NewExercise())
                      );
                    }, child: Text('Add new exercise'),
                      style: ButtonStyle(
                          foregroundColor: MaterialStateProperty.all(Colors.green),
                          backgroundColor: MaterialStateProperty.all(Colors.white),
                          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20),
                              )

                          )
                      ),
                    ),
                  ],
                ),
              )],
            ),
            
          ),
    );
  }
}

