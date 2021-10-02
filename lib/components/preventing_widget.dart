import 'package:fc_parisii/services/responsive_size.dart';
import 'package:fc_parisii/services/widget_service.dart';
import 'package:fc_parisii/theme/font_family.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PreventingWidget extends StatefulWidget {

  final String preventingText;
  final Widget next;
  final Duration duration;

  const PreventingWidget({
    Key key,
    this.preventingText,
    this.next,
    this.duration}) : super(key: key);

  @override
  _PreventingWidgetState createState() => _PreventingWidgetState();
}

class _PreventingWidgetState extends State<PreventingWidget> {


  Future<void> _delay;

  @override
  void initState() {
    _delay = Future.delayed(widget.duration);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _delay,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return widget.next;
          }
          return _buildPreventing();
        }
    );
  }

  Center _buildPreventing() {
    return Center(
          child: Container(
            color: Colors.black,
            child: buildWidgetText(
                text: widget.preventingText,
              color: Colors.white,
              fontSize: getResponsiveSize(20.0),
              family: FontFamily.ARIAL
            ),
          ),
        );
  }
}
