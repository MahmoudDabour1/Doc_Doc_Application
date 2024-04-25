import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences prefs;

  static init() async {
     prefs = await SharedPreferences.getInstance();
  }

  static Future<bool>saveCounter(int count) async {
    return await prefs.setInt("counter", count);
  }

  static int getCounter()  {
    return prefs.getInt("counter") ?? 0;
  }

  static Future<bool>saveIfNotFirstTime() async {
    return await prefs.setBool("isFirstTime", false);
  }

  static bool getIfFirstTime()  {
    return prefs.getBool("isFirstTime") ?? true;
  }

  static Future<bool>saveToken(String token) async {
    return await prefs.setString("token", token);
  }

  static String getToken()  {
    return prefs.getString("token") ?? "";
  }

  static Future<bool>saveImage(String imageUrl) async {
    return await prefs.setString("image",imageUrl );
  }

  static String getImage()  {
    return prefs.getString("image")??"";
  }

  static Future<bool>saveFirstName(String firstName) async {
    return await prefs.setString("firstName", firstName);
  }

  static String getFirstName()  {
    return prefs.getString("firstName") ?? "";
  }
  static Future<bool>saveLastName(String lastName) async {
    return await prefs.setString("lastName", lastName);
  }

  static String getLastName()  {
    return prefs.getString("lastName") ?? "";
  }

  static Future<bool>saveFullName(String name) async {
    return await prefs.setString("Full_Name", name);
  }

  static String getFullName()  {
    return prefs.getString("Full_Name") ?? "";
  }

  static Future<bool>saveEmail(String email) async {
    return await prefs.setString("Email", email);
  }

  static String getEmail()  {
    return prefs.getString("Email") ?? "";
  }


  static Future<bool>saveRole(String role) async {
    return await prefs.setString("Email", role);
  }

  static String getRole()  {
    return prefs.getString("Role") ?? "";
  }

  static Future<bool>savePhone(String phone) async {
    return await prefs.setString("phone", phone);
  }

  static String getPhone()  {
    return prefs.getString("phone") ?? "";
  }

  static Future<bool>saveId(int id) async {
    return await prefs.setInt("id", id);
  }

  static int getId()  {
    return prefs.getInt("id") ?? 0;
  }

  static Future<bool> clear(){
    return prefs.clear();
  }

  static Future<bool>saveString(String value) async {
    return await prefs.setString("String", value);
  }
  static String getString()  {
    return prefs.getString("String") ?? "";
  }


  static Future<bool> saveLatitude(double latitude)async{
    return await prefs.setDouble("latitude", latitude);
  }

  static double getLatitude(){
    return prefs.getDouble("latitude")??0.0;
  }

  static Future<bool> saveLongitude(double longitude)async{
    return await prefs.setDouble("longitude", longitude);
  }

  static double getLongitude(){
    return prefs.getDouble("longitude")??0.0;
  }
}
