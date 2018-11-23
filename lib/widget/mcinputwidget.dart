import 'package:flutter/material.dart';

///
/// @author MichaelChou
/// @date 2018/11/21 10:59 PM
/// 带图标的输入框
///

class MCInputWidget extends StatefulWidget {
  final bool obscureText;
  final String hintText;
  final IconData iconData;
  final ValueChanged<String> onChanged;
  final TextStyle textStyle;
  final TextEditingController controller;

  MCInputWidget(
      {Key key,
      this.hintText,
      this.iconData,
      this.onChanged,
      this.textStyle,
      this.controller,
      this.obscureText = false})
      : super(key: key);

  @override
  State<StatefulWidget> createState() => _MCInputWidgetState();
}

class _MCInputWidgetState extends State<MCInputWidget> {
  _MCInputWidgetState() : super();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      obscureText: widget.obscureText,
      decoration: new InputDecoration(
        hintText: widget.hintText,
        icon: widget.iconData == null ? null : new Icon(widget.iconData),
      ),
    );
  }
}
