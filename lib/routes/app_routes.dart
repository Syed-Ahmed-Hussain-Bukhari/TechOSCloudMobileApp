import 'package:etech_cricket_app/view/admin/admin_dashboard.dart';
import 'package:etech_cricket_app/view/auth_screen/login_screen.dart';
import 'package:etech_cricket_app/view/auth_screen/signUp_Screen.dart';
import 'package:etech_cricket_app/view/coach/coachScreen.dart';
import 'package:etech_cricket_app/view/coach/coach_dashboard.dart';
import 'package:etech_cricket_app/view/player/home_screen/playerVideos.dart';
import 'package:etech_cricket_app/view/player/home_screen/home.dart';
import 'package:etech_cricket_app/view/player/home_screen/player_uploaded_video%20(1).dart';
import 'package:etech_cricket_app/view/player/home_screen/player_uploaded_video%20(2).dart';
import 'package:etech_cricket_app/view/player/home_screen/player_uploaded_video%20(3).dart';
import 'package:etech_cricket_app/view/player/home_screen/player_uploaded_video.dart';
import 'package:etech_cricket_app/view/player/player_profile_screen/edit_profile_screen.dart';
import 'package:etech_cricket_app/view/player/player_profile_screen/profile_screen.dart';
import 'package:etech_cricket_app/view/selectionScreen.dart';
import 'package:etech_cricket_app/view/splashScreen.dart';
import 'package:etech_cricket_app/view/startScreen/height_screen.dart';
import 'package:etech_cricket_app/view/startScreen/player_infromation_screen.dart';
import 'package:etech_cricket_app/view/startScreen/player_personal_info.dart';
import 'package:etech_cricket_app/view/startScreen/player_roles.dart';
import 'package:etech_cricket_app/view/startScreen/weight_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AppRoutes {
  static String splashScreen= '/';
  static const String registration = '/register';
  static const String login = '/login';
  static const String selectionScreen = '/selectionScreen';
  static const String home = '/home';
  static const String coach = '/coach';
  static const String profileScreen = '/profileScreen';
  static const String editProfileScreen = '/editProfileScreen';
  static const String dashboardScreen = '/dashboardScreen';
  static const String heightScreen = '/heightScreen';
  static const String weightScreen = '/weightScreen';
  static const String playerInfromationScreen = '/playerInfromationScreen';
  static const String coachDashboardScreen = '/coachDashboardScreen';
  static const String adminDashboard = '/adminDashboard';
  // static const String  playerHomeScreen = '/ playerHomeScreen';

  static final List<GetPage> routes = [
   
     GetPage<Route<dynamic>>(
      name: splashScreen,
      page: () => SplashScreen(),
    ),
  
     GetPage<Route<dynamic>>(
      name: adminDashboard,
      page: () => AdminHomePage(),
    ),
    GetPage<Route<dynamic>>(
      name: coachDashboardScreen,
      page: () => CoachDashboardScreen(),
    ),
     GetPage<Route<dynamic>>(
      name: playerInfromationScreen,
      page: () => PlayerInformationScreen(),
    ),
     GetPage<Route<dynamic>>(
      name: heightScreen,
      page: () => HeightScreen(),
    ),
     GetPage<Route<dynamic>>(
      name: weightScreen,
      page: () => WeightScreen(),
    ),
    
     GetPage<Route<dynamic>>(
      name: dashboardScreen,
      page: () => PlayerVideosScreen(),
    ),
      GetPage<Route<dynamic>>(
      name: profileScreen,
      page: () => ProfileScreen(),
    ),
      GetPage<Route<dynamic>>(
      name: editProfileScreen,
      page: () => EditProfileScreen(),
    ),
     GetPage<Route<dynamic>>(
      name: selectionScreen,
      page: () => SelectionScreen(),
    ),
    GetPage<Route<dynamic>>(
      name: coach,
      page: () => CoachScreen(),
    ),
    GetPage(
      name: registration,
      page: () => RegistrationScreen(),
    ),
    GetPage(
      name: login,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: home,
      page: () => HomeScreen(),
    ),
  ];
}
