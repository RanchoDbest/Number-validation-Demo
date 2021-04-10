import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'number_model.dart';

class ValidateNumber extends StatelessWidget {
	TextEditingController _numberController = TextEditingController();
	TextEditingController _pinController = TextEditingController();

	@override
	Widget build(BuildContext context) {
		return Consumer<NumberModel>(
			builder: (_, numberModel, child) =>
				MaterialApp(
					home: Scaffold(
						body: Center(
							child: Column(
								mainAxisAlignment: MainAxisAlignment.center,
								children: [
									TextField(
										controller: _numberController,
										maxLength: 10,
										decoration: InputDecoration(
											hintText: "Enter Number",
										),
										keyboardType: TextInputType.number,
										textInputAction: TextInputAction.next,
									),

									TextField(
										controller: _pinController,
										maxLength: 4,
										decoration: InputDecoration(
											hintText: "Enter PIN",
										),
										keyboardType: TextInputType
											.number,
										textInputAction: TextInputAction
											.next),

									ElevatedButton(
										onPressed: () =>
										[
											numberModel.addData(
												_numberController.text),
											numberModel.addPin(
												_pinController.text)
										],
										child: Text('Submit'),
									),

									StreamBuilder<bool>(
										initialData: false,
										stream: numberModel.numberController.stream,
										builder: (_, snap) {
											print(snap.data);
											return Visibility(
												visible: snap.data,
												child: Text('Invalid Number'),
											);
										}),

									StreamBuilder<bool>(
										initialData: false,
										stream: numberModel.pinStreamController.stream,
										builder: (_, snapshot) {
											return Visibility(child: Text(
												'Invalid PIN'),
												visible: snapshot.data,
											);
										}),
								]),
						),
					),
				),
		);
	}
}
