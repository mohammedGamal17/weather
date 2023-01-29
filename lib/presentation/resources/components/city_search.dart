import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../generated/l10n.dart';
import '../../view_model/weather/weather_provider.dart';
import '../color/color_manager.dart';
import '../values/values_manager.dart';

class CitySearch extends StatelessWidget {
  CitySearch({super.key});

  final TextEditingController city = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Consumer<WeatherProvider>(
      builder: (context, provider, child) {
        return IconButton(
          onPressed: () {
            showBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
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
                    borderRadius: const BorderRadius.vertical(
                      top: Radius.circular(AppSize.s20),
                    ),
                  ),
                  height: MediaQuery.of(context).size.height / AppSize.s3,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(AppPadding.p10),
                          child: TextFormField(
                            controller: city,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              hintText: S.of(context).cairo,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  AppSize.s10,
                                ),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(
                                  AppSize.s10,
                                ),
                                borderSide: BorderSide(
                                  color: ColorManager.white,
                                ),
                              ),
                            ),
                            autofocus: true,
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(AppPadding.p10),
                          child: MaterialButton(
                            onPressed: () {
                              provider.getWeatherByCity(
                                context,
                                city: city.text,
                              );
                              Navigator.pop(context);
                            },
                            height: AppSize.s50,
                            color: ColorManager.white,
                            shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(AppSize.s10),
                              borderSide: BorderSide(color: ColorManager.white),
                            ),
                            minWidth: double.infinity,
                            child: Text(S.of(context).search),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          },
          icon: const Icon(Icons.add),
        );
      },
    );
  }
}
