import 'package:dartz/dartz.dart';
import 'dart:convert';

import '../../../../API/URLConst.dart';
import '../../../../core/failure.dart';
import '../model/login_model.dart';
import '../model/login_response.dart';
import 'login_data_source_repository.dart';

import 'package:http/http.dart' as http;

const DEBUG = true;

class LoginDataSourceImpl implements LoginDataSourceRepository {
  @override
  Future<Either<Failure, LoginResponseModel>> login(LoginModel data) async {
    try {
      var response = await http.post(
        Uri.parse(URLConst.loginURL),
        body: data.toJson(),
      );

      print('${response.statusCode}');

      if (response.statusCode == 200 || response.statusCode == 202) {
        final jsonResponse = jsonDecode(response.body);
        final jsonDecoded = jsonResponse;
        LoginResponseModel loginResponseModel =
            LoginResponseModel.fromJson(jsonDecoded);
        return Right(loginResponseModel);
      }

      return Left(
          Failure(statusCode: response.statusCode, message: "Login Failed"));
    } catch (e) {
      print("Error in LoginDataSourceImpl login(LoginModel): \n $e");

      return Left(Failure(statusCode: 500, message: "Login Failed"));
    }
  }
}
