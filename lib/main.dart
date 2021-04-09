import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'number_model.dart';

void main() {
	runApp(ValidateNumber());
}

class ValidateNumber extends StatelessWidget {
	TextEditingController _numberController = TextEditingController();
	TextEditingController _pinController = TextEditingController();

	@override
	Widget build(BuildContext context) {
		return Provider<NumberModel>(
			create: (context) => NumberModel(),
			child: MaterialApp(
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

								Container(
									child: Consumer<NumberModel>(
										builder: (context, numberModel, _) {
											return StreamBuilder(
												stream: numberModel
													.numberController.stream,
												builder: (_, snap) {
													return StreamBuilder<
														String>(
														stream: numberModel
															.pinStreamController
															.stream,
														initialData: '',
														builder: (context,
															snapshot) {
															print(snapshot.data
																.toString());
															print(
																"Invalid nuber:" +
																	snap.data
																		.toString());
															print(snap.data
																.toString());
															return Column(
																children: [
																	snap.data ==
																		'Invalid Number'
																		? Visibility(
																		child: Text(
																			'Invalid Input',
																			style: TextStyle(
																				fontSize: 20,
																				color: Colors
																					.red),
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
																		visible: numberModel.isVisible),
																	snapshot
																		.data ==
																		'Invalid PIN'
																		? Text(
																		'Invalid Pin',
																		style: TextStyle(
																			fontSize: 20,
																			color: Colors
																				.red),)
																		: Visibility(
																		child: Text(
																			'Valid PIN'),
																		visible: false),
																	ElevatedButton(
																		onPressed: () {
																			if (_numberController
																				.text
																				.length >
																				0) {
																				numberModel
																					.addData(
																					_numberController
																						.text);
																				print(
																					'pin number');
																			}
																			if (_pinController
																				.text
																				.length >
																				0) {
																				numberModel
																					.addPin(
																					_pinController
																						.text);
																				print(
																					'pin add');
																			}
																		},
																		child: Text(
																			'Submit'),
																	),
																],
															);
														}
													);
												}
											);
										}
									),
								),

							]),

					),
				),
			),
		);
	}
}
