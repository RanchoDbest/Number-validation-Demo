import 'dart:async';
import 'package:flutter/material.dart';

void main() {
	runApp(ValidateNumber());
}

class ValidateNumber extends StatelessWidget {
	TextEditingController _numberController = TextEditingController();
	TextEditingController _pinController = TextEditingController();
	bool isVisible = false;

	final numberController = StreamController<String>();
	final pinStreamController = StreamController<String>();

	addData(String value) async {
		await Future.delayed(Duration(seconds: 0));
		String validation;
		if (value.length < 10) {
			validation = 'Invalid Number';
		} else {
			validation = 'Valid Number';
		}
		numberController.add(validation);
		return null;
	}

	addPin(String value) async {
		await Future.delayed(Duration(seconds: 0));
		String pin;
		if (value.length < 4) {
			pin = 'Invalid PIN';
		} else {
			pin = 'Valid PIN';
		}
		pinStreamController.add(pin);
		return null;
	}

	@override
	Widget build(BuildContext context) {
		return MaterialApp(
			home: Scaffold(
				body: Center(
					child: Column(
						mainAxisAlignment: MainAxisAlignment.center, children: [
						TextField(
							controller: _numberController,
							maxLength: 10,
							decoration: InputDecoration(
								hintText: "Enter Number",
							),
							keyboardType: TextInputType.number,
							textInputAction: TextInputAction.next,
						),
						StreamBuilder(
							stream: numberController.stream,
							initialData: '',
							builder: (context, snap) {
								return StreamBuilder<String>(
									stream: pinStreamController.stream,
									initialData: '',
									builder: (context, snapshot) {
										print(snapshot.data.toString());
										print("Invalid nuber:" +
											snap.data.toString());
										return Column(children: [
											snap.data == 'Invalid Number'
												? Visibility(
												child: Text(
													'Invalid Input',
													style: TextStyle(
														fontSize: 20,
														color: Colors.red),
												),
												visible: true)
												: Visibility(
												child: TextField(
													controller: _pinController,
													maxLength: 4,
													decoration: InputDecoration(
														hintText: "Enter PIN",
													),
													keyboardType: TextInputType
														.number,
													textInputAction: TextInputAction
														.next),
												visible: true),
											snapshot.data == 'Invalid PIN' ? Text(
												'Invalid Pin') :
											Visibility(
												child: Text('Valid PIN'),
												visible: true),

										]);
									});
							},
						),
						ElevatedButton(
							onPressed: () {
								if (_numberController.text.length > 0) {
									addData(_numberController.text);
									print('pin number');
								}
								if (_pinController.text.length > 0) {
									addPin(_pinController.text);
									print('pin add');
								}
							},
							child: Text('Submit'),
						)
					]),
				),
			),
		);
	}
}
