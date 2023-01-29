import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/entities.dart';
import '../../../generated/l10n.dart';
import '../../view_model/weather/weather_provider.dart';
import '../color/color_manager.dart';
import '../values/values_manager.dart';
import 'components.dart';

class SunWidget extends StatelessWidget {
  const SunWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, provider, child) {
        Sys sys = provider.weather!.sys;
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: AppPadding.p8),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(AppSize.s20),
            child: Container(
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
              child: Padding(
                padding: const EdgeInsets.all(AppPadding.p10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(
                      Icons.sunny,
                      shadows: [
                        Shadow(
                          color: ColorManager.white,
                          blurRadius: AppSize.s4,
                        )
                      ],
                      size: AppSize.s30,
                    ),
                    Text(
                      S.of(context).sunrise,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(provider.convertTimeStamp(timeStamp: sys.sunrise)),
                    separator(horizontalPadding: AppPadding.p0),
                    Icon(
                      Icons.dark_mode,
                      shadows: [
                        Shadow(
                          color: ColorManager.white,
                          blurRadius: AppSize.s4,
                        )
                      ],
                      size: AppSize.s30,
                    ),
                    Text(
                      S.of(context).sunset,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    Text(provider.convertTimeStamp(timeStamp: sys.sunset)),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
