import 'package:whatsapp_clone_clean/domain/repositories/firebase_repository.dart';

class SigninWithPhoneNumberUseCase{
  final FirebaseRepository repository;

  SigninWithPhoneNumberUseCase({this.repository});

  Future<void> call(String smsPinCode) async{
    return await repository.signInWithPhoneNumber(smsPinCode);
  }
}