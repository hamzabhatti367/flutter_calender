import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';

class Calender extends StatefulWidget {
  const Calender({super.key});

  @override
  State<Calender> createState() => _CalenderState();
}

class _CalenderState extends State<Calender> {
  final datecontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calender'),
      ),
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              style: TextStyle(
                  //fontFamily: FontWeight.w300,
                  color: Colors.black,
                  fontSize: 16,
                  fontWeight: FontWeight.w400),
              onTap: () async {
                DateTime? pickeddate = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime(2100),
                    builder: (context, child) => Theme(
                          data: ThemeData().copyWith(
                            colorScheme: const ColorScheme.dark(
                              primary: Colors.amber,
                              surface: Colors.black,
                            ),
                            dialogBackgroundColor: Colors.black,
                          ),
                          child: child ?? const Text(""),
                        ));
                if (pickeddate != null) {
                  setState(() {
                    datecontroller.text =
                        DateFormat('dd-MM-yyyy').format(pickeddate);
          
                  });
                }
              },
              controller: datecontroller,
              //keyboardType: TextInputType.datetime,
              validator: (value) {
                return value!.isEmpty ? 'Enter Founding Date (year)' : null;
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 14, horizontal: 14),
                filled: true,
                fillColor: Colors.black38,
                hintText: 'Founding Date (year)',
                hintStyle: const TextStyle(
                  color: Colors.white,
                ),
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide(width: 5, color: Colors.amberAccent)),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(width: 1.5, color: Colors.cyan)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(width: 1.5, color: Colors.blueAccent)),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(width: 1.5, color: Colors.redAccent),
              ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
