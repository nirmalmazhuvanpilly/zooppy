import 'package:flutter/material.dart';
import 'package:zooppy/services/home_api.dart';

// ignore: must_be_immutable
class EditStatePopUp extends StatefulWidget {
  final BuildContext context;
  var states;
  EditStatePopUp({this.context, this.states});

  @override
  _EditStatePopUpState createState() => _EditStatePopUpState();
}

class _EditStatePopUpState extends State<EditStatePopUp> {
  String _chosenValue;
  var _stateValue;
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration.zero, () => showEditState(context, widget.states));
    return Container();
  }

  void showEditState(BuildContext context, var states) async {
    // print(states);
    // print(states.runtimeType);

    AlertDialog editState = AlertDialog(
      actions: <Widget>[
        Container(
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: DropdownButton<String>(
                      focusColor: Colors.white,
                      value: _chosenValue,
                      style: TextStyle(color: Colors.black),
                      iconEnabledColor: Colors.black,
                      underline: Container(),
                      isExpanded: true,
                      hint: Text("Select State"),
                      items:
                          states.map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          _chosenValue = value;
                          //To avoid rebuilding of Alert Dialog
                          Navigator.of(context).pop();
                        });
                      },
                    ),
                  ),
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Colors.green,
                    textStyle: TextStyle(color: Colors.white),
                  ),
                  child: Text("Save"),
                  onPressed: _updateState,
                )
              ],
            ),
          ),
        ),
      ],
    );

    showDialog(
        context: context,
        builder: (BuildContext context) {
          return editState;
        });
  }

  void _updateState() async {
    _stateValue = _chosenValue;
    var editStateApi;
    // print(_stateValue);

    if (_stateValue == null) {
      print("Select State");
    } else {
      editStateApi = await HomeAPI().updateProfileState(_stateValue);
      if (editStateApi['success']) {
        print("State Updates");
        Navigator.of(context).pop();
      }
    }
  }
}
