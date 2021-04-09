import 'dart:async';
class NumberModel {
	final numberController = StreamController<String>();
	final pinStreamController = StreamController<String>();
	bool isVisible = false;

	addData(String value) async {
		await Future.delayed(Duration(seconds: 0));
		String validation;
		if (value.length < 10) {
			isVisible = false;
			validation = 'Invalid Number';
		} else {
			isVisible = true;
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

}
