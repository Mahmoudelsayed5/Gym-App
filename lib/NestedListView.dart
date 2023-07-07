import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quds_popup_menu/quds_popup_menu.dart';
import 'AddExercise.dart';

class NestedListView extends StatefulWidget {
  @override
  _NestedListViewState createState() => _NestedListViewState();
}

class _NestedListViewState extends State<NestedListView> {
  var _container = Container(
    child: Padding(
      padding: const EdgeInsets.only(
        top: 15,
        right: 15,
        left: 15,
      ),
      child: Container(
        width: 400,
        height: 220,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20)
        ),
        // child: MaterialButton(
        //   onPressed: () {
        //     Navigator.push(
        //         context,
        //         MaterialPageRoute(builder: (Context) =>
        //             ShowExercise())
        //     );
        //   },
          child: Padding(
            padding: const EdgeInsets.symmetric(
                horizontal: 10,
                vertical: 20
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4Il0VleBo6jX4yeg1XSowgZwjC3mIbZZEbJJYCBr1&s'
                      ),
                      maxRadius: 40,
                    ),
                    SizedBox(width: 15,),
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start,
                          children: <Widget>[
                            Text(
                              'Exercise name',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 7,),
                            Text(
                              'Exercise type',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 7,),
                            Text(
                              'X sets . X reps',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20,),
                Row(
                  children: <Widget>[
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT4Il0VleBo6jX4yeg1XSowgZwjC3mIbZZEbJJYCBr1&s'
                      ),
                      maxRadius: 40,
                    ),
                    SizedBox(width: 15,),
                    Expanded(
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment
                              .start,
                          children: <Widget>[
                            Text(
                              'Exercise name',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 7,),
                            Text(
                              'Exercise type',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                              ),
                            ),
                            SizedBox(height: 7,),
                            Text(
                              'X sets . X reps',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 15,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0.0,
        leading: const Icon(Icons.menu, color: Colors.transparent,),
        title: const Center(
          child: Text('Exercise',
            textAlign: TextAlign.center,
            style: TextStyle(
                color: Colors.white,
                fontSize: 30
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          QudsPopupButton(tooltip: 'T',
              items: getMenuItems(),
              child: const Icon(Icons.more_vert, color: Colors.white, size: 30))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(40.0),
        child: ListView( // parent ListView
          children: <Widget>[
            _container,
            _container,
            Container(
              height: 200, // give it a fixed height constraint
              color: Colors.teal,
              // child ListView
              child: ListView.builder(itemBuilder: (_, i) => ListTile(title: Text("Item ${i}"))),
            ),
            _container,
            _container,
            _container,
          ],
        ),
      ),
    );
  }

  List<QudsPopupMenuBase> getMenuItems() {
    List<Widget> gymTraining = [];
    return [
      QudsPopupMenuItem(
        leading: const Icon(Icons.add),
        title: const Text('Add Exercise'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddExercise()),
          );
        },
      ),
      QudsPopupMenuDivider(),
      QudsPopupMenuItem(
          leading: const Icon(Icons.delete_outline),
          title: const Text('Delete training'),
          onPressed: () {
            // showToast('Feedback Pressed!');
          }
      ),
      QudsPopupMenuDivider(),
      QudsPopupMenuItem(
          leading: const Icon(Icons.info_outline),
          title: const Text('Training info'),
          onPressed: () {
            // showToast('Feedback Pressed!');
          }
      ),
    ];
  }
}
