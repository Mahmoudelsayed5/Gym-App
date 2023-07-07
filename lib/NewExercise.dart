import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gym_app/AddExercise.dart';

import 'Exercise.dart';

class NewExercise extends StatefulWidget {
  @override
  _NewExerciseState createState() => _NewExerciseState();
}

class _NewExerciseState extends State<NewExercise> {

  final userController = TextEditingController();
  String _dropDownValue = 'Muscle';


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0.0,
          leading: IconButton(onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(builder: (Context) => AddExercise())
            );
          } ,
              icon: Icon(Icons.arrow_back_ios ,
                color: Colors.black,
                size: 30,)
          ),
          title: const Center(
            child: Text('Add Exercise',
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
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
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Column(
              children: <Widget>[
           Padding(
              padding: EdgeInsets.all(15),
              child: TextField(
            controller: userController,
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Exercise name',
              hintText: 'Exercise name',
            ),
          ),
        ),
                Center(
                  child: Padding(padding: EdgeInsets.all(16.0),
                    child: Container(
                      padding: EdgeInsets.only(left: 16 , right: 16),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.black , width: 1
                        )
                      ),
                      child: DropdownButton(
                       hint: _dropDownValue == null
                       ?  Text('Choose Muscle')
                       :  Text(
                        _dropDownValue,
                        style: TextStyle(
                          color: Colors.black
                        ),
                      ),
                      isExpanded: true,
                      iconSize: 30,
                      style: TextStyle(
                        color: Colors.black,
                      ),
                      items: ['Shoulders','Chest','Back','Arms','Legs'].map(
                          (val) {return DropdownMenuItem<String>(
                               value: val,
                               child: Text(val),
                           );
                      },
                      ).toList(),
                      onChanged: (val){
                        setState(
                        () {
                        _dropDownValue = val as String ;
                      },
                        );
                          },
                    ),
                  ),
                )
                ),
                Row(
                  children: <Widget>[Padding(padding: EdgeInsets.symmetric(
                    horizontal: 15,
                    vertical: 20
                  ),

                    child: SizedBox(
                      width: 150,
                      child: TextField(
                        controller: userController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          labelText: 'Sets',
                          hintText: 'Sets',
                        ),
                      ),
                    ),
                  ),
                    Spacer(),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 20
                      ),
                      child: SizedBox(
                        width: 150,
                        child: TextField(
                          controller: userController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            labelText: 'Reps',
                            hintText: 'Reps',
                          ),
                        ),
                      ),
                    ),
                  ] 
                ),
                const SizedBox(height: 10,),
                 Padding(
                   padding: const EdgeInsets.symmetric(
                     horizontal: 15,
                     vertical: 10,
                   ),
                   child: Row(
                      children: <Widget>[
                        Text('Upload Exercise photo/video',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                        Spacer(),
                        IconButton(onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(builder: (Context) => AddExercise())
                          );
                        } ,
                            // ignore: prefer_const_constructors
                            icon: Icon(Icons.upload_file ,
                              color: Colors.black,
                              size: 30,)
                        ),
                      ],
                    ),
                 ),
                const SizedBox(height: 10,),
                TextButton(
                  onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (Context) => Exercise())
                  );
                }, child: Text('save',),
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
    ),
      ),
    );
  }
}
