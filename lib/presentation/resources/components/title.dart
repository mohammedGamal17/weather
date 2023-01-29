import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../view_model/weather/weather_provider.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, provider, child) {
        return Column(
          children: [
            Text(
              provider.weather!.name,
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  provider.tempFormation(
                    kelvinTemp: provider.weather!.main.temp,
                  ),
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(height: 1.0),
                ),
                Text(
                  ' | ',
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(height: 1.0),
                ),
                Text(
                  provider.weather!.weather[0].main,
                  style: Theme.of(context)
                      .textTheme
                      .bodyMedium!
                      .copyWith(height: 1.0),
                ),
              ],
            ),
          ],
        );
      },
    );
  }
}
