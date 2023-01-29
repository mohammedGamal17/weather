import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../generated/l10n.dart';
import '../../view_model/weather/weather_provider.dart';
import '../assets/assets_res.dart';
import '../values/values_manager.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, provider, child) {
        bool isMorning = provider.isMorning(
          sunrise: provider.weather!.sys.sunrise,
          sunset: provider.weather!.sys.sunset,
          dateTime: provider.weather!.dt,
        );
        String icon = provider.weather!.weather[0].icon;
        return Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(
                isMorning ? AssetsResources.morning : AssetsResources.night,
              ),
              fit: BoxFit.cover,
            ),
          ),
          padding: const EdgeInsets.only(top: AppPadding.p50),
          child: SafeArea(
            child: Column(
              children: [
                Text(
                  provider.weather!.name,
                  style: Theme.of(context)
                      .textTheme
                      .headlineSmall!
                      .copyWith(height: 1.0),
                ),
                Text(
                  provider.tempFormation(
                    kelvinTemp: provider.weather!.main.temp,
                  ),
                  textAlign: TextAlign.start,
                  style: Theme.of(context)
                      .textTheme
                      .headlineLarge!
                      .copyWith(height: 1.0),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image(
                      image: NetworkImage(
                        'http://openweathermap.org/img/wn/$icon@2x.png',
                      ),
                      fit: BoxFit.cover,
                    ),
                    Text(
                      provider.weather!.weather[0].main,
                      style: Theme.of(context).textTheme.headlineSmall,
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // High (عظمي)
                    Text(
                      S.of(context).high,
                      textAlign: TextAlign.start,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(height: 1.0),
                    ),
                    Text(
                      provider.tempFormation(
                        kelvinTemp: provider.weather!.main.tempMax,
                      ),
                      textAlign: TextAlign.start,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(height: 1.0),
                    ),
                    const SizedBox(width: AppSize.s10),
                    // Low (صغرى)
                    Text(
                      S.of(context).low,
                      textAlign: TextAlign.start,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(height: 1.0),
                    ),
                    Text(
                      provider.tempFormation(
                        kelvinTemp: provider.weather!.main.tempMin,
                      ),
                      textAlign: TextAlign.start,
                      style: Theme.of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(height: 1.0),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
