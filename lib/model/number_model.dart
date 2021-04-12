import 'dart:async';
import 'package:number_validation_demo/model/user_model.dart';
import 'package:rxdart/rxdart.dart';

class NumberModel {

	final BehaviorSubject<UserModel> _subject =  BehaviorSubject<UserModel>.seeded(UserModel(number: true,pin: false));

	bool isNumber = false;
	bool isPin = false;

	ValueStream<UserModel> get subject => _subject;

	addData(String value) async {
		if (value.length > 0 && value.length < 10) {
			isNumber = true;
		} else {
			isNumber = false;
		}
		_subject.value = UserModel(number: isNumber, pin: isPin);

	}

	addPin(String value) async {
		if (value.length > 0  && value.length < 4) {
			isPin = true;
		} else {
			isPin = false;
		}
		_subject.value = UserModel(number: isNumber, pin: isPin);
	}

}
