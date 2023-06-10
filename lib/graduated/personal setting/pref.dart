import 'dart:core';
import 'dart:core';

import 'package:shared_preferences/shared_preferences.dart';

class UserSimplePreferences{
  static SharedPreferences ?_preferences;
  static const _phone='phone';
  static const _address='address';
  static const _gradBatch='gradBatch';
  static const _department='department';
  static const _specialization='specialization';
  static const _scientificDeg='scientificDeg';
  static const _gpa='gpa';
  static const _fieldCourse='fieldCourse';
  static const _course='course';
  static const _fieldAwards='fieldAwards';
  static const _awards='awards';
  static const _birthDate='birthDate';



  static Future init() async=>
      _preferences=await SharedPreferences.getInstance();
  static Future setPhone( String phone)async=>
      await _preferences?.setString(_phone, phone);
  static Future setAddress( String address)async=>
      await _preferences?.setString(_address, address);
  static Future setGradBatch( String gradBatch)async=>
      await _preferences?.setString(_gradBatch, gradBatch);
  static Future setDepartment( String department)async=>
      await _preferences?.setString(_department, department);
  static Future setSecialization( String specialization)async=>
      await _preferences?.setString(_specialization, specialization);
  static Future setScientificDeg( String scientificDeg)async=>
      await _preferences?.setString(_scientificDeg, scientificDeg);
  static Future setGpa( String gpa)async=>
      await _preferences?.setString(_gpa, gpa);
  static Future setFieldCourse( String fieldCourse)async=>
      await _preferences?.setString(_fieldCourse, fieldCourse);
  static Future setCourse( String course)async=>
      await _preferences?.setString(_course, course);
  static Future setFieldAwards( String fieldAwards)async=>
      await _preferences?.setString(_fieldAwards, fieldAwards);
  static Future setAward( String awards)async=>
      await _preferences?.setString(_awards, awards);
  static Future setDop(String birthDate)async=>
await _preferences?.setString(_birthDate,birthDate );



  static String? getPhone()=>_preferences?.getString(_phone);
  static String? getAddress()=>_preferences?.getString(_address);
  static String? getBatch()=>_preferences?.getString(_gradBatch);
  static String? getDepartment()=>_preferences?.getString(_department);
  static String? getSpecialization()=>_preferences?.getString(_specialization);
  static String? getScientificDeg()=>_preferences?.getString(_scientificDeg);
  static String? getGpa()=>_preferences?.getString(_gpa);
  static String? getFieldCourse()=>_preferences?.getString(_fieldCourse);
  static String? getCourse()=>_preferences?.getString(_course);
  static String? getFieldAwards()=>_preferences?.getString(_fieldAwards);
  static String? getAwards()=>_preferences?.getString(_awards);
 static String? getBirthDate()=>_preferences?.getString(_birthDate);
 }

