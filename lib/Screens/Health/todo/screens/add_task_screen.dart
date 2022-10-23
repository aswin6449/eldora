import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../helpers/database_helper.dart';
import '../models/task_model.dart';

class AddTaskScreen extends StatefulWidget {
  final Function? updateTaskList;
  final Task? task;

  AddTaskScreen({this.updateTaskList, this.task});

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController timeinput = TextEditingController();
  String? _title = "";
  String? _priority = "Low";
  DateTime? _date = DateTime.now();
  TextEditingController _dateController = TextEditingController();
  final DateFormat _dateFormatter = DateFormat('MMM dd, yyyy');
  final List<String> _priorities = ["Low", "Medium", "High"];

  _handleDatePicker() async {
    final DateTime? date = await showDatePicker(
        context: context,
        initialDate: _date!,
        firstDate: DateTime(2000),
        lastDate: DateTime(2050));
    if (date != null && date != _date) {
      setState(() {
        _date = date;
      });
      _dateController.text = _dateFormatter.format(date);
    }
  }

  _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      print('$_title, $_priority, $_date');

      // Insert Task to Users Database
      Task task = Task(title: _title, date: _date, priority: _priority);
      if (widget.task == null) {
        task.status = 0;
        DatabaseHelper.instance.insertTask(task);
      } else {
        // Update Task to Users Database
        task.id = widget.task!.id;
        task.status = widget.task!.status;
        DatabaseHelper.instance.updateTask(task);
      }

      widget.updateTaskList!();
      Navigator.pop(context);
    }
  }

  _delete() {
    DatabaseHelper.instance.deleteTask(widget.task!.id);
    widget.updateTaskList!();
    Navigator.pop(context);
  }

  @override
  void initState() {
    timeinput.text = "";
    super.initState();
    _dateController.text = _dateFormatter.format(_date!);

    if (widget.task != null) {
      _title = widget.task!.title;
      _priority = widget.task!.priority;
      _date = widget.task!.date;
    }
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 80.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GestureDetector(
                  onTap: () => Navigator.pop(context),
                  child: Icon(
                    Icons.arrow_back_ios,
                    size: 30,
                    color: Color(0xFF200B4B),
                  ),
                ),
                SizedBox(
                  height: 20.0,
                ),
                Text(
                  widget.task == null ? 'Add Reminder' : 'Update Remainder',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: 10.0,
                ),
                Form(
                  key: _formKey,
                  child: Column(
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: TextFormField(
                          style: TextStyle(fontSize: 18),
                          decoration: InputDecoration(
                              labelText: 'Title',
                              labelStyle: TextStyle(fontSize: 18),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                          validator: (input) => input!.trim().isEmpty
                              ? 'Please Enter a Reminder Title'
                              : null,
                          onSaved: (input) => _title = input,
                          initialValue: _title,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: TextFormField(
                          readOnly: true,
                          controller: _dateController,
                          style: TextStyle(fontSize: 18),
                          onTap: _handleDatePicker,
                          decoration: InputDecoration(
                              labelText: 'Date',
                              labelStyle: TextStyle(fontSize: 18),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0))),
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(vertical: 20),
                      //   child: DropdownButtonFormField(
                      //     isDense: true,
                      //     icon: Icon(Icons.arrow_drop_down_circle),
                      //     iconSize: 22.0,
                      //     iconEnabledColor: Theme.of(context).primaryColor,
                      //     style: TextStyle(fontSize: 18),
                      //     decoration: InputDecoration(
                      //         labelText: 'Priority',
                      //         labelStyle: TextStyle(fontSize: 18),
                      //         border: OutlineInputBorder(
                      //             borderRadius: BorderRadius.circular(10.0))),
                      //     validator: (dynamic input) => input.toString().trim().isEmpty
                      //         ? 'Please Select a Priority Level'
                      //         : null,
                      //     // onSaved: (input) => _priority = input.toString(),
                      //     items: _priorities.map((String priority) {
                      //       return DropdownMenuItem(
                      //           value: priority,
                      //           child: new Text(
                      //             priority,
                      //             style: TextStyle(
                      //                 color: Colors.black, fontSize: 18.0),
                      //           ));
                      //     }).toList(),
                      //     onChanged: (dynamic newValue) {
                      //       print(newValue.runtimeType);
                      //       setState(() {
                      //         _priority = newValue.toString();
                      //       });
                      //     },
                      //     // value : _priority
                      //   ),
                      // ),
                      Container(
                          height:80,
                          child:Center(
                              child:TextField(
                                controller: timeinput, //editing controller of this TextField
                                decoration: InputDecoration(
                                    icon: Icon(Icons.timer), //icon of text field
                                    labelText: "Enter Time" //label text of field
                                ),
                                readOnly: true,  //set it true, so that user will not able to edit text
                                onTap: () async {
                                  TimeOfDay? pickedTime =  await showTimePicker(
                                    initialTime: TimeOfDay.now(),
                                    context: context,
                                  );

                                  if(pickedTime != null ){
                                    print(pickedTime.format(context));   //output 10:51 PM
                                    DateTime parsedTime = DateFormat.jm().parse(pickedTime.format(context).toString());
                                    //converting to DateTime so that we can further format on different pattern.
                                    print(parsedTime); //output 1970-01-01 22:53:00.000
                                    String formattedTime = DateFormat('HH:mm:ss').format(parsedTime);
                                    print(formattedTime); //output 14:59:00
                                    //DateFormat() is from intl package, you can format the time on any pattern you need.

                                    setState(() {
                                      timeinput.text = formattedTime; //set the value of text field.
                                    });
                                  }else{
                                    print("Time is not selected");
                                  }
                                },
                              )
                          )
                      ),

                      Container(
                        margin: EdgeInsets.symmetric(vertical: 20.0),
                        height: 60.0,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: Color(0xFF200B4B),
                            borderRadius: BorderRadius.circular(30.0)),
                        child: TextButton(
                          onPressed: _submit,
                          child: Text(
                            widget.task == null ? 'Add' : 'Update',
                            style:
                                TextStyle(color: Colors.white, fontSize: 20.0),
                          ),
                        ),
                      ),
                      widget.task != null
                          ? Container(
                              margin: EdgeInsets.symmetric(vertical: 20.0),
                              height: 60.0,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                  color: Theme.of(context).primaryColor,
                                  borderRadius: BorderRadius.circular(30.0)),
                              child: TextButton(
                                onPressed: _delete,
                                child: Text(
                                  'Delete',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 20.0),
                                ),
                              ),
                            )
                          : SizedBox.shrink(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
