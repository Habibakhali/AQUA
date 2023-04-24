import 'package:project/API/Models/Student/me_jwt.dart';
import 'package:project/API/Models/Student/post_acadimic_registration.dart';
import 'package:project/API/Models/Student/registeration_form_model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'Models/Student/academic_registry_api.dart';
import 'Models/Student/forget_pass_student.dart';
import 'Models/Student/get_registeration_forn.dart';
import 'Models/Student/login_student_api.dart';
import 'Models/Student/pincode_forgetpass_student.dart';
import 'Models/Student/register.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Models/Student/otp_student_api.dart';
import 'Models/Student/resend_otp_student_api.dart';
import 'Models/Student/reset_forget_pass_student.dart';

class ApiManager{
  static String base='aqua.larasci.site';
  static Future<Register> postRegisterStud(String userName, String email, String pass, String confi_pass) async {
    var URL = Uri.https(base, '/api/auth/register');
    http.Response signUp = await http.post(
      URL,
      headers:{
        "Accept": "application/json",
        "Content-Type": "application/json"
      } ,
      body: jsonEncode({
            "name": userName,
            "email": email,
            "password": pass,
            "password_confirmation": confi_pass,
          }),);
    var json = jsonDecode(signUp.body) ;
    print("----------------------------------------> StatusCode ${signUp.statusCode}");
    print("----------------------------------------> json ${json}");
    var res = Register.fromJson(json);

    return res;
  }
  static Future<Register> postRegisterGrd(String userName, String email, String pass, String confi_pass) async {
    var URL = Uri.https(base, '/api/grad/auth/register');
    http.Response signUp = await http.post(
      URL,
      headers:{
        "Accept": "application/json",
        "Content-Type": "application/json"
      } ,
      body: jsonEncode({
            "name": userName,
            "email": email,
            "password": pass,
            "password_confirmation": confi_pass,
          }),);
    var json = jsonDecode(signUp.body) ;
    print("----------------------------------------> statusCode ${signUp.statusCode}");
    print("----------------------------------------> json ${json}");
    var res = Register.fromJson(json);
    return res;
  }
  static Future<ApiOtpStudent> otpVstudent(String o)async{
    var uri=Uri.https(base,'/api/auth/verifyOtp');
    http.Response otp=await http.post(uri,
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/json"
    },
      body:jsonEncode({
        "otp":o,
      })
    );
    print("=================================================>statusCode${otp.statusCode}");
    var json = jsonDecode(otp.body);
    print("----------------------------------------> json ${json}");
    var res = ApiOtpStudent.fromJson(json);
    return res;
  }
  static Future<ApiOtpStudent> otpVGrd(String o)async{
    var uri=Uri.https(base,'/api/grad/auth/verifyOtp');
    http.Response otp=await http.post(uri,
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/json"
    },
      body:jsonEncode({
        "otp":o,
      })
    );
    print("=================================================>statusCode${otp.statusCode}");
    var json = jsonDecode(otp.body);
    print("----------------------------------------> json ${json}");
    var res = ApiOtpStudent.fromJson(json);
    return res;
  }
  static Future<ResendOtpStudentApi> resendOtpStudent(String email)async{
    var url=Uri.https(base,'/api/auth/resendOtp');
    http.Response res=await http.post(url,headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",},
        body:jsonEncode({
        "email":email
        }));
    print ('=================================> ${res.statusCode}');
    var json=jsonDecode(res.body);
    var r=ResendOtpStudentApi.fromJson(json);
    return r;
  }
  static Future<ResendOtpStudentApi> resendOtpGrd(String email)async{
    var url=Uri.https(base,'/api/grad/auth/resendOtp');
    http.Response res=await http.post(url,headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",},
        body:jsonEncode({
        "email":email
        }));
    print ('=================================> ${res.statusCode}');
    var json=jsonDecode(res.body);
    var r=ResendOtpStudentApi.fromJson(json);
    return r;
  }
  static Future<LoginStudentApi> loginStudent(String email,String password)async{
    final pref=await SharedPreferences.getInstance();
    var url=Uri.https(base,'/api/auth/login');
    http.Response res=await http.post(url,
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/json"
    },
      body: jsonEncode({
        "email":email,
        "password":password,
      })
    );
    var json=jsonDecode(res.body);
var r=LoginStudentApi.fromJson(json);
pref.setString('token', r.accessToken!);
pref.setString('email', email);
pref.setString('password', password);
return r;
  }
  static Future<LoginStudentApi> loginGrd(String email,String password)async{
    var url=Uri.https(base,'/api/grad/auth/login');
    http.Response res=await http.post(url,
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/json"
    },
      body: jsonEncode({
        "email":email,
        "password":password,
      })
    );
    print('---------------->${res.statusCode}');
    print('---------------->${res.body}');
    var json=jsonDecode(res.body);
var r=LoginStudentApi.fromJson(json);
return r;
  }
  //to know account which i send code to this
  static Future<ForgetPassStudent> RequestCodeToForgetPassStudent(String email)async{
    var url=Uri.https(base,'/api/auth/requestPinCode');
    http.Response res=await http.post(url,
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/json"
    },
      body: jsonEncode({
        "email":email
      })
    );
    var json=jsonDecode(res.body);
    print('------------------------------>${res.statusCode}');
    print('------------------------------>${res.body}');
    var r=ForgetPassStudent.fromJson(json);
    return r;
  }
  static Future<ForgetPassStudent> RequestCodeToForgetPassGrd(String email)async{
    var url=Uri.https(base,'/api/grad/auth/requestPinCode');
    http.Response res=await http.post(url,
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/json"
    },
      body: jsonEncode({
        "email":email
      })
    );
    var json=jsonDecode(res.body);
    print('------------------------------>${res.statusCode}');
    print('------------------------------>${res.body}');
    var r=ForgetPassStudent.fromJson(json);
    return r;
  }
  static Future<PincodeToForgertPStudent> ConfirmCodeForgetPassStudent(String code)async{
    var url=Uri.https(base,'/api/auth/confirmPIN');
    http.Response res=await http.post(url,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
      body: jsonEncode({
        "pincode":code
      })
    );
    var json=jsonDecode(res.body);
    print('----------------------------------->${res.statusCode}');
    print('----------------------------------->${res.body}');
    var r =PincodeToForgertPStudent.fromJson(json);
    return r;
  }
  static Future<PincodeToForgertPStudent> ConfirmCodeForgetPassGrd(String code)async{
    var url=Uri.https(base,'/api/grad/auth/confirmPIN');
    http.Response res=await http.post(url,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
      body: jsonEncode({
        "pincode":code
      })
    );
    var json=jsonDecode(res.body);
    print('----------------------------------->${res.statusCode}');
    print('----------------------------------->${res.body}');
    var r =PincodeToForgertPStudent.fromJson(json);
    return r;
  }
  static Future<ResetForgetPassStudent> resetForgetPassStudent(String pinCode,String password,String confirm)async{
    var url=Uri.https(base,'/api/auth/resetPassword');
    http.Response respons=await http.post(url,
    headers: {
      "Accept": "application/json",
      "Content-Type": "application/json"
    },
     body: jsonEncode({
       "pincode":pinCode,
       "password":password,
       "password_confirmation":confirm,
     }));
    print('==========================>StatusCode: ${respons.statusCode}');
    var json=jsonDecode(respons.body);
    var res=ResetForgetPassStudent.fromJson(json);
    return res;
  }
  //not completed
  static Future<PostAcademicRegistryApi> storeAcademicRegistry(File imageFile,String semester)async{
    var uri = Uri.parse("https://aqua.larasci.site/api/academicRegistry");
    final pref=await SharedPreferences.getInstance();
    var multipartFile =  await http.MultipartFile.fromPath('image', imageFile.path);
    Map<String, String> headers = {
     "Accept": "application/json",
      "Authorization": "Bearer ${pref.getString('token')}"
    };
    var request = http.MultipartRequest('POST',uri)
      ..fields.addAll({
        'semester':semester
      })
      ..headers.addAll(headers)
      ..files.add(multipartFile);
    http.Response response = await http.Response.fromStream( await request.send());
    print('===============>${response.statusCode}');
    if(response.statusCode==401){
      LoginStudentApi data=await RefrsghJWT(pref.getString('email')??"", pref.getString('password')??"", pref.getString('token')??"");
      print('acess_token: ${data.accessToken}');
      pref.setString('token', data.accessToken!);
    }
    var json=jsonDecode(response.body);
    var res=PostAcademicRegistryApi.fromJson(json);
    return res;
  }
  static Future<GetAcademicRegistryApi> getShowAcademicRegistry(int id)async{
    final pref=await SharedPreferences.getInstance();
    var url=Uri.https(base,'/api/academicRegistry/$id');
    http.Response respons=await http.get(url,
    headers: {
      "Accept": "application/json",
      "Authorization": "Bearer ${pref.getString('token')??""}"
    });
    if(respons.statusCode==401 ){
      LoginStudentApi data=await RefrsghJWT(pref.getString('email')??"", pref.getString('password')??"", pref.getString('token')??"");
      pref.setString('token',data.accessToken!);
    }
    var json=jsonDecode(respons.body);
var res=GetAcademicRegistryApi.fromJson(json);
return res;
  }
  static Future<http.Response> delAcadimicRegistery(int id)async{
    var url=Uri.https(base,'/api/academicRegistry/$id');
    final pref=await SharedPreferences.getInstance();
    http.Response response=await http.delete(url,
    headers: {
      "Accept": "application/json",
      "Authorization": "Bearer ${pref.getString('token')??""}"
    });
    if(response.statusCode==401){
      LoginStudentApi data=await RefrsghJWT(pref.getString('email')??"", pref.getString('password')??"", pref.getString('token')??"");
      pref.setString('token',data.accessToken!);
    }
    return response;
  }
  static Future<RegisterationFormModel> storeRegisterationForm(File imageFile,String semester)async{
    var uri=Uri.https(base,'/api/registertionForms');
    final pref=await SharedPreferences.getInstance();
    var multipartFile =  await http.MultipartFile.fromPath('re_image', imageFile.path);
    Map<String, String> headers = {
      "Accept": "application/json",
      "Authorization": "Bearer ${pref.getString('token')??""}"
    };
    var request = http.MultipartRequest('POST',uri)
      ..fields.addAll({
        'semester':semester
      })
      ..headers.addAll(headers)
      ..files.add(multipartFile);
    http.Response response = await http.Response.fromStream( await request.send());
    var json=jsonDecode(response.body);
    var res=RegisterationFormModel.fromJson(json);
    return res;
  }
  static Future<GetRegisterationFormModel> getRegisterationForm(int id)async{
    final pref=await SharedPreferences.getInstance();
    var url=Uri.https(base,'/api/registertionForms/$id');
    http.Response respons=await http.get(url,
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer ${pref.getString('token')??""}"
        });
    if(respons.statusCode==401 ){
      LoginStudentApi data=await RefrsghJWT(pref.getString('email')??"", pref.getString('password')??"", pref.getString('token')??"");
      pref.setString('token',data.accessToken!);
    }
    var json=jsonDecode(respons.body);
    var res=GetRegisterationFormModel.fromJson(json);
    return res;
  }
  static Future<http.Response> delRegiserationForm(int id)async{
    var url=Uri.https(base,'/api/registertionForms/$id');
    final pref=await SharedPreferences.getInstance();
    http.Response response=await http.delete(url,
        headers: {
          "Accept": "application/json",
          "Authorization": "Bearer ${pref.getString('token')??""}"
        });
    if(response.statusCode==401){
      LoginStudentApi data=await RefrsghJWT(pref.getString('email')??"", pref.getString('password')??"", pref.getString('token')??"");
      pref.setString('token',data.accessToken!);
    }
    return response;
  }

  //used in setting // this return more details of token
  static Future<MeJWT>meJWT(String email,String password,String token)async{
    var url=Uri.https(base,'/api/auth/me');
    http.Response respons=await http.post(url,headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    },body: jsonEncode({
      "email": email,
      "password": password,
    }));
    if(respons.statusCode==401){
      LoginStudentApi data=await RefrsghJWT(email, password, token);
      token=data.accessToken!;
    }
    var json=jsonDecode(respons.body);
    var res=MeJWT.fromJson(json);
    return res;
  }
  static Future<LoginStudentApi>RefrsghJWT(String email,String pass,String token)async{
    var url =Uri.https(base,'/api/auth/refresh');
    http.Response response = await http.post(url,headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    },
    body: jsonEncode({
      'email':email,
      'password':pass
    }));
    print('refresh ===============> ${response.statusCode}');
    var json=jsonDecode(response.body);
    var res=LoginStudentApi.fromJson(json);
    return res;
  }
  static Future<http.Response> getCourse(String email,String pass,String currToken)async{
var url=Uri.https(base,'/api/courses');
http.Response respons=await http.get(url,headers: {
  "Accept": "application/json",
  "Content-Type": "application/json",
  "Authorization": "Bearer $currToken"
});
if(respons.statusCode==401){
  LoginStudentApi data=await RefrsghJWT(email, pass, currToken);
  currToken=data.accessToken!;
}
return respons;
}
void getActivity()async{
    var url=Uri.https(base,'/api/studentActivities');
    http.Response response=await http.get(url);
}

}
