import 'models/user.dart';

class Global{
  static User? user;//current user of app after login

  static void clearData(){
    user = null;
  }
}