import 'package:flutter/material.dart';

class CustomAvatar extends StatelessWidget {
  final double? radius;
  final String? imageUrl;
  final String? assetPath;
  final Color backgroundColor;
  final String? initials;
  final TextStyle? textStyle;
  final VoidCallback? onTap;

  const CustomAvatar({
    super.key,
    this.radius,
    this.imageUrl,
    this.assetPath,
    this.backgroundColor = Colors.grey,
    this.initials,
    this.textStyle,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    ImageProvider? imageProvider;

    if (imageUrl != null) {
      imageProvider = NetworkImage(imageUrl!);
    } else if (assetPath != null) {
      imageProvider = AssetImage(assetPath!);
    }

    Widget avatar = CircleAvatar(
      radius: radius,
      backgroundColor: backgroundColor,
      foregroundImage: imageProvider,
      child: initials != null
          ? Text(initials!, style: textStyle ?? const TextStyle(color: Colors.white))
          : null,
    );

    return onTap != null
        ? GestureDetector(onTap: onTap, child: avatar)
        : avatar;
  }
}
