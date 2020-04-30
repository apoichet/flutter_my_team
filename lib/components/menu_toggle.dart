import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:my_team/components/nav_bar/nav_bar.dart';
import 'package:my_team/components/view_scaffold.dart';
import 'package:my_team/domain/player_position.dart';
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
  final NavBarEnum navBarSelected;

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
    this.navBarSelected
  });

  @override
  _MenuToggleState createState() => _MenuToggleState();
}

class _MenuToggleState extends State<MenuToggle> {

  bool toggle;

  @override
  void initState() {
    this.toggle = true;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
        image: toggle ? widget.image1 : widget.image2,
        child: ViewScaffold(
          navBarSelected: widget.navBarSelected,
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
          _buildText(
              text: widget.menuTitle1,
              textColor: toggle ? widget.colorEnabledMenuTitle1 : widget.colorDisabledMenuTitle1,
              weight: toggle ? FontWeight.bold : FontWeight.normal
          ),
          _buildText(
              text: widget.menuTitle2,
              textColor: toggle ? widget.colorDisabledMenuTitle2 : widget.colorEnabledMenuTitle2,
              weight: toggle ? FontWeight.normal : FontWeight.bold
          ),
        ]
    );
  }

  _buildText({String text, Color textColor, FontWeight weight}) {
    return GestureDetector(
      onTap: _toggleMenu,
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

  _toggleMenu() {
    setState(() {
      this.toggle = !toggle;
    });
  }

}
