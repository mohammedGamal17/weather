import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

import '../../../app/dependency_injection/dependency_injection.dart';
import '../../resources/assets/assets_res.dart';
import '../../resources/string/string_manager.dart';
import '../../resources/values/values_manager.dart';
import '../../view_model/weather/weather_provider.dart';

class EnableLocation extends StatelessWidget {
  const EnableLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) => getIt<WeatherProvider>(),
      child: Consumer<WeatherProvider>(
        builder: (context, provider, child) {
          LocationPermission permission;
          return Scaffold(
            backgroundColor: Theme.of(context).backgroundColor,
            body: Column(
              children: [
                Lottie.asset(JsonResources.notFound),
                const SizedBox(height: AppSize.s10),
                const Text(StringManager.locationNotEnable),
                TextButton(
                  onPressed: () async {
                    permission = await Geolocator.requestPermission();
                  },
                  child: const Text(StringManager.enable),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
