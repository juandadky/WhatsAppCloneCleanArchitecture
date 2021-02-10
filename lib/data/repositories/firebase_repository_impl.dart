import 'package:whatsapp_clone_clean/data/datasource/firebase_remote_datasource.dart';
import 'package:whatsapp_clone_clean/domain/entities/user_entity.dart';
import 'package:whatsapp_clone_clean/domain/repositories/firebase_repository.dart';

class FirebaseRepositoryImpl implements FirebaseRepository{

  final FirebaseRemoteDataSource remoteDataSource;

  FirebaseRepositoryImpl({this.remoteDataSource});

  @override
  Future<void> getCreateCurrentUser(UserEntity user)async =>
    await remoteDataSource.getCreateCurrentUser(user);
  
    @override
    Future<String> getCurrentUID() async =>
      await remoteDataSource.getCurrentUID();
  
    @override
    Future<bool> isSignIn() async =>
      await remoteDataSource.isSignIn();
  
    @override
    Future<void> signInWithPhoneNumber(String smsPinCode) async =>
      await remoteDataSource.signInWithPhoneNumber(smsPinCode);
  
    @override
    Future<void> signOut() async =>
      await remoteDataSource.signOut();
  
    @override
    Future<void> verifyPhoneNumber(String phoneNumber) async =>
      await remoteDataSource.verifyPhoneNumber(phoneNumber);

}