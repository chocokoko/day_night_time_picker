import 'package:day_night_time_picker/lib/state/state_container.dart';
import 'package:flutter/material.dart';

/// Just a simple [Container] with common styling
class WrapperContainer extends StatelessWidget {
  /// The child [Widget] to render
  final Widget child;

  /// The height of the Wheel section
  final double? heightOfWheel;

  /// Constructor for the [Widget]
  const WrapperContainer({
    Key? key,
    required this.child,
    this.heightOfWheel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final timeState = TimeModelBinding.of(context);
    final height = timeState.widget.is24HrFormat
        ? 150.0
        : timeState.widget.wheelHeight ?? 190.0;

    return Container(
      height: height,
      color: Theme.of(context).cardColor,
      child: child,
    );
  }
}
