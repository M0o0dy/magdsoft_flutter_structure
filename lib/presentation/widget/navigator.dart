import 'package:flutter/material.dart';

void navigateTo(context, widget) => Navigator.push(
    context, MaterialPageRoute(builder: (BuildContext context) => widget));

void navigateAndFinishTo(context, widget) => Navigator.pushReplacement(
  context, MaterialPageRoute(builder: (BuildContext context) => widget),);