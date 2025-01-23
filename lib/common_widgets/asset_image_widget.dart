import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class AssetImageWidget extends StatelessWidget {
  final String path;

  final double? width;

  final double? height;

  final Color? color;

  final BoxFit fit;

  final String? semanticLabel;

  final EdgeInsets? padding;

  final VoidCallback? onTap;

  const AssetImageWidget({
    super.key,
    required this.path,
    this.width,
    this.height,
    this.color,
    this.fit = BoxFit.contain,
    this.semanticLabel,
    this.padding,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: padding ?? EdgeInsets.zero,
        child: path.endsWith('svg')
            ? SvgPicture.asset(
                path,
                width: width,
                height: height,
                colorFilter: color != null
                    ? ColorFilter.mode(color!, BlendMode.srcIn)
                    : null,
                fit: fit,
              )
            : Image.asset(
                path,
                width: width,
                height: height,
                color: color,
                fit: fit,
              ),
      ),
    );
  }
}
