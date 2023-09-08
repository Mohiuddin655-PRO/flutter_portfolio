import 'package:flutter/material.dart';
import 'package:flutter_androssy/extensions.dart';
import 'package:flutter_androssy/services.dart';
import 'package:flutter_androssy/widgets.dart';

class ToolbarNavigationItem {
  final dynamic icon;
  final ValueState<dynamic>? iconState;
  final String title;
  final ValueState<String>? titleState;

  const ToolbarNavigationItem({
    this.icon,
    this.iconState,
    this.title = "",
    this.titleState,
  });
}

class ToolbarNavigation extends YMRView<ToolbarNavigationController> {
  final int currentIndex;
  final List<ToolbarNavigationItem> items;
  final OnViewItemChangeListener<int>? onIndexChange;

  const ToolbarNavigation({
    /// BASE PROPERTIES
    super.key,
    super.controller,

    /// BORDER PROPERTIES
    super.borderColor,
    super.borderColorState,
    super.borderSize,
    super.borderSizeState,
    super.borderHorizontal,
    super.borderHorizontalState,
    super.borderVertical,
    super.borderVerticalState,
    super.borderTop,
    super.borderTopState,
    super.borderBottom,
    super.borderBottomState,
    super.borderStart,
    super.borderStartState,
    super.borderEnd,
    super.borderEndState,

    /// BORDER RADIUS PROPERTIES
    super.borderRadius,
    super.borderRadiusState,
    super.borderRadiusBL,
    super.borderRadiusBLState,
    super.borderRadiusBR,
    super.borderRadiusBRState,
    super.borderRadiusTL,
    super.borderRadiusTLState,
    super.borderRadiusTR,
    super.borderRadiusTRState,

    ///
    ///
    ///
    ///
    super.absorbMode,
    super.activated,
    super.animation,
    super.animationType,
    super.background,
    super.backgroundState,
    super.backgroundBlendMode,
    super.backgroundGradient,
    super.backgroundGradientState,
    super.backgroundImage,
    super.backgroundImageState,
    super.clipBehavior,
    super.dimensionRatio,
    super.elevation,
    super.enabled,
    super.foreground,
    super.foregroundBlendMode,
    super.foregroundGradient,
    super.foregroundImage,
    super.flex,
    super.gravity,
    super.height,
    super.heightMax,
    super.heightMin,
    super.hoverColor,
    super.margin,
    super.marginHorizontal,
    super.marginVertical,
    super.marginTop,
    super.marginBottom,
    super.marginStart,
    super.marginEnd,
    super.orientation,
    super.padding,
    super.paddingHorizontal,
    super.paddingVertical,
    super.paddingTop,
    super.paddingBottom,
    super.paddingStart,
    super.paddingEnd,
    super.position,
    super.positionType,
    super.pressedColor,
    super.rippleColor,
    super.scrollable,
    super.scrollingType,
    super.scrollController,
    super.shadow,
    super.shadowBlurRadius,
    super.shadowBlurStyle,
    super.shadowColor,
    super.shadowType,
    super.shadowSpreadRadius,
    super.shadowHorizontal,
    super.shadowVertical,
    super.shadowStart,
    super.shadowEnd,
    super.shadowTop,
    super.shadowBottom,
    super.shape,
    super.transform,
    super.transformGravity,
    super.width,
    super.widthMax,
    super.widthMin,
    super.visibility,
    this.currentIndex = 0,
    this.items = const [],
    this.onIndexChange,
  });

  @override
  ToolbarNavigationController initController() {
    return ToolbarNavigationController();
  }

  @override
  ToolbarNavigationController attachController(controller) {
    return controller.fromToolbarNavigation(this);
  }

  @override
  Widget? attach(context, controller) {
    return LinearLayout(
      orientation: Axis.horizontal,
      layoutGravity: LayoutGravity.center,
      children: List.generate(items.length, (index) {
        var item = items[index];
        var mTitle = item.titleState?.fromController(controller) ?? item.title;
        return TextView(
          onClick: (context) => controller.setIndex(context, index),
          activated: index == controller.currentIndex,
          pressedColor: context.primaryColor.withOpacity(0.1),
          rippleColor: context.primaryColor.withOpacity(0.1),
          text: mTitle,
          paddingVertical: 8,
          paddingHorizontal: 4,
          marginHorizontal: 12,
          borderColorState: const ValueState(
            primary: Colors.transparent,
            secondary: Colors.black,
          ),
          borderBottom: 2,
          textColorState: const ValueState(
            primary: Colors.grey,
            secondary: Colors.black,
          ),
        );
      }),
    );
  }
}

class ToolbarNavigationController extends ViewController {
  ToolbarNavigationController fromToolbarNavigation(ToolbarNavigation view) {
    super.fromView(view);
    currentIndex = view.currentIndex;
    items = view.items;
    onIndexChange = view.onIndexChange;
    return this;
  }

  int get size => items.length;

  List<ToolbarNavigationItem> items = [];

  void setItems(List<ToolbarNavigationItem> value) {
    onNotifyWithCallback(() => items = value);
  }

  OnViewItemChangeListener<int>? _onIndexChange;

  OnViewItemChangeListener<int>? get onIndexChange {
    return enabled ? _onIndexChange : null;
  }

  set onIndexChange(OnViewItemChangeListener<int>? value) {
    _onIndexChange ??= value;
  }

  void setOnItemIndexChangeListener(OnViewItemChangeListener<int>? listener) {
    _onIndexChange = listener;
  }

  /// CUSTOMIZATIONS
  int currentIndex = 0;

  void setIndex(BuildContext context, int index) {
    onNotifyWithCallback(() {
      currentIndex = index;
      onIndexChange?.call(context, currentIndex);
    });
  }
}
