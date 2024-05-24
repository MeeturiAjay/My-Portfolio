import 'package:flutter/material.dart';

import 'app_text_styles.dart';
import 'appcolors.dart';

class AppButtons {
  static MaterialButton buildMaterialButton({
    required String buttonName,
    required VoidCallback onTap,
  }) {
    return MaterialButton(
      onPressed: onTap,
      color: AppColors.themeColor,
      splashColor: AppColors.lawGreen,
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30.0), borderSide: BorderSide.none),
      elevation: 6.0,
      height: 47.0,
      minWidth: 143.0,
      hoverColor: AppColors.aqua,
      child: Text(buttonName, style: AppTextStyles.headerTextStyle(fontSize: 18.0), ),
    );
  }
}