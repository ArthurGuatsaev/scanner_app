import 'package:flutter/material.dart';

const width = 3.0;
const shadows = [
  Shadow(
      // bottomLeft
      offset: Offset(-3.5, -3.5),
      color: Colors.black),
  Shadow(
      // bottomRight
      offset: Offset(3.5, -3.5),
      color: Colors.black),
  Shadow(
      // topRight
      offset: Offset(3.5, 3.5),
      color: Colors.black),
  Shadow(
      // topLeft
      offset: Offset(-3.5, 3.5),
      color: Colors.black),
];
const shadowsCustomBlack = [
  Shadow(
      // bottomLeft
      offset: Offset(-width, -width),
      color: Colors.black),
  Shadow(
      // bottomRight
      offset: Offset(width, -width),
      color: Colors.black),
  Shadow(
      // topRight
      offset: Offset(width, width),
      color: Colors.black),
  Shadow(
      // topLeft
      offset: Offset(-width, width),
      color: Colors.black),
];
const shadowsCustomRed = [
  Shadow(
      // bottomLeft
      offset: Offset(-width, -width),
      color: Color(0xff6F7680)),
  Shadow(
      // bottomRight
      offset: Offset(width, -width),
      color: Color(0xff6F7680)),
  Shadow(
      // topRight
      offset: Offset(1.5, 1.5),
      color: Color(0xff6F7680)),
  Shadow(
      // topRight
      offset: Offset(0, -3.5),
      color: Color(0xff6F7680)),
  Shadow(
      // topLeft
      offset: Offset(-1.6, 1.6),
      blurRadius: 5,
      color: Color(0xff6F7680)),
];
