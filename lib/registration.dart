import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'number_model.dart';

class ValidateNumber extends StatelessWidget {
	TextEditingController _numberController = TextEditingController();
	TextEditingController _pinController = TextEditingController();

	@override
	Widget build(BuildContext context) {
		return Consumer<NumberModel>(
			builder: (_, numberModel, __) =>
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

									StreamBuilder<bool>(
										initialData: true,
										stream: numberModel.numberController.stream,
										builder: (_, snap) {
											print(snap.data);
											return Visibility(
												child: Text('Enter Valid Number'),
												visible: snap.data,
												replacement: TextField(
													controller: _pinController,
													maxLength: 4,
													decoration: InputDecoration(
														hintText: "Enter PIN",
													),
													keyboardType: TextInputType.number,
													textInputAction: TextInputAction.next),
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

									ElevatedButton(
										onPressed: () =>
										[
											numberModel.addData(_numberController.text),
											numberModel.addPin(_pinController.text)
										],
										child: Text('Submit'),
									),
								]),
						),
					),
				),
		);
	}


}
