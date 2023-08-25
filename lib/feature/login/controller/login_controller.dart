import 'package:get/get.dart';
import 'package:new_app/core/post_enum_response.dart';
import 'package:new_app/feature/login/data/datasource/login_data_source_impl.dart';
import 'package:new_app/feature/login/data/model/login_model.dart';
import 'package:new_app/feature/login/data/model/login_response.dart';

const DEBUG = true;

class LoginController extends GetxController {
  LoginDataSourceImpl loginDataSourceImpl = LoginDataSourceImpl();
  var pageNumber = 0.obs;
  RxBool password_visible = true.obs;

  var companyDB = "";
  var username = "";
  var password = "";
  var databaseList = <String>[].obs;
  var loginLoading = false.obs;

  void toggleVisiblity() {
    password_visible.value = !password_visible.value;
  }

  Future<PostResponseType> login() async {
    loginLoading.value = true;

    LoginModel data = LoginModel(
        CompanyDB: companyDB, UserName: username, Password: password);

    if (DEBUG) {
      print('sending \n ${data.toJson()}');
    }
    var res = await loginDataSourceImpl.login(data);

    // ignore: unused_local_variable
    LoginResponseModel? loginResponseModel;
    PostResponseType loginPostResponse =
        PostResponseType(postResponseEnum: PostResponseEnum.error);

    res.fold((failure) {
      if (DEBUG) {
        print('failure in postLogin: ${failure.message}');
      }

      loginPostResponse =
          PostResponseType(postResponseEnum: PostResponseEnum.error);
    }, (res) {
      loginPostResponse =
          PostResponseType(postResponseEnum: PostResponseEnum.success);
      loginResponseModel = res;

      for(CompanyList list in res.companyList!){
        databaseList.value.add(list.databaseList!);
      }

      if (DEBUG) {
        print("From login Controller");
        print(databaseList);
      }
    });

    loginLoading.value = false;
    return loginPostResponse;
  }
}
