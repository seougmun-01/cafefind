import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:firebase_auth/firebase_auth.dart';

final ownerLoginProvider =
NotifierProvider<OwnerLoginNotifier, AsyncValue<void>>(OwnerLoginNotifier.new);

class OwnerLoginNotifier extends Notifier<AsyncValue<void>> {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  @override
  AsyncValue<void> build() => const AsyncData(null);

  Future<void> login(String email, String password) async {
    state = const AsyncLoading();
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      state = const AsyncData(null);
    } on FirebaseAuthException catch (e) {
      state = AsyncError(e.message ?? '로그인 실패', StackTrace.current);
    }
  }
}
