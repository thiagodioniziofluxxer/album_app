import 'package:flutter/material.dart';

import 'package:album_app/app/core/ui/styles/color_app.dart';
import 'package:album_app/app/core/ui/styles/text_style.dart';

class StatusTile extends StatelessWidget {
  final Image icon;
  final String label;
  final int value;
  const StatusTile({
    Key? key,
    required this.icon,
    this.label = '',
    this.value = 0,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: MediaQuery.of(context).size.width * .7,
        child: ListTile(
          leading: SizedBox(
            child: CircleAvatar(
              radius: 46,
              backgroundColor: context.colors.grey,
              child: icon,
            ),
          ),
          contentPadding: EdgeInsets.zero,
          title: Text(
            label,
            style: context.textStyles.textPrimaryFontRegular
                .copyWith(color: Colors.white),
          ),
          trailing: Text(
            value.toString(),
            style: context.textStyles.textPrimaryFontRegular
                .copyWith(color: Colors.white),
          ),
        ));
  }
}
