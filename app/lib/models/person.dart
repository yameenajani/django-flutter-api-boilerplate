import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class Person {
  int id, age;
  String name, contact, email;

  Person({this.id, this.name, this.age, this.email, this.contact});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
        id: json['id'],
        name: json['name'],
        age: json['age'],
        email: json['email'],
        contact: json['contact']);
  }
}
