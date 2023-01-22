import 'package:my_chat_app/res/app_constants.dart';

import '../../models/user_model.dart';

class UserServices {
  static Future<void> createUser(UserModel userModel) async {
    await AppConstants.usersCollection
        .doc(userModel.uid)
        .set(userModel.toMap());
  }
}
