

import 'package:flutter/material.dart';
import 'package:incode/constants/app_colors.dart';
import 'package:shimmer/shimmer.dart';

extension WidgetExtensions on Widget {
  RepaintBoundary get repaintBoundary => RepaintBoundary(child: this);

  Widget expanded({int flex = 1, bool enabled = true}) =>
      enabled ? Expanded(flex: flex, child: this) : this;

  Widget flexible({
    int flex = 1,
    FlexFit fit = FlexFit.loose,
    bool enabled = true,
  }) =>
      enabled ? Flexible(flex: flex, fit: fit, child: this) : this;

  ConstrainedBox constrainedBox({
    double maxWidth = 450,
    double maxHeight = double.infinity,
  }) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth, maxHeight: maxHeight),
      child: this,
    );
  }

  // MouseRegion get mouseRegion => MouseRegion(
  //       cursor: SystemMouseCursors.click,
  //       child: this,
  //     );

  Shimmer get shimmerWidget => Shimmer.fromColors(
        baseColor: const Color.fromRGBO(0, 0, 0, 0.1),
        highlightColor: AppColors.kPrimary,
        enabled: true,
        child: this,
      );

  // FadeSlideTransition fadeScaleTransition({
  //   int delay = 0,
  //   AnimDirection direction = AnimDirection.bottomToTop,
  //   Duration duration = Durations.ms100,
  // }) {
  //   return FadeSlideTransition(
  //     animationDirection: direction,
  //     duration: duration,
  //     delay: delay,
  //     child: this,
  //   );
  // }

  Widget handleException({
    Widget? second,
    required Widget errorWidget,
  }) {
    try {
      return this;
    } catch (e) {
      try {
        return second ?? errorWidget;
      } catch (e) {
        return errorWidget;
      }
    }
  }

  PreferredSize get preferredSize {
    return PreferredSize(
      preferredSize: const Size.fromHeight(kToolbarHeight),
      child: this,
    );
  }

  SliverToBoxAdapter get sliverToBoxAdapter => SliverToBoxAdapter(child: this);

  SliverFillViewport get sliverFillViewPort => SliverFillViewport(
        delegate: SliverChildListDelegate(
          [this],
        ),
      );

  SliverFillRemaining get sliverFillRemaining => SliverFillRemaining(
        hasScrollBody: true,
        fillOverscroll: true,
        child: this,
      );
}

extension TextStyleX on TextStyle {
  /// A method to underline a text with a customizable [distance] between the text
  /// and underline. The [color], [thickness] and [style] can be set
  /// as the decorations of a [TextStyle].
  TextStyle underlined({
    Color? color,
    double distance = 1,
    double thickness = 1,
    TextDecorationStyle style = TextDecorationStyle.solid,
  }) {
    return copyWith(
      shadows: [
        Shadow(
          color: this.color ?? Colors.black,
          offset: Offset(0, -distance),
        )
      ],
      color: Colors.transparent,
      decoration: TextDecoration.underline,
      decorationThickness: thickness,
      decorationColor: color ?? this.color,
      decorationStyle: style,
    );
  }
}

extension EdgeInsetsX on EdgeInsets {
  EdgeInsets except({
    double? left,
    double? top,
    double? right,
    double? bottom,
    double? vertical,
    double? horizontal,
  }) {
    return copyWith(
      top: vertical ?? top ?? this.top,
      bottom: vertical ?? bottom ?? this.bottom,
      left: horizontal ?? left ?? this.left,
      right: horizontal ?? right ?? this.right,
    );
  }
}