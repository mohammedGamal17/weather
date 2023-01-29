import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/entities.dart';
import '../../../generated/l10n.dart';
import '../../view_model/weather/weather_provider.dart';
import '../color/color_manager.dart';
import '../values/values_manager.dart';
import 'components.dart';

class MainWidget extends StatelessWidget {
  const MainWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, provider, child) {
        Main main = provider.weather!.main;
        return Padding(
          padding: const EdgeInsets.all(8.0),
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
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(S.of(context).main),
                    // temperature
                    dataBuild(
                      context,
                      keyString: S.of(context).temperature,
                      value: provider.tempFormation(
                        kelvinTemp: main.temp,
                      ),
                      prefixIcon: Icons.device_thermostat,
                    ),
                    //feels_like
                    dataBuild(
                      context,
                      keyString: S.of(context).feelsLike,
                      value: provider.tempFormation(
                        kelvinTemp: main.feelsLike,
                      ),
                      prefixIcon: Icons.device_thermostat,
                    ),
                    // temp_min
                    dataBuild(
                      context,
                      keyString: S.of(context).low,
                      value: provider.tempFormation(
                        kelvinTemp: main.feelsLike,
                      ),
                      prefixIcon: Icons.device_thermostat,
                    ),
                    // temp_max
                    dataBuild(
                      context,
                      keyString: S.of(context).high,
                      value: provider.tempFormation(
                        kelvinTemp: main.feelsLike,
                      ),
                      prefixIcon: Icons.device_thermostat,
                    ),
                    // pressure
                    dataBuild(
                      context,
                      keyString: S.of(context).pressure,
                      value: main.pressure.toString(),
                      prefixIcon: Icons.compress,
                      measureUnit: S.of(context).hPa,
                    ),
                    // humidity
                    dataBuild(
                      context,
                      keyString: S.of(context).humidity,
                      value: main.humidity.toString(),
                      prefixIcon: Icons.water_drop_rounded,
                      measureUnit: S.of(context).percentage,
                    ),
                    // sea_level

                    dataBuild(
                      context,
                      keyString: S.of(context).seaLevel,
                      value: main.humidity.toString(),
                      prefixIcon: Icons.waves,
                      measureUnit: S.of(context).hPa,
                    ),
                    // ground Level
                    dataBuild(
                      context,
                      keyString: S.of(context).groundLevel,
                      value: main.humidity.toString(),
                      prefixIcon: Icons.forest,
                      measureUnit: S.of(context).hPa,
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
