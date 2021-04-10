import 'dart:async';

class NumberModel {
	final numberController = StreamController<bool>();
	final pinStreamController = StreamController<bool>();
	bool isNumber = false;
	bool isPin = false;

	addData(String value) async {
		if (value.length > 0 && value.length < 10) {
			isNumber = true;
		} else {
			isNumber = false;
		}
		numberController.add(isNumber);
		return null;
	}

	addPin(String value) async {
		if (value.length > 0  && value.length < 4) {
			isPin = true;
		} else {
			isPin = false;
		}
		pinStreamController.add(isPin);
		return null;
	}

}
