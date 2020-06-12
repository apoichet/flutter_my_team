import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fc_parisii/services/responsive_size.dart';
import 'package:fc_parisii/services/widget_service.dart';
import 'package:fc_parisii/theme/font_family.dart';

class WidgetToggle extends StatefulWidget {

  final String header;
  final String image1;
  final String image2;
  final Color menuUnderlineColor;
  final String title1;
  final Color colorDisabledTitle1;
  final Color colorEnabledTitle1;
  final String title2;
  final Color colorDisabledTitle2;
  final Color colorEnabledTitle2;
  final Widget widget1;
  final Widget widget2;
  final double leftPadding;
  final double rightPadding;
  final double bottomPadding;
  final Function callBackParent;
  final bool toggleLeft;

  WidgetToggle({
    this.header,
    this.image1,
    this.image2,
    this.menuUnderlineColor,
    this.title1,
    this.colorDisabledTitle1,
    this.colorEnabledTitle1,
    this.title2,
    this.colorDisabledTitle2,
    this.colorEnabledTitle2,
    this.widget1,
    this.widget2,
    this.leftPadding = 15.0,
    this.rightPadding = 15.0,
    this.bottomPadding = 30.0,
    this.callBackParent,
    this.toggleLeft
  });

  @override
  _WidgetToggleState createState() => _WidgetToggleState();
}

class _WidgetToggleState extends State<WidgetToggle> {

  bool _toggleLeft;
  bool _toggleRight;

  @override
  void initState() {
    this._toggleLeft = widget.toggleLeft;
    this._toggleRight = !this._toggleLeft;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Expanded(
          child: _buildTitleMenus(),
        ),
        Expanded(
          flex: 8,
          child: Padding(
            padding: EdgeInsets.only(
                left: getResponsiveWidth(widget.leftPadding),
                right: getResponsiveWidth(widget.rightPadding),
                top: getResponsiveHeight(10.0)
            ),
            child: _toggleLeft ? widget.widget1 : widget.widget2,
          ),
        )
      ],
    );
  }

  _buildTitleMenus() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildText(
              text: widget.title1,
              textColor: _toggleLeft ? widget.colorEnabledTitle1 : widget.colorDisabledTitle1,
              weight: _toggleLeft ? FontWeight.bold : FontWeight.normal,
              left: true
          ),
          _buildText(
              text: widget.title2,
              textColor: _toggleRight ? widget.colorEnabledTitle2 : widget.colorDisabledTitle2,
              weight: _toggleRight ? FontWeight.bold : FontWeight.normal,
              left: false
          ),
        ]
    );
  }

  _buildText({String text, Color textColor, FontWeight weight, bool left}) {
    return GestureDetector(
      onTap: () => _toggleMenu(left),
      child: Container(
        padding: EdgeInsets.only(bottom: 3.0),
        child: buildWidgetText(
            color: textColor,
            fontSize: getResponsiveHeight(23.0),
            text: text,
            family: FontFamily.ARIAL,
            weight: weight
        ),
      ),
    );
  }

  _toggleMenu(bool left) {
    setState(() {
      if(left && !_toggleLeft) {
        _toggleLeft = true;
        _toggleRight = false;
      }
      if(!left && !_toggleRight) {
        _toggleLeft = false;
        _toggleRight = true;
      }
      widget.callBackParent(_toggleLeft);
    });
  }

}
