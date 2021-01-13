import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FireBaseItem {
  String title;
  String itemId;
  double price;
  bool containHeal;
  double size;
  String cookingLevel;

  FireBaseItem({
    this.title,
    this.itemId,
    this.price,
    this.containHeal,
    this.size,
    this.cookingLevel,
  });
}

class UserItem {
  InkWell image;
  String title;
  String itemId;
  double price;
  bool containHeal;
  double size;
  Column cookingLevels;
  CheckboxListTile dep;

  UserItem({
    this.price,
    this.dep,
    this.image,
    this.title,
    this.containHeal,
    this.cookingLevels,
    this.itemId,
    this.size,
  });
}
