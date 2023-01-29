import 'package:draggable_home/draggable_home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/dependency_injection/dependency_injection.dart';
import '../../../app/shared_pref/shared_pref.dart';
import '../../resources/color/color_manager.dart';
import '../../resources/components/city_search.dart';
import '../../resources/components/clouds.dart';
import '../../resources/components/components.dart';
import '../../resources/components/drawer_widget.dart';
import '../../resources/components/header.dart';
import '../../resources/components/main_details.dart';
import '../../resources/components/sun.dart';
import '../../resources/components/title.dart';
import '../../resources/components/wind.dart';
import '../../resources/string/string_manager.dart';
import '../../resources/values/values_manager.dart';
import '../../view_model/weather/weather_provider.dart';

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (BuildContext context) =>
          getIt<WeatherProvider>()..getWeatherByLocation(context),
      child: Consumer<WeatherProvider>(
        builder: (context, provider, child) {
          return provider.weather != null
              ? DraggableHome(
                  title: const TitleWidget(),
                  headerWidget: const HeaderWidget(),
                  drawer: const DrawerWidget(),
                  curvedBodyRadius: AppSize.s20,
                  headerExpandedHeight: 0.57,
                  actions: [
                    CitySearch(),
                    const SizedBox(width: AppSize.s10),
                  ],
                  body: const [
                    MainWidget(),
                    SizedBox(height: AppSize.s24),
                    WindWidget(),
                    SizedBox(height: AppSize.s24),
                    CloudsWidget(),
                    SizedBox(height: AppSize.s24),
                    SunWidget(),
                    SizedBox(height: AppSize.s24),
                  ],
                  fullyStretchable: false,
                  centerTitle: true,
                  backgroundColor: Theme.of(context).backgroundColor,
                )
              : AdaptiveCircleIndicator();
        },
      ),
    );
  }
}

