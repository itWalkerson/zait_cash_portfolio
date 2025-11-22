import 'package:amazing_icons/amazing_icons.dart';
import 'package:flutter/material.dart';

import '../extensions/build_context_extensions.dart';
import '../extensions/int_extensions.dart';
import '../packages/context_menu/context_menu_area.dart';
import '../utils/constants.dart';
import 'app/app_text.dart';

Future<void> itemContextMenu(
  BuildContext context,
  Offset position, {
  void Function()? onInfo,
  void Function()? onDelete,
  void Function()? onNameEdit,
  void Function()? onCommandEdit,
  void Function()? onOpenLocation,
}) async => await showContextMenu(
  position,
  context,
  (context) => [
    itemBuild(
      context,
      onTap: () {
        context.pop();
        onNameEdit?.call();
      },
      icon: AmazingIconOutlined.edit,
      text: 'Edit',
    ),
    itemBuild(
      context,
      onTap: () {
        context.pop();
        onDelete?.call();
      },
      icon: AmazingIconOutlined.trash,
      text: 'Delete',
    ),
  ],
  kPadding.medium.toDouble(),
  kContextMenu.width,
);

Widget itemBuild(BuildContext context, {required IconData icon, required String text, void Function()? onTap}) {
  return Padding(
    padding: kPadding.small.pHori,
    child: ListTile(
      onTap: onTap,
      minTileHeight: kContextMenu.height,
      hoverColor: context.theme.hoverColor,
      leading: Icon(icon, size: kIconSize.small, color: context.iconColor),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kBorderRadius.outer)),
      title: BodySmallText(text, config: AppTextConfiguration(color: context.theme.colorScheme.onSurface)),
    ),
  );
}
