import 'package:flutter/material.dart';

import '../../../core/extensions/build_context_extensions.dart';
import '../../../core/widgets/app/app_container.dart';
import '../../../core/widgets/app/app_listview.dart';
import '../../../core/widgets/app/buttons/subtle_button.dart';
import 'app_text.dart';

/// Item model for AppNavigationBar.
/// Provide an icon and/or label. You can control whether icon/label are shown.
class AppNavigationBarItem {
  final Widget? icon;
  final String? label;
  final bool showIcon;
  final bool showLabel;

  const AppNavigationBarItem({this.icon, this.label, this.showIcon = true, this.showLabel = false})
    : assert(icon != null || label != null, 'Either icon or label must be provided');
}

/// A flexible navigation bar container that can be placed anywhere and
/// switched between vertical/horizontal layouts.
///
/// - items: children items (AppNavigationBarItem)
/// - selectedIndex / onItemTap: selection handling (state is external)
/// - axis: Axis.vertical or Axis.horizontal
/// - thickness: width when vertical, height when horizontal
/// - alignment: where the whole bar is aligned (wrap with Align)
/// - wrapWithSubtleButtons: whether items are wrapped in SubtleButton
class AppNavigationBar extends StatelessWidget {
  final List<AppNavigationBarItem> items;
  final int selectedIndex;
  final ValueChanged<int> onItemTap;
  final Axis axis;
  final double thickness;
  final Alignment alignment;
  final bool wrapWithSubtleButtons;
  final EdgeInsetsGeometry padding;
  final double borderRadius;
  final Color? color;
  final Color? selectedItemColor;
  final Color? unselectedItemColor;
  final OutlinedBorder? selectedShape;

  const AppNavigationBar({
    super.key,
    required this.items,
    required this.selectedIndex,
    required this.onItemTap,
    this.axis = Axis.vertical,
    this.thickness = 50,
    this.alignment = Alignment.topLeft,
    this.wrapWithSubtleButtons = true,
    this.padding = const EdgeInsets.all(8),
    this.borderRadius = 100,
    this.color,
    this.selectedItemColor,
    this.unselectedItemColor,
    this.selectedShape,
  });

  Widget _buildItemContent(BuildContext context, AppNavigationBarItem item, bool isSelected) {
    final theme = context.theme;
    final label = item.label ?? '';
    final textStyle = theme.textTheme.labelMedium;
    final icon = item.icon;
    final children = <Widget>[];

    if (axis == Axis.vertical) {
      if (item.showIcon && icon != null) children.add(icon);
      if (item.showLabel && label.isNotEmpty) {
        if (children.isNotEmpty) children.add(const SizedBox(height: 4));
        children.add(
          LabelMediumText(
            label,
            config: AppTextConfiguration(style: textStyle, surface: isSelected),
          ),
        );
      }
      return Column(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.center, children: children);
    } else {
      if (item.showIcon && icon != null) children.add(icon);
      if (item.showLabel && label.isNotEmpty) {
        if (children.isNotEmpty) children.add(const SizedBox(width: 8));
        children.add(
          LabelMediumText(
            label,
            config: AppTextConfiguration(style: textStyle, surface: !isSelected),
          ),
        );
      }
      return Row(mainAxisSize: MainAxisSize.min, mainAxisAlignment: MainAxisAlignment.center, children: children);
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = context.theme;
    final bgColor = color ?? theme.cardColor;
    final unselectedColor = unselectedItemColor ?? theme.colorScheme.surface;
    final selColor = selectedItemColor ?? theme.iconTheme.color;
    final selectedBgColor = theme.cardColor;

    final children = <Widget>[];
    for (var i = 0; i < items.length; i++) {
      final item = items[i];
      final isSelected = i == selectedIndex;

      // Wrap the item content with an IconTheme so icons get proper color.
      final content = IconTheme.merge(
        data: IconThemeData(color: isSelected ? selColor : unselectedColor),
        child: _buildItemContent(context, item, isSelected),
      );

      if (wrapWithSubtleButtons) {
        children.add(
          SubtleButton(
            onPressed: () => onItemTap(i),
            buttonStyle: ButtonStyle(
              backgroundColor: isSelected ? WidgetStateProperty.all(selectedBgColor) : null,
              shape: WidgetStateProperty.all(
                selectedShape ?? RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)),
              ),
            ),
            child: Padding(padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 8.0), child: content),
          ),
        );
      } else {
        children.add(
          InkWell(
            onTap: () => onItemTap(i),
            child: Padding(padding: const EdgeInsets.all(6.0), child: content),
          ),
        );
      }
    }

    final container = AppContainer(
      color: bgColor,
      width: axis == Axis.vertical ? thickness : null,
      height: axis == Axis.horizontal ? thickness : null,
      borderRadius: BorderRadius.circular(borderRadius),
      child: AppListView(
        padding: padding,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        axis: axis,
        children: children,
      ),
    );

    return Align(alignment: alignment, child: container);
  }
}
