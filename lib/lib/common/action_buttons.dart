import 'package:day_night_time_picker/lib/state/state_container.dart';
import 'package:flutter/material.dart';

/// Render the [Ok] and [Cancel] buttons
class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final timeState = TimeModelBinding.of(context);
    final color =
        timeState.widget.accentColor ?? Theme.of(context).colorScheme.secondary;
    final defaultButtonStyle = TextButton.styleFrom(
      textStyle: TextStyle(color: color),
    );

    if (timeState.widget.isOnValueChangeMode) {
      return const SizedBox(
        height: 8,
      );
    }
    const actionSheetHeight = 50.0;
    Widget actionSheet;
    if (!timeState.widget.showCancelButton) {
      actionSheet = SizedBox(
        width: double.infinity,
        height: actionSheetHeight,
        child: TextButton(
            style: TextButton.styleFrom(
                tapTargetSize: MaterialTapTargetSize.shrinkWrap),
            onPressed: timeState.onOk,
            child: Text(timeState.widget.okText)),
      );
    } else {
      actionSheet = Row(
        children: [
          Expanded(
            child: SizedBox(
              height: actionSheetHeight,
              child: TextButton(
                  style: TextButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                  onPressed: timeState.onOk,
                  child: Text(timeState.widget.okText)),
            ),
          ),
          const SizedBox(
            height: actionSheetHeight,
            child: VerticalDivider(
              width: 1,
              color: Colors.black38,
            ),
          ),
          Expanded(
            child: SizedBox(
              height: actionSheetHeight,
              child: TextButton(
                  style: TextButton.styleFrom(
                      tapTargetSize: MaterialTapTargetSize.shrinkWrap),
                  onPressed: timeState.widget.onCancel,
                  child: Text(timeState.widget.cancelText)),
            ),
          )
        ],
      );
    }

    return Column(
      children: [
      const Divider(
      height: 1,
      color: Colors.black38,
    ),
        actionSheet,
      ],
    );
  }
}
