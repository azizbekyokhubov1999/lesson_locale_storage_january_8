import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:lesson_locale_storage_january_8/services/db_service.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int counter = 0;
  @override

  //As we know init state is beginning of our project that's why we should give
  // to it coming first value
  void initState() {
    getData();
    super.initState();
  }

  // In this function we try to get first data which is reading in getCounter()
  Future<void> getData() async {
    counter = await DBService.getCounter() ?? 0;
    setState(() {});
  }
  // It is time to write plus and minus functions
  void plus(){
    setState(() {
      counter++;
    });
  }
  void minus(){
    setState(() {
      counter--;
    });
  }

  // WE SHOULD ALSO WRITE CLEAR FUNCTION FOR CLEAR BUTTON
  void clear(){
    counter = 0 ;
   DBService.deleteCounter();
   setState(() {});
  }
  //AND ALSO WE SHOULD ADD SAVE BUTTON FUNCTION FOR SAVE LAST DATA
  Future<void> save(int enteredCounterValue) async{
   bool result = await DBService.setCunter(enteredCounterValue);
   log('message : $result');
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(counter.toString(), style: const TextStyle(fontSize: 30),
          ),
          const SizedBox(height: 100),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: (){
                  minus();
                },
                child:  const Text('-'),
              ),
              ElevatedButton(
                  onPressed: (){
                    clear();
                  },
                  child:  const Text('Clear'),
              ),
              ElevatedButton(
                  onPressed: (){
                    plus();
                  },
                  child: const Text('+'),
              ),
            ],
          ),
          ElevatedButton(
            onPressed: (){
              save(counter);
            },
            child:  const Text('save'),
          ),
        ],
      ),
    );
  }
}
