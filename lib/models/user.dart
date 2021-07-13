import 'package:flutter/foundation.dart';
import 'user.dart';
import 'user.dart';
import 'String.dart';

@immutable
class User {

  const User({
    required this.name,
    required this.father,
    required this.friends,
    required this.keywords,
    required this.age,
  });

  final String name;
  final User father;
  final List<User> friends;
  final List<String> keywords;
  final int age;

  factory User.fromJson(Map<String,dynamic> json) => User(
    name: json['name'] as String,
    father: User.fromJson(json['father'] as Map<String, dynamic>),
    friends: (json['friends'] as List? ?? []).map((e) => User.fromJson(e as Map<String, dynamic>)).toList(),
    keywords: (json['keywords'] as List? ?? []).map((e) => e as String).toList(),
    age: json['age'] as int
  );
  
  Map<String, dynamic> toJson() => {
    'name': name,
    'father': father.toJson(),
    'friends': friends.map((e) => e.toJson()).toList(),
    'keywords': keywords.map((e) => e.toString()).toList(),
    'age': age
  };

  User clone() => User(
    name: name,
    father: father.clone(),
    friends: friends.map((e) => e.clone()).toList(),
    keywords: keywords.toList(),
    age: age
  );


  User copyWith({
    String? name,
    User? father,
    List<User>? friends,
    List<String>? keywords,
    int? age
  }) => User(
    name: name ?? this.name,
    father: father ?? this.father,
    friends: friends ?? this.friends,
    keywords: keywords ?? this.keywords,
    age: age ?? this.age,
  );

  @override
  bool operator ==(Object other) => identical(this, other)
    || other is User && name == other.name && father == other.father && friends == other.friends && keywords == other.keywords && age == other.age;

  @override
  int get hashCode => name.hashCode ^ father.hashCode ^ friends.hashCode ^ keywords.hashCode ^ age.hashCode;
}
