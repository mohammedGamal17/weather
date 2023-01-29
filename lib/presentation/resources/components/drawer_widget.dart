import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/constants/app_constants.dart';
import '../../../app/dependency_injection/dependency_injection.dart';
import '../../../app/shared_pref/shared_pref.dart';
import '../../../generated/l10n.dart';
import '../../view_model/material/material_provider.dart';
import '../color/color_manager.dart';

class DrawerWidget extends StatefulWidget {
  const DrawerWidget({super.key});

  @override
  State<DrawerWidget> createState() => _DrawerWidgetState();
}

class _DrawerWidgetState extends State<DrawerWidget> {
  SingingLanguage? _character = SingingLanguage.english;

  @override
  Widget build(BuildContext context) {
    return Consumer<MaterialProvider>(
      builder: (context, provider, child) {
        return Drawer(
          child: SafeArea(
            child: Column(
              children: [
                Text(S.of(context).search),
                RadioListTile(
                  value: SingingLanguage.english,
                  groupValue: _character,
                  onChanged: (SingingLanguage? value) {
                    setState(() {
                      _character = value;
                      lang = 'en';
                      getIt<AppPreferences>().setLanguage(language: lang);
                    });
                    provider.changeLocal(local: lang);
                  },
                  activeColor: ColorManager.white,
                  title: Text(S.of(context).english),
                ),
                RadioListTile(
                  value: SingingLanguage.arabic,
                  title: Text(S.of(context).arabic),
                  groupValue: _character,
                  onChanged: (SingingLanguage? value) {
                    setState(() {
                      _character = value;
                      lang = 'ar';
                      getIt<AppPreferences>().setLanguage(language: lang);
                    });
                    provider.changeLocal(local: lang);
                  },
                  activeColor: ColorManager.white,
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
