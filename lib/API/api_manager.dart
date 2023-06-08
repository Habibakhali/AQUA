import 'package:project/API/Models/Student/me_jwt.dart';
import 'package:project/API/Models/Student/post_acadimic_registration.dart';
import 'package:project/API/Models/Student/registeration_form_model.dart';
import 'package:project/API/Models/Student/update_activity.dart';
import 'package:project/API/Models/graduated/companies_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:io';
import 'Models/Student/GetActivity.dart';
import 'Models/Student/ShowActivity.dart';
import 'Models/Student/academic_registry_api.dart';
import 'Models/Student/forget_pass_student.dart';
import 'Models/Student/get_registeration_forn.dart';
import 'Models/graduated/grd_expr_data.dart';
import 'Models/Student/login_student_api.dart';
import 'Models/Student/pincode_forgetpass_student.dart';
import 'Models/Student/register.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'Models/Student/otp_student_api.dart';
import 'Models/Student/resend_otp_student_api.dart';
import 'Models/Student/reset_forget_pass_student.dart';
import 'Models/Student/show_course_details.dart';
import 'Models/get_course_reservation.dart';
import 'Models/get_curses.dart';

class ApiManager {
  static String base = 'aqua.larasci.site';
  static int id = 0;
  static List<String> imagesAc = [];

  static Future<Register> postRegisterStud(
      String userName,
      String email,
      String pass,
      String confi_pass,
      String id,
      String phone,
      String year) async {
    var URL = Uri.https(base, '/api/auth/register');
    http.Response signUp = await http.post(
      URL,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
      body: jsonEncode({
        "name": userName,
        "email": email,
        "password": pass,
        "password_confirmation": confi_pass,
        "std_info": jsonEncode({
          "id": id,
          "phone": phone,
          "acad_year": year,
        })
      }),
    );
    var json = jsonDecode(signUp.body);
    print(
        "----------------------------------------> StatusCode ${signUp.statusCode}");
    print("----------------------------------------> json ${json}");
    var res = Register.fromJson(json);

    return res;
  }

  static Future<Register> postRegisterGrd(
      String userName, String email, String pass, String confi_pass) async {
    var URL = Uri.https(base, '/api/grad/auth/register');
    http.Response signUp = await http.post(
      URL,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json"
      },
      body: jsonEncode({
        "name": userName,
        "email": email,
        "password": pass,
        "password_confirmation": confi_pass,
      }),
    );
    var json = jsonDecode(signUp.body);
    print(
        "----------------------------------------> statusCode ${signUp.statusCode}");
    print("----------------------------------------> json ${json}");
    var res = Register.fromJson(json);
    return res;
  }

  static Future<ApiOtpStudent> otpVstudent(String o) async {
    var uri = Uri.https(base, '/api/auth/verifyOtp');
    http.Response otp = await http.post(uri,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: jsonEncode({
          "otp": o,
        }));
    print(
        "=================================================>statusCode${otp.statusCode}");
    var json = jsonDecode(otp.body);
    print("----------------------------------------> json ${json}");
    var res = ApiOtpStudent.fromJson(json);
    return res;
  }

  static Future<ApiOtpStudent> otpVGrd(String o) async {
    var uri = Uri.https(base, '/api/grad/auth/verifyOtp');
    http.Response otp = await http.post(uri,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: jsonEncode({
          "otp": o,
        }));
    print(
        "=================================================>statusCode${otp.statusCode}");
    var json = jsonDecode(otp.body);
    print("----------------------------------------> json ${json}");
    var res = ApiOtpStudent.fromJson(json);
    return res;
  }

  static Future<ResendOtpStudentApi> resendOtpStudent(String email) async {
    var url = Uri.https(base, '/api/auth/resendOtp');
    http.Response res = await http.post(url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
        body: jsonEncode({"email": email}));
    print('=================================> ${res.statusCode}');
    var json = jsonDecode(res.body);
    var r = ResendOtpStudentApi.fromJson(json);
    return r;
  }

  static Future<ResendOtpStudentApi> resendOtpGrd(String email) async {
    var url = Uri.https(base, '/api/grad/auth/resendOtp');
    http.Response res = await http.post(url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
        },
        body: jsonEncode({"email": email}));
    print('=================================> ${res.statusCode}');
    var json = jsonDecode(res.body);
    var r = ResendOtpStudentApi.fromJson(json);
    return r;
  }

  static Future<LoginStudentApi> loginStudent(
      String email, String password) async {
    final pref = await SharedPreferences.getInstance();
    var url = Uri.https(base, '/api/auth/login');
    http.Response res = await http.post(url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: jsonEncode({
          "email": email,
          "password": password,
        }));
    var json = jsonDecode(res.body);
    var r = LoginStudentApi.fromJson(json);
    if (res.statusCode == 200) {
      pref.setString('token', r.accessToken!);
      pref.setString('email', email);
      pref.setString('password', password);
      pref.setString('usernameStu', r.user!.name!);
    }
    return r;
  }

  static Future<LoginStudentApi> loginGrd(String email, String password) async {
    final pref = await SharedPreferences.getInstance();
    var url = Uri.https(base, '/api/grad/auth/login');
    http.Response response = await http.post(url,
        headers: {
            "Accept": "application/json",
            "Content-Type": "application/json"
        },
        body: jsonEncode({
          "email": email,
          "password": password,
        }));
    print('---------------->${response.statusCode}');
    var json = jsonDecode(response.body);
    var r = LoginStudentApi.fromJson(json);
    if (response.statusCode == 200) {
      pref.setString('tokenGrd', r.accessToken!);
      pref.setString('emailGrd', email);
      pref.setString('passGrd', password);
    }
    return r;
  }

  //to know account which i send code to this
  static Future<ForgetPassStudent> RequestCodeToForgetPassStudent(
      String email) async {
    var url = Uri.https(base, '/api/auth/requestPinCode');
    http.Response res = await http.post(url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: jsonEncode({"email": email}));
    var json = jsonDecode(res.body);
    print('------------------------------>${res.statusCode}');
    print('------------------------------>${res.body}');
    var r = ForgetPassStudent.fromJson(json);
    return r;
  }

  static Future<ForgetPassStudent> RequestCodeToForgetPassGrd(
      String email) async {
    var url = Uri.https(base, '/api/grad/auth/requestPinCode');
    http.Response res = await http.post(url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: jsonEncode({"email": email}));
    var json = jsonDecode(res.body);
    print('------------------------------>${res.statusCode}');
    print('------------------------------>${res.body}');
    var r = ForgetPassStudent.fromJson(json);
    return r;
  }

  static Future<PincodeToForgertPStudent> ConfirmCodeForgetPassStudent(
      String code) async {
    var url = Uri.https(base, '/api/auth/confirmPIN');
    http.Response res = await http.post(url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: jsonEncode({"pincode": code}));
    var json = jsonDecode(res.body);
    print('----------------------------------->${res.statusCode}');
    print('----------------------------------->${res.body}');
    var r = PincodeToForgertPStudent.fromJson(json);
    return r;
  }

  static Future<PincodeToForgertPStudent> ConfirmCodeForgetPassGrd(
      String code) async {
    var url = Uri.https(base, '/api/grad/auth/confirmPIN');
    http.Response res = await http.post(url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: jsonEncode({"pincode": code}));
    var json = jsonDecode(res.body);
    print('----------------------------------->${res.statusCode}');
    print('----------------------------------->${res.body}');
    var r = PincodeToForgertPStudent.fromJson(json);
    return r;
  }

  static Future<ResetForgetPassStudent> resetForgetPassStudent(
      String pinCode, String password, String confirm) async {
    var url = Uri.https(base, '/api/auth/resetPassword');
    http.Response respons = await http.post(url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json"
        },
        body: jsonEncode({
          "pincode": pinCode,
          "password": password,
          "password_confirmation": confirm,
        }));
    print('==========================>StatusCode: ${respons.statusCode}');
    var json = jsonDecode(respons.body);
    var res = ResetForgetPassStudent.fromJson(json);
    return res;
  }

  //not completed
  static Future<PostAcademicRegistryApi> storeAcademicRegistry(
      File imageFile, String semester) async {
    var uri = Uri.parse("https://aqua.larasci.site/api/academicRegistry");
    final pref = await SharedPreferences.getInstance();
    var multipartFile =
        await http.MultipartFile.fromPath('image', imageFile.path);
    Map<String, String> headers = {
      "Accept": "application/json",
      "Authorization": "Bearer ${pref.getString('token')}"
    };
    var request = http.MultipartRequest('POST', uri)
      ..fields.addAll({'semester': semester})
      ..headers.addAll(headers)
      ..files.add(multipartFile);
    http.Response response =
        await http.Response.fromStream(await request.send());
    print('===============>${response.statusCode}');
    if (response.statusCode == 401) {
      LoginStudentApi data = await RefrsghJWT();
      print('acess_token: ${pref.getString('token')}');
      if (data.tokenType != null) {
        pref.setString('token', data.accessToken!);
      }
    }
    print(response.body);
    var json = jsonDecode(response.body);
    var res = PostAcademicRegistryApi.fromJson(json);
    return res;
  }

  static Future<GetAcademicRegistryApi> getShowAcademicRegistry(int id) async {
    final pref = await SharedPreferences.getInstance();
    var url = Uri.https(base, '/api/academicRegistry/$id');
    http.Response respons = await http.get(url, headers: {
      "Accept": "application/json",
      "Authorization": "Bearer ${pref.getString('token') ?? ""}"
    });
    if (respons.statusCode == 401) {
      LoginStudentApi data = await RefrsghJWT();
      pref.setString('token', data.accessToken!);
    }
    var json = jsonDecode(respons.body);
    var res = GetAcademicRegistryApi.fromJson(json);
    if (respons.statusCode == 200) {
      pref.setString('acadimic' + pref.getString('email')!,
          'https://' + ApiManager.base + '/' + res.payload!.image!);
      pref.setInt(
          'semester' + pref.getString('email')!, res.payload!.semester!);
      pref.setInt('idacadimic' + pref.getString('email')!, res.payload!.id!);
      String image =
          pref.getString('acadimic' + pref.getString('email')!) ?? '';
      String iid = res.payload!.id!.toString();
      String value = image + '#' + iid;
      imagesAc = pref.getStringList('imagelist'+ pref.getString('email')!) ?? [];
      imagesAc.insert(imagesAc.length, value);
      pref.setStringList('imagelist'+ pref.getString('email')!, imagesAc);
    }
    return res;
  }

  static Future<int> delAcadimicRegistery(int id) async {
    var url = Uri.https(base, '/api/academicRegistry/$id');
    final pref = await SharedPreferences.getInstance();
    http.Response response = await http.delete(url, headers: {
      "Accept": "application/json",
      "Authorization": "Bearer ${pref.getString('token') ?? ""}"
    });
    print('deletion is : ${response.statusCode}');
    if (response.statusCode == 401) {
      LoginStudentApi data = await RefrsghJWT();
    }

    return response.statusCode;
  }

  static Future<RegisterationFormModel> storeRegisterationFormre(
      File imageFile, String semester) async {
    var uri = Uri.https(base, '/api/registertionForms', {'mode': 're'});
    final pref = await SharedPreferences.getInstance();
    var multipartFile =
        await http.MultipartFile.fromPath('re_image', imageFile.path);
    Map<String, String> headers = {
      "Accept": "application/json",
    "Content-Type": "application/json",
    "Authorization": "Bearer ${pref.getString('token') ?? ""}"
    };
    var request = http.MultipartRequest('POST', uri)
      ..fields.addAll({
        'semester': semester,
      })
      ..headers.addAll(headers)
      ..files.add(multipartFile);
    http.Response response =
        await http.Response.fromStream(await request.send());
    print('status Code: ${response.statusCode}');
    print('body :${response.body}');
    var json = jsonDecode(response.body);
    var res = RegisterationFormModel.fromJson(json);
    if (response.statusCode == 401) {
      LoginStudentApi ss = await RefrsghJWT();
      pref.setString('token', ss.accessToken ?? '');
    }
    return res;
  }

  static Future<RegisterationFormModel> storeRegisterationFormda(
      File imageFile, String semester) async {
    var uri = Uri.https(base, '/api/registertionForms', {'mode': 'da'});
    final pref = await SharedPreferences.getInstance();
    var multipartFile =
        await http.MultipartFile.fromPath('da_image', imageFile.path);
    Map<String, String> headers = {
      "Accept": "application/json",
      "Authorization": "Bearer ${pref.getString('token') ?? ""}"
    };
    var request = http.MultipartRequest('POST', uri)
      ..fields.addAll({
        'semester': semester,
      })
      ..headers.addAll(headers)
      ..files.add(multipartFile);
    http.Response response =
        await http.Response.fromStream(await request.send());
    print('status Code: ${response.statusCode}');
    var json = jsonDecode(response.body);
    var res = RegisterationFormModel.fromJson(json);
    return res;
  }

  static Future<GetRegisterationFormModel> getRegisterationForm(int id) async {
    final pref = await SharedPreferences.getInstance();
    var url = Uri.https(base, '/api/registertionForms/$id');
    http.Response respons = await http.get(url, headers: {
      "Accept": "application/json",
      "Authorization": "Bearer ${pref.getString('token') ?? ""}"
    });
    if (respons.statusCode == 401) {
      LoginStudentApi data = await RefrsghJWT();
      pref.setString('token', data.accessToken!);
    }
    var json = jsonDecode(respons.body);
    var res = GetRegisterationFormModel.fromJson(json);
    if (respons.statusCode == 200) {
      pref.setString('status' + pref.getString('email')!,
          'https://' + ApiManager.base + '/' + res.payload!.reImage!);
      pref.setInt(
          'semester' + pref.getString('email')!, res.payload!.semester ?? 11);
      res.payload!.daImage != null
          ? pref.setString('imageAS' + pref.getString('email')!,
              'https://' + ApiManager.base + '/' + res.payload!.daImage!)
          : print('');
      pref.setInt('id' + pref.getString('email')!, res.payload!.id!);
      print(pref.getInt('id' + pref.getString('email')!));
    }
    return res;
  }

  static Future<http.Response> delRegiserationFormre(int id) async {
    var url = Uri.https(base, '/api/registertionForms/$id', {'mode': 're'});
    final pref = await SharedPreferences.getInstance();
    http.Response response = await http.delete(url, headers: {
      "Accept": "application/json",
      "Authorization": "Bearer ${pref.getString('token') ?? ""}"
    });
    if (response.statusCode == 200) {
      pref.setString('status' + pref.getString('email')!, '');
      pref.setString('imageAS' + pref.getString('email')!, '');
    }
    if (response.statusCode == 401) {
      LoginStudentApi data = await RefrsghJWT();
      pref.setString('token', data.accessToken!);
    }
    return response;
  }

  static Future<http.Response> delRegiserationFormda(int id) async {
    var url = Uri.https(base, '/api/registertionForms/$id', {'mode': 'da'});
    final pref = await SharedPreferences.getInstance();
    http.Response response = await http.delete(url, headers: {
      "Accept": "application/json",
      "Authorization": "Bearer ${pref.getString('token') ?? ""}"
    });
    if (response.statusCode == 200) {
      pref.setString('status' + pref.getString('email')!, '');
      pref.setString('imageAS' + pref.getString('email')!, '');
    }
    if (response.statusCode == 401) {
      LoginStudentApi data = await RefrsghJWT();
      pref.setString('token', data.accessToken!);
    }
    return response;
  }

  //used in setting // this return more details of token
  static Future<MeJWT> meJWT(
      String email, String password, String token) async {
    var url = Uri.https(base, '/api/auth/me');
    http.Response respons = await http.post(url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
        body: jsonEncode({
          "email": email,
          "password": password,
        }));
    if (respons.statusCode == 401) {
      LoginStudentApi data = await RefrsghJWT();
      token = data.accessToken!;
    }
    var json = jsonDecode(respons.body);
    var res = MeJWT.fromJson(json);
    return res;
  }

  static Future<LoginStudentApi> RefrsghJWT() async {
    final pref = await SharedPreferences.getInstance();
    var url = Uri.https(base, '/api/auth/refresh');
    http.Response response = await http.post(
      url,
      headers: {
        "Accept": "application/json",
        "Content-Type": "application/json",
        "Authorization": "Bearer ${pref.getString('token')}"
      },
    );
    print('refresh ===============> ${response.statusCode}');
    var json = jsonDecode(response.body);
    var res = LoginStudentApi.fromJson(json);
    return res;
  }

  static Future<List<Payloadd>> getCourse() async {
    var url = Uri.https(base, '/api/courses');
    final pref = await SharedPreferences.getInstance();
    http.Response respons = await http.get(url, headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer ${pref.getString('token')}"
    });
    if (respons.statusCode == 401) {
      LoginStudentApi data = await RefrsghJWT();
      pref.setString('token', data.accessToken ?? '');
    }
    print(respons.statusCode);
    List<Payloadd> name = [];
    if (respons.statusCode == 200)
      name = GetCourses.fromJson(jsonDecode(respons!.body)).payload!;
    return name;
  }

// i add any course and not need usse response
  //when i need to add course ,we must call this function in  initState in courses.dart
  static void storeCourses(String cCode, String cName, int cHour,
      String cPrereq, int semester) async {
    final pref = await SharedPreferences.getInstance();
    var url = Uri.https(base, '/api/courses');
    http.Response response = await http.post(url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": "Bearer ${pref.getString('token')}"
        },
        body: jsonEncode({
          "c_code": cCode,
          "c_name": cName,
          "c_hours": cHour,
          "c_prereq[0]": cPrereq,
          "semester": semester,
        }));
    if (response.statusCode == 200) {
      print("****************> adding cousres success");
    }
  }

  static Future<ShowCourseDetails> showCourses(String code) async {
    final pref = await SharedPreferences.getInstance();
    var url = Uri.https(base, '/api/courses/$code');
    http.Response response = await http.get(url, headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer ${pref.getString('token')}"
    });
    var json = jsonDecode(response.body);
    var res = ShowCourseDetails.fromJson(json);
    return res;
  }

  static Future<http.Response> storeCourseReservation(
      String cCode, String semester) async {
    final pref = await SharedPreferences.getInstance();
    var url = Uri.https(base, '/api/courseReservation');
    http.Response response = await http.post(url,
        headers: {
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": "Bearer ${pref.getString('token')}"
        },
        body: jsonEncode({
          "c_code": cCode,
          "semester": int.parse(semester),
        }));
    return response;
  }

  static Future<List<PayloadcourseReservation>?> getCourseReservation() async {
    final pref = await SharedPreferences.getInstance();
    var url = Uri.parse('https://' + base + '/api/courseReservation');
    http.Response response = await http.get(url, headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer ${pref.getString('token')}"
    });
    var json = jsonDecode(response.body);
    var res = GetCourseReservation.fromJson(json);
    List<PayloadcourseReservation>? playload = res.payload;
    return playload;
  }

  static Future<bool> delCourseReservation(int id) async {
    final pref = await SharedPreferences.getInstance();
    var url = Uri.https(base, '/api/courseReservation/$id');
    http.Response response = await http.delete(url, headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer ${pref.getString('token')}"
    });
    print('delete coure : ${response.statusCode}');
    print('delete body : ${response.body}');
    if (response.statusCode == 200) return true;
    return false;
  }

  static Future<http.Response> storeActivity(
      String title, String des, File? image) async {
    final pref = await SharedPreferences.getInstance();
    var uri = Uri.https(base, '/api/studentActivities');
    var multipartFile = await http.MultipartFile.fromPath('image', image!.path);
    Map<String, String> headers = {
      "Accept": "application/json",
      "Authorization": "Bearer ${pref.getString('token') ?? ""}"
    };
    var request = http.MultipartRequest('POST', uri)
      ..fields.addAll({'title': title, "des": des})
      ..headers.addAll(headers)
      ..files.add(multipartFile);
    http.Response response =
        await http.Response.fromStream(await request.send());
    print('--------------->${response.statusCode}');
    return response;
  }

  static Future<List<PayloadActivity>?> getActivity() async {
    var url = Uri.https(base, '/api/studentActivities');
    print('------------------- I\'am here');

    http.Response response = await http.get(url);
    List<PayloadActivity>? playload = [];
    var json = jsonDecode(response.body);
    GetActivity res = GetActivity.fromJson(json);
    playload = res.payload;

    return playload;
  }
  static Future<ShowActivity> showActivity(int id) async {
    var url = Uri.https(base, '/api/studentActivities/$id');
    http.Response response = await http.get(url);
    var json = jsonDecode(response.body);
    var res = ShowActivity.fromJson(json);
    return res;
  }

  static Future<bool?> updateActivity(
      int id, String title, String des, File? image) async {
    var url = Uri.https(base, '/api/studentActivities/$id');
    var multipartFile = await http.MultipartFile.fromPath('image', image!.path);
    Map<String, String> headers = {
      "Accept": "application/json",
    };
    var request = http.MultipartRequest('POST', url)
      ..fields.addAll({'title': title, "des": des})
      ..headers.addAll(headers)
      ..files.add(multipartFile);
    http.Response response =
        await http.Response.fromStream(await request.send());
    print('status cod of upadteactivity ${response.statusCode}');
    print(id);
    var json = jsonDecode(response.body);
    UpdateActivity res = UpdateActivity.fromJson(json);
    return res.success;
  }

  static Future<bool?> delActivity(int id) async {
    final pref = await SharedPreferences.getInstance();
    var url = Uri.https(base, '/api/studentActivities/$id');
    http.Response response = await http.delete(url, headers: {
      "Accept": "application/json",
      "Authorization": "Bearer ${pref.getString('token') ?? ""}"
    });
    var json = jsonDecode(response.body);
    UpdateActivity res = UpdateActivity.fromJson(json);
    return res.success;
  }
  static Future<void> storeGrddDetailes(
      String bod,
      String phone,
      String address,
      File? image,
      String GrdBatch,
      String sciDegree,
      File acadCertificates,
      File grdCertificates,
      File acadimicRecord,
      String gpa,
      File cv,
      String courses,
      String awardes) async {
    final pref = await SharedPreferences.getInstance();
    var url = Uri.https(base, '/api/graduateDetailes');
    var ccv = await http.MultipartFile.fromPath('cv', cv.path);
    var acadimic_certific =
        await http.MultipartFile.fromPath('academic_certificates', cv.path);
    var grd_certific =
        await http.MultipartFile.fromPath('graduation_certificate', cv.path);
    var acadimic_record =
        await http.MultipartFile.fromPath('academic_record', cv.path);
    Map<String, String> headers = {
      "Accept": "application/json",
      "Authorization": "Bearer ${pref.getString('tokenGrd') ?? ""}"
    };

    var request;
    if (image != null) {
      var immage = await http.MultipartFile.fromPath('image', image.path);
      request = http.MultipartRequest('POST', url)
        ..fields.addAll({
          'dob': bod,
          'phone': phone,
          'address': address,
          'grad_batch': GrdBatch,
          'department': 'math',
          'specialization': 'CS',
          'scientific_degree': sciDegree,
          'gpa': gpa,
          'courses': courses,
          'awards': awardes
        })
        ..headers.addAll(headers)
        ..files.add(immage)
        ..files.add(ccv)
        ..files.add(acadimic_certific)
        ..files.add(grd_certific)
        ..files.add(acadimic_record);
    } else {
      request = http.MultipartRequest('POST', url)
        ..fields.addAll({
          'dob': bod,
          'phone': phone,
          'address': address,
          'grad_batch': GrdBatch,
          'department': 'math',
          'specialization': 'CS',
          'scientific_degree': sciDegree,
          'gpa': gpa,
          'courses': courses,
          'awards': awardes
        })
        ..headers.addAll(headers)
        ..files.add(ccv)
        ..files.add(acadimic_certific)
        ..files.add(grd_certific)
        ..files.add(acadimic_record);
    }
    http.Response response =
        await http.Response.fromStream(await request.send());
  }
  static Future<void>getGrdDetailes()async{
    var url=Uri.https(base,'/api/graduateDetailes');
    http.Response response=await http.get(url);
  }
  static Future<void>delGrdDetailes(int id)async{
    final pref=await SharedPreferences.getInstance();
    var url=Uri.https(base,'/api/graduateDetailes/$id');
    http.Response response=await http.delete(url,headers: {
      "Accept":"application/json",
      "Authorization": "Bearer ${pref.getString('tokenGrd') ?? ""}"});
  }
  static Future<void>showGrdDetailes(int id)async{
    final pref=await SharedPreferences.getInstance();
    var url=Uri.https(base,'/api/graduateDetailes/$id');
    http.Response response=await http.get(url,headers: {
      "Accept":"application/json",
      "Authorization": "Bearer ${pref.getString('tokenGrd') ?? ""}"});
  }
static Future<http.Response> storeGraduateEperience(String jobTitle, String startDate, String endDate,String companyId)
async{
    final pref=await SharedPreferences.getInstance();
    var url=Uri.https(base,'/api/graduateExperiences');
    http.Response response=await http.post(url,headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer ${pref.getString('tokenGrd')}"
    },
        body: jsonEncode({
          "job_title":jobTitle,
          "start_date":startDate,
          "end_date":endDate,
          "company_id":companyId,

        }));

    print('refresh ===============> ${response.body}');
   return response;
  }
  static Future<getGrdExp>getGrdExperiences()async{
    final pref=await SharedPreferences.getInstance();
    var url=Uri.https(base,'/api/graduateExperiences');
    http.Response response=await http.get(url,headers: {
      "Authorization": "Bearer ${pref.getString('tokenGrd')}"
    });
    var json=jsonDecode(response.body);
    var res=getGrdExp.fromJson(json);
    return res;

  }
  static Future<http.Response>delGrdExperiences(int id)async{
    final pref=await SharedPreferences.getInstance();
    var url=Uri.https(base,'/api/graduateExperiences/$id');
    http.Response response=await http.delete(url,headers: {
      "Accept":"application/json",
      "Authorization": "Bearer ${pref.getString('tokenGrd') ?? ""}"});
    return response;
  }


  static Future<http.Response> storeCompanies(String Name, String Email, String Address,String Type) async{
    final pref=await SharedPreferences.getInstance();
    var url=Uri.https(base,'/api/companies');
    http.Response response=await http.post(url,headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer ${pref.getString('tokenGrd')}"

    },
        body: jsonEncode({
          "name":Name,
          "email":Email,
          "address":Address,
          "type":Type,

        }));
    print(response.statusCode);
    return response;
  }
  static Future<void> updateCompanies(String Name, String Email, String Address,String Type)
  async{
    final pref=await SharedPreferences.getInstance();
    var url=Uri.https(base,'/api/companies');
    http.Response response=await http.post(url,headers: {
      "Accept": "application/json",
      "Content-Type": "application/json",
      "Authorization": "Bearer ${pref.getString('token')}"

    },
        body: jsonEncode({
          "name":Name,
          "email":Email,
          "address":Address,
          "type":Type,

        }));

    print('refresh ===============> ${response.statusCode}');
    var json=jsonDecode(response.body);
  }

  static Future<getCompaniesDate>getCompanies()async{
    final pref=await SharedPreferences.getInstance();
    var url=Uri.https(base,'/api/companies');
    http.Response response=await http.get(url,headers: {
      "Authorization": "Bearer ${pref.getString('tokenGrd')}"
    });
    var json=jsonDecode(response.body);
    print(response.statusCode);
    var res=getCompaniesDate.fromJson(json);
    return res;
  }
  static Future<http.Response>delCompany(int id)async{
    final pref=await SharedPreferences.getInstance();
    var url=Uri.https(base,'/api/companies/$id');
    http.Response response=await http.delete(url,headers: {
      "Accept":"application/json",
      "Authorization": "Bearer ${pref.getString('tokenGrd') ?? ""}"});
    return response;
  }
}
