import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/entities.dart';
import '../../../generated/l10n.dart';
import '../../view_model/weather/weather_provider.dart';
import '../color/color_manager.dart';
import '../values/values_manager.dart';
import 'components.dart';

class WindWidget extends StatelessWidget {
  const WindWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, provider, child) {
        Wind wind = provider.weather!.wind;
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
                    Row(
                      children: [
                        Icon(
                          Icons.air,
                          shadows: [
                            Shadow(
                              color: ColorManager.white,
                              blurRadius: AppSize.s4,
                            )
                          ],
                          size: AppSize.s30,
                        ),
                        const SizedBox(width: AppSize.s6),
                        Text(S.of(context).airQuality),
                      ],
                    ),
                    const SizedBox(height: AppSize.s10),
                    dataBuild(
                      context,
                      keyString: S.of(context).windSpeed,
                      value: wind.speed.toString(),
                      measureUnit: S.of(context).meterPerSec,
                    ),
                    dataBuild(
                      context,
                      keyString: S.of(context).windGust,
                      value: wind.gust.toString(),
                      measureUnit: S.of(context).meterPerSec,
                    ),
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
