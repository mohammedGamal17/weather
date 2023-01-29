import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quickalert/quickalert.dart';

import '../../../app/constants/app_constants.dart';
import '../../../generated/l10n.dart';
import '../color/color_manager.dart';
import '../values/values_manager.dart';

Widget separator({
  double verticalPadding = AppPadding.p20,
  double horizontalPadding = AppPadding.p20,
}) {
  return Padding(
    padding: EdgeInsets.symmetric(
      vertical: verticalPadding,
      horizontal: horizontalPadding,
    ),
    child: Container(
      height: 2.0,
      decoration: BoxDecoration(
        color: ColorManager.background,
        gradient: LinearGradient(
          begin: AlignmentDirectional.topStart,
          end: AlignmentDirectional.bottomEnd,
          colors: [
            ColorManager.gradiantOne,
            ColorManager.gradiantTwo,
          ],
        ),
      ),
    ),
  );
}

Future alert(
  context, {
  required QuickAlertType quickAlertType,
  required String text,
  required Color textColor,
  double borderRadius = AppSize.s20,
  Widget? widget,
  Function? onConfirmBtnTap,
}) {
  return QuickAlert.show(
    context: context,
    type: quickAlertType,
    textColor: textColor,
    text: text,
    borderRadius: borderRadius,
    confirmBtnColor: ColorManager.primary,
    onConfirmBtnTap: () => onConfirmBtnTap!(),
    widget: widget,
    animType: QuickAlertAnimType.slideInUp,
  );
}

Future noInternet(
  context, {
  Function? onConfirmBtnTap,
}) {
  return alert(
    context,
    quickAlertType: QuickAlertType.error,
    text: S.of(context).noInternetError,
    textColor: ColorManager.error,
    onConfirmBtnTap: () => onConfirmBtnTap!(),
  );
}

class AdaptiveCircleIndicator extends StatelessWidget {
  AdaptiveCircleIndicator({Key? key}) : super(key: key);
  final String os = AppConstants.os;

  @override
  Widget build(BuildContext context) {
    if (os == 'IOS' || os == 'MacOS' || os == 'ios') {
      return Scaffold(
        backgroundColor: Theme.of(context).backgroundColor,
        body: Center(
          child: CupertinoActivityIndicator(
            color: Theme.of(context).primaryColorLight,
          ),
        ),
      );
    }
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: Center(
        child: CircularProgressIndicator(
          backgroundColor: Theme.of(context).backgroundColor,
          color: Theme.of(context).primaryColorLight,
        ),
      ),
    );
  }
}

Widget dataBuild(
  context, {
  required String keyString,
  required String value,
  IconData? prefixIcon,
  String? measureUnit,
}) {
  return Row(
    children: [
      prefixIcon != null
          ? Icon(
              prefixIcon,
              shadows: [
                Shadow(
                  color: ColorManager.white,
                  blurRadius: AppSize.s4,
                ),
              ],
            )
          : const SizedBox(),
      const SizedBox(width: AppSize.s6),
      Text(
        keyString,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              overflow: TextOverflow.ellipsis,
            ),
      ),
      Text(
        ':',
        style: Theme.of(context).textTheme.bodyLarge,
      ),
      const SizedBox(width: AppSize.s10),
      Text(
        value,
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              overflow: TextOverflow.ellipsis,
            ),
      ),
      const SizedBox(width: AppSize.s4),
      measureUnit != null
          ? Expanded(
              child: Text(
                measureUnit,
                style: Theme.of(context).textTheme.titleSmall!.copyWith(
                      overflow: TextOverflow.ellipsis,
                    ),
              ),
            )
          : const SizedBox(),
    ],
  );
}
