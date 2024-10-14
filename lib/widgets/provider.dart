import 'package:flutter/cupertino.dart';
import 'package:pet_adopt/models/user_models.dart';

class UserProvider extends InheritedWidget {
  final Widget child;
  List<UserModels> users = [];

  UserProvider({
    required this.child,
  }) : super(child: child);

  static UserProvider? of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<UserProvider>();
  }

  bool updateShouldNotify(UserProvider Widget) {
    return true;
  }
}
