import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../core/services/profile_image_index_storage.dart';

class SelectedProfileNotifier extends StateNotifier<int?> {
  final ProfileImageIndexStorage _profileImageIndexStorage;

  SelectedProfileNotifier(this._profileImageIndexStorage) : super(null) {
    _loadInitialProfileIndex();
  }

  Future<void> _loadInitialProfileIndex() async {
    final index = await _profileImageIndexStorage.getProfileIndex();
    state = index ?? 0;
  }

  void selectProfile(int index) {
    state = index;
    _profileImageIndexStorage.setProfileIndex(index);
  }

  void resetSelection() {
    state = null;
    _profileImageIndexStorage.removeProfileIndex();
  }
}

final selectedProfileProvider = StateNotifierProvider<SelectedProfileNotifier, int?>(
      (ref) {
    final profileImageIndexStorage = ProfileImageIndexStorage();
    return SelectedProfileNotifier(profileImageIndexStorage);
  },
);
