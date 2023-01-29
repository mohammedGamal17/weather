import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../domain/entities/entities.dart';
import '../../../generated/l10n.dart';
import '../../view_model/weather/weather_provider.dart';
import '../color/color_manager.dart';
import '../values/values_manager.dart';

class CloudsWidget extends StatelessWidget {
  const CloudsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, provider, child) {
        Clouds clouds = provider.weather!.clouds;

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
                          Icons.cloud_rounded,
                          shadows: [
                            Shadow(
                              color: ColorManager.white,
                              blurRadius: AppSize.s4,
                            )
                          ],
                          size: AppSize.s30,
                        ),
                        const SizedBox(width: AppSize.s6),
                        Text(S.of(context).clouds),
                      ],
                    ),
                    const SizedBox(height: AppSize.s10),
                    Row(
                      children: [
                        Text(
                          S.of(context).cloudiness,
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        Text(
                          ':',
                          style: Theme.of(context).textTheme.bodyLarge,
                        ),
                        const SizedBox(width: AppSize.s10),
                        Text(
                          clouds.all.toString(),
                          style:
                              Theme.of(context).textTheme.bodyLarge!.copyWith(
                                    overflow: TextOverflow.ellipsis,
                                  ),
                        ),
                        Expanded(
                          child: Text(
                            S.of(context).percentage,
                            style: Theme.of(context)
                                .textTheme
                                .titleSmall!
                                .copyWith(
                                  overflow: TextOverflow.ellipsis,
                                ),
                          ),
                        )
                      ],
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
