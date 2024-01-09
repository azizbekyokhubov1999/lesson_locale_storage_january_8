import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DBService {

  //This future function help to us for saving data, now we simply set the data
  static Future<bool> setCunter(int enteredValue) async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
   return preferences.setInt('counter', enteredValue);
  }

  //Now it is time to read data
    static Future<int?> getCounter() async{
    SharedPreferences preferences = await SharedPreferences.getInstance();
    return preferences.getInt('counter');
  }

  //After saving and reading coming data, we can also delete this data
  // It is time to write delete function
  static Future deleteCounter() async{
  SharedPreferences preferences = await SharedPreferences.getInstance();
  preferences.remove('counter');
  }
}