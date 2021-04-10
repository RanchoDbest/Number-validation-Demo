import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'number_model.dart';
import 'registration.dart';

void main() {
	runApp(MyApp());
}


class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) => Provider<NumberModel>(
	    create:(_) => NumberModel(),
	  child: ValidateNumber());
}
