// import 'package:easy_search_bar/easy_search_bar.dart';
import 'package:circle_button/circle_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gym_app/AddExercise.dart';
import 'package:gym_app/colors.dart';
import 'package:gym_app/components.dart';
import 'package:gym_app/images.dart';
import 'package:quds_popup_menu/quds_popup_menu.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class ExistExercise extends StatefulWidget {
  @override
  _ExistExerciseState createState() => _ExistExerciseState();
}

class _ExistExerciseState extends State<ExistExercise> {
  String searchValue = '';
  final List<String> suggestions = [
    'warm ups',
    'exercises',
    'stretches'
  ];
  String suggestion = "warm ups";
  final panelController = PanelController();
  TextEditingController sets = TextEditingController();
  TextEditingController reps = TextEditingController();
  String val = '';

  @override
  Widget build(BuildContext context) {
    final closePanel = MediaQuery.of(context).size.height * 0;
    final openPanel = MediaQuery.of(context).size.height * .4;
    String dropDownValue = 'exercise type';


    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey,
          elevation: 0.0,
          leading: IconButton(
              onPressed: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (Context) => AddExercise()));
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.white,
                size: 30,
              )),
          title: Container(
            width: double.infinity,
            height: 40,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(5)),
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {},
                    ),
                    hintText: 'Search...',
                    border: InputBorder.none),
              ),
            ),
          ),
          actions: [
            QudsPopupButton(
                items: getMenuItems(),
                child: const Icon(Icons.filter_list,
                    color: Colors.white, size: 30))
          ],
        ),
        body: SlidingUpPanel(
          controller: panelController,
          maxHeight: openPanel,
          minHeight: closePanel,
          defaultPanelState: PanelState.CLOSED,
          body: Padding(
            padding: const EdgeInsets.all(10.0),
            child: AlignedGridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 5,
              crossAxisSpacing: 5,
              itemCount: 4,
              itemBuilder: (_, index) => Stack(
                alignment: Alignment.topRight,
                children: [
                  Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: BackgroundColors.inkWellBG),
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Image.asset(GymImages.gymBg),
                        ),
                        subTitleText(text: "text")
                      ],
                    ),
                  ),
                  CircleButton(
                    onTap: () {
                      (panelController.isPanelClosed)
                          ? panelController.open()
                          : panelController.close();
                    },
                    width: 30,
                    child: const Icon(Icons.add),
                    backgroundColor: Colors.blue,
                  )
                ],
              ),
            ),
          ),
          panelBuilder: (panelBuilder) => Container(
            decoration: const BoxDecoration(
                color: BackgroundColors.dialogBG,
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(30))),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  titleText(text: "Add exercise"),
                  Row(
                    children: [
                      subTitleText(text: "shoulder muscle"),
                    ],
                  ),
                  Row(
                    children: [
                      paragraphText(text: "Name"),
                    ],
                  ),
                  Row(
                    children: [
                      subTitleText(text: "Exercise type"),
                    ],
                  ),
                  Container(
                    color: BackgroundColors.whiteBG,
                    child: defaultDropDownMenu(
                        content: suggestions,
                        value: suggestion,
                        function: (value) {
                          setState(() {
                            suggestion = value!;
                          });
                        }),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width*.4,
                        color: BackgroundColors.whiteBG,
                        child: defaultTextFormField(
                          controller: sets,
                          hint: "Sets",
                          hintTexColor: TextColors.blackText,
                          textInputType: TextInputType.number,
                          textStyle: TextColors.blackText
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width*.4,
                        color: BackgroundColors.whiteBG,
                        child: defaultTextFormField(
                          controller: reps,
                          hint: "Reps",
                          hintTexColor: TextColors.blackText,
                          textStyle: TextColors.blackText,
                          textInputType: TextInputType.number
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        )
    );
  }

  List<QudsPopupMenuBase> getMenuItems() {
    List<Widget> gymTraining = [];
    return [
      QudsPopupMenuItem(
        title: const Text('barbells'),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddExercise()),
          );
        },
      ),
      QudsPopupMenuDivider(),
      QudsPopupMenuItem(
          title: const Text('dumbbells'),
          onPressed: () {
            // showToast('Feedback Pressed!');
          }),
      QudsPopupMenuDivider(),
      QudsPopupMenuItem(
          title: const Text('cables'),
          onPressed: () {
            // showToast('Feedback Pressed!');
          }),
      QudsPopupMenuDivider(),
      QudsPopupMenuItem(
          title: const Text('machines'),
          onPressed: () {
            // showToast('Feedback Pressed!');
          }),
      QudsPopupMenuDivider(),
      QudsPopupMenuItem(
          title: const Text('bodyweight'),
          onPressed: () {
            // showToast('Feedback Pressed!');
          }),
    ];
  }
}
