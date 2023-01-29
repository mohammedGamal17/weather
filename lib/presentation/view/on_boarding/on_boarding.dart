import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:introduction_screen/introduction_screen.dart';
import 'package:lottie/lottie.dart';

import '../../../app/dependency_injection/dependency_injection.dart';
import '../../../app/shared_pref/shared_pref.dart';
import '../../resources/assets/assets_res.dart';
import '../../resources/color/color_manager.dart';
import '../../resources/values/values_manager.dart';
import '../home/home.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});

  List<PageViewModel> listPagesViewModel(context) {
    return [
      PageViewModel(
        bodyWidget: Column(
          children: [
            Center(
              child: Lottie.asset(
                JsonResources.weather,
                height: AppSize.s300,
                width: AppSize.s300,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: AppSize.s10),
            const Text(
              'Get your location and any city weather from all over the world',
            ),
          ],
        ),
        title: 'Weather',
      ),
      PageViewModel(
        title: 'Allow location',
        bodyWidget: Column(
          children: [
            Lottie.asset(
              JsonResources.location,
              height: AppSize.s300,
              width: AppSize.s300,
              fit: BoxFit.cover,
            ),
            const SizedBox(height: AppSize.s10),
            const Text('Allow location to get your city weather'),
          ],
        ),
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    Future<bool> determinePosition() async {
      bool serviceEnabled;
      LocationPermission permission;

      bool isAccepted = false;
      serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        return Future.error('Location services are disabled.');
      }

      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          isAccepted = false;
          return Future.error('Location permissions are denied');
        }
        isAccepted = false;
      }

      if (permission == LocationPermission.deniedForever) {
        isAccepted = false;
        return Future.error(
            'Location permissions are permanently denied, we cannot request permissions.');
      } else {
        isAccepted = true;
      }
      return isAccepted;
    }

    return IntroductionScreen(
      pages: listPagesViewModel(context),
      onDone: () {
        determinePosition().then(
          (value) {
            if (value == true) {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Home(),
                ),
              );
              getIt<AppPreferences>().setIsOnBoarding();
            } else {
              determinePosition();
            }
          },
        );
      },
      onSkip: () {},
      showBackButton: false,
      showSkipButton: false,
      next: Icon(Icons.navigate_next,color: ColorManager.white),
      done: Text(
        "Done",
        style: TextStyle(
          fontWeight: FontWeight.w600,
          color: ColorManager.white,
        ),
      ),
      globalBackgroundColor: ColorManager.primary,
      animationDuration: 500,
      scrollPhysics: const BouncingScrollPhysics(),
      dotsDecorator: DotsDecorator(
        size: const Size.square(10.0),
        activeSize: const Size(20.0, 10.0),
        color: ColorManager.white,
        spacing: const EdgeInsets.symmetric(horizontal: 3.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25.0),
        ),
      ),
    );
  }
}
