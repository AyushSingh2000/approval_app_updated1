import 'package:dartz/dartz.dart';

import '../../../../core/failure.dart';
import '../model/login_model.dart';
import '../model/login_response.dart';

abstract class LoginDataSourceRepository {
  Future<Either<Failure, LoginResponseModel>> login(LoginModel loginModel);
  // Future<Either<Failure,LoginResponseModel>> login(LoginModel loginModel);
}
