import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/components/view_scaffold.dart';
import 'package:my_team/services/responsive_size.dart';
import 'package:my_team/services/widget_service.dart';
import 'package:my_team/theme/font_family.dart';

import 'background_image.dart';
import 'header.dart';

class MenuToggle extends StatefulWidget {

  final String header;
  final Color backgroundHeader1;
  final Color backgroundHeader2;
  final String image1;
  final String image2;
  final Color menuUnderlineColor;
  final String menuTitle1;
  final Color colorDisabledMenuTitle1;
  final Color colorEnabledMenuTitle1;
  final String menuTitle2;
  final Color colorDisabledMenuTitle2;
  final Color colorEnabledMenuTitle2;
  final Widget widgetMenu1;
  final Widget widgetMenu2;
  final double leftPadding;
  final double rightPadding;
  final double bottomPadding;

  MenuToggle({
    this.header,
    this.backgroundHeader1,
    this.backgroundHeader2,
    this.image1,
    this.image2,
    this.menuUnderlineColor,
    this.menuTitle1,
    this.colorDisabledMenuTitle1,
    this.colorEnabledMenuTitle1,
    this.menuTitle2,
    this.colorDisabledMenuTitle2,
    this.colorEnabledMenuTitle2,
    this.widgetMenu1,
    this.widgetMenu2,
    this.leftPadding = 15.0,
    this.rightPadding = 15.0,
    this.bottomPadding = 30.0,
  });

  @override
  _MenuToggleState createState() => _MenuToggleState();
}

class _MenuToggleState extends State<MenuToggle> {

  bool toggle;

  @override
  void initState() {
    print(widget.leftPadding);
    this.toggle = true;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
        image: toggle ? widget.image1 : widget.image2,
        child: ViewScaffold(
          leftPadding: 0.0,
          rightPadding: 0.0,
          bottomPadding: widget.bottomPadding,
          child: Column(
            children: <Widget>[
              Expanded(
                  child: Header(
                    leftPadding: getResponsiveWidth(15.0),
                    rightPadding: getResponsiveWidth(15.0),
                    textHeader: widget.header,
                    backgroundColor: toggle ? widget.backgroundHeader1 : widget.backgroundHeader2,
                  )
              ),
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
                  child: toggle ? widget.widgetMenu1 : widget.widgetMenu2,
                ),
              )
            ],
          ),
        ));
  }

  _buildTitleMenus() {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          _buildUnderlineText(
              text: widget.menuTitle1,
              textColor: toggle ? widget.colorEnabledMenuTitle1 : widget.colorDisabledMenuTitle1,
              underlineColor: toggle ? widget.menuUnderlineColor : Colors.transparent,
              toggle: true
          ),
          _buildUnderlineText(
              text: widget.menuTitle2,
              textColor: toggle ? widget.colorEnabledMenuTitle2 : widget.colorDisabledMenuTitle2,
              underlineColor: toggle ? Colors.transparent : widget.menuUnderlineColor,
              toggle: false
          ),
        ]
    );
  }

  _buildUnderlineText({String text, Color underlineColor, Color textColor, bool toggle}) {
    return GestureDetector(
      onTap: () => _toggleMenu(toggle),
      child: Container(
        padding: EdgeInsets.only(bottom: 3.0),
        decoration: BoxDecoration(
            border: Border(bottom: BorderSide(
              color: underlineColor,  // Text colour here
              width: 3.0, // Underline width
            ))
        ),
        child: buildWidgetText(
            color: textColor,
            fontSize: getResponsiveSize(23.0),
            text: text,
            family: FontFamily.ARIAL,
            weight: FontWeight.bold
        ),
      ),
    );
  }

  _toggleMenu(bool toggle) {
    setState(() {
      this.toggle = toggle;
    });
  }

}
