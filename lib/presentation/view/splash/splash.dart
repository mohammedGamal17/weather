import 'dart:async';

import 'package:flutter/material.dart';

import '../../../app/constants/app_constants.dart';
import '../../../app/dependency_injection/dependency_injection.dart';
import '../../../app/shared_pref/shared_pref.dart';
import '../../resources/assets/assets_res.dart';
import '../../resources/color/color_manager.dart';
import '../home/home.dart';
import '../on_boarding/on_boarding.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  final AppPreferences _appPreferences = getIt<AppPreferences>();

  _startDelay() {
    _timer = Timer(const Duration(seconds: AppConstants.splashDelay), _goNext);
  }

  _goNext() {
    _appPreferences.getIsOnBoarding().then(
      (isOnBoardingShow) {
        if (isOnBoardingShow) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const Home()),
          );
        } else {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const OnBoarding()),
          );
        }
      },
    );
  }

  @override
  void initState() {
    _startDelay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              ColorManager.gradiantTwo,
              ColorManager.primary,
              ColorManager.gradiantOne,
              ColorManager.background,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: Image(
            image: const AssetImage(AssetsResources.logo),
            height: MediaQuery.of(context).size.height / 3,
            width: MediaQuery.of(context).size.width / 3,
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }
}
