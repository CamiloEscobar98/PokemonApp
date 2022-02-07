import 'package:pokemon_ipt/config/preferences.dart';
import 'package:pokemon_ipt/services/auth/profile_service.dart';
import 'package:pokemon_ipt/view-models/vm/user_profile.dart';

class ProfileViewModel {
  final _prefs = UserPreferences();
  Future<UserProfileVM?> getProfile() async {
    final userResponse =
        await ProfileService().getProfile(token: _prefs.getRememberToken);

    if (userResponse != null) {
      return UserProfileVM(user: userResponse);
    } else {
      return null;
    }
  }

  Future<bool> updateProfile({required UserProfileVM userVM}) async {
    final updateResponse = await ProfileService()
        .updateProfile(token: _prefs.getRememberToken, user: userVM.user);

    return updateResponse;
  }
}
