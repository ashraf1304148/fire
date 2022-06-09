import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  String? birthDay, email, name, phone, id,password;
  bool? gender;

  UserModel.fromJson(Map<String, dynamic> json) {
    this.birthDay = json['birth_day'];
    this.email = json['email'];
    this.name = json['name'];
    this.password = json['password'];
    this.phone = json['phone'];

    this.gender = json['gender'];
  }
  UserModel.fromDocumentSnapshot(DocumentSnapshot document) {
    this.id = document.id;
    this.birthDay = document['birth_day'];
    this.email = document['email'];
    this.name = document['name'];
    this.phone = document['phone'];
    this.password = document['password'];

    this.gender = document['gender'];
  }
  UserModel.fromQueryDocumentSnapshot(QueryDocumentSnapshot document) {
    this.id = document.id;
    this.birthDay = document['birth_day'];
    this.email = document['email'];
    this.name = document['name'];
    this.phone = document['phone'];
    this.password = document['password'];

    this.gender = document['gender'];
  }

  Map<String, dynamic> toJson() {
    Map<String, dynamic> json = {};

    json['birth_day'] = this.birthDay;
    json['email'] = this.email;
    json['name'] = this.name;
    json['phone'] = this.phone;
    json['gender'] = this.gender;
    json['password'] = this.password;

    return json;
  }
}
