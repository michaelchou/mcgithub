import 'package:flutter/material.dart';

/*
 * @Author: MichaelChou 
 * @Date: 2018-11-23 20:54:38 
 * @Last Modified by: MichaelChou
 * @Last Modified time: 2018-11-23 21:46:46
 */

class MCFlexButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final VoidCallback onPress;
  final double fontSize;
  final int maxLines;
  final MainAxisAlignment mainAxisAlignment;
  MCFlexButton(
      {Key key,
      this.text,
      this.color,
      this.textColor,
      this.onPress,
      this.fontSize = 20.0,
      this.maxLines,
      this.mainAxisAlignment = MainAxisAlignment.center})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      padding:
          new EdgeInsets.only(left: 20.0, top: 10.0, right: 20.0, bottom: 10.0),
      textColor: textColor,
      color: color,
      child: new Flex(
        mainAxisAlignment: mainAxisAlignment,
        direction: Axis.horizontal,
        children: <Widget>[
          new Text(
            text,
            style: new TextStyle(fontSize: fontSize),
            maxLines: maxLines,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
      onPressed: () {
        this.onPress?.call();
      },
    );
  }
}
