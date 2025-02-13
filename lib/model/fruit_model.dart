// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class FruitModel {
  final String name;
  String get image => 'assets/images/$name.png';
  final bool status;
  final Offset offset;
  final int index;

  FruitModel({
    required this.name,
    required this.status,
    required this.offset,
    this.index = 0,
  });

  FruitModel copyWith({
    String? name,
    bool? status,
    Offset? offset,
    int? index,
  }) {
    return FruitModel(
      name: name ?? this.name,
      status: status ?? this.status,
      offset: offset ?? this.offset,
      index: index ?? this.index,
    );
  }

  @override
  bool operator ==(covariant FruitModel other) {
    if (identical(this, other)) return true;

    return other.name == name && other.index == index;
  }

  @override
  int get hashCode => name.hashCode ^ status.hashCode ^ offset.hashCode;
}

final fullFruit = [
  FruitModel(name: 'bananas', offset: const Offset(100, 200), status: true),
  FruitModel(
      name: 'bananas', offset: const Offset(200, 300), status: true, index: 1),
  FruitModel(name: 'grusha', offset: const Offset(250, 300), status: true),
  FruitModel(
      name: 'grusha', offset: const Offset(280, 250), status: true, index: 1),
  FruitModel(name: 'grusha2', offset: const Offset(180, 250), status: true),
  FruitModel(
      name: 'grusha2', offset: const Offset(300, 300), status: true, index: 1),
  FruitModel(name: 'apple', offset: const Offset(0, 0), status: true),
  FruitModel(name: 'apple', offset: const Offset(0, 0), status: true, index: 1),
  FruitModel(name: 'arbuz', offset: const Offset(0, 0), status: true),
  FruitModel(name: 'arbuz', offset: const Offset(0, 0), status: true, index: 1),
  FruitModel(name: 'arbuz2', offset: const Offset(0, 0), status: true),
  FruitModel(
      name: 'arbuz2', offset: const Offset(0, 0), status: true, index: 1),
  FruitModel(name: 'berry', offset: const Offset(0, 0), status: true),
  FruitModel(name: 'berry', offset: const Offset(0, 0), status: true, index: 1),
  FruitModel(name: 'klubnika', offset: const Offset(0, 0), status: true),
  FruitModel(
      name: 'klubnika', offset: const Offset(0, 0), status: true, index: 1),
  FruitModel(name: 'malina', offset: const Offset(0, 0), status: true),
  FruitModel(
      name: 'malina', offset: const Offset(0, 0), status: true, index: 1),
  FruitModel(name: 'lemon', offset: const Offset(0, 0), status: true),
  FruitModel(name: 'lemon', offset: const Offset(0, 0), status: true, index: 1),
  FruitModel(name: 'vinograd', offset: const Offset(0, 0), status: true),
  FruitModel(
      name: 'vinograd', offset: const Offset(0, 0), status: true, index: 1),
  FruitModel(name: 'persik', offset: const Offset(0, 0), status: true),
  FruitModel(
      name: 'persik', offset: const Offset(0, 0), status: true, index: 1),
  FruitModel(name: 'granat', offset: const Offset(0, 0), status: true),
  FruitModel(
      name: 'granat', offset: const Offset(0, 0), status: true, index: 1),
  FruitModel(name: 'granat2', offset: const Offset(0, 0), status: true),
  FruitModel(
      name: 'granat2', offset: const Offset(0, 0), status: true, index: 1),
  FruitModel(name: 'kiwi', offset: const Offset(0, 0), status: true),
  FruitModel(name: 'kiwi', offset: const Offset(0, 0), status: true, index: 1),
  FruitModel(name: 'orange', offset: const Offset(0, 0), status: true),
  FruitModel(
      name: 'orange', offset: const Offset(0, 0), status: true, index: 1),
  FruitModel(name: 'mango', offset: const Offset(0, 0), status: true),
  FruitModel(name: 'mango', offset: const Offset(0, 0), status: true, index: 1),
  FruitModel(name: 'purple', offset: const Offset(0, 0), status: true),
  FruitModel(
      name: 'purple', offset: const Offset(0, 0), status: true, index: 1),
];
