import 'package:email_validator/email_validator.dart';
import 'package:explore_pc/constant/messagevalid.dart';

vaildInput(String val, int min, int max) {
  if (val.isEmpty) {
    return "$MessageInputEmpty";
  }
  if (val.length > max) {
    return "$MessageInputMax  $max";
  }
  if (val.length < min) {
    return "$MessageInputMin  $min";
  }
}

vaildInputemail(String val, int min, int max) {
  if (val.isEmpty) {
    return "$MessageInputEmpty";
  }
  if (val.length > max) {
    return "$MessageInputMax  $max";
  }
  if (val.length < min) {
    return "$MessageInputMin  $min";
  }
  if (!EmailValidator.validate(val)) {
    return "$MessageInputemail  $val";
  }
}
