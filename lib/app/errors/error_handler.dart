import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../presentation/resources/assets/assets_res.dart';
import '../../presentation/resources/color/color_manager.dart';
import '../../presentation/resources/values/values_manager.dart';

errorHandler() {
  return ErrorWidget.builder = (details) {
    return Material(
      color: ColorManager.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(JsonResources.notFound),
          const SizedBox(height: AppSize.s10),
          Text(details.summary.toString()),
        ],
      ),
    );
  };
}
