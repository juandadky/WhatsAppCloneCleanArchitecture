import 'package:whatsapp_clone_clean/domain/entities/user_entity.dart';
import 'package:whatsapp_clone_clean/domain/repositories/firebase_repository.dart';

class GetCreateCurrentUserUseCase{
  final FirebaseRepository repository;

  GetCreateCurrentUserUseCase({this.repository});

  Future<void> call(UserEntity user) async{
    return await repository.getCreateCurrentUser(user);
  }
}