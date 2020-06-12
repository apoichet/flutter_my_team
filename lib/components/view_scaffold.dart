import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fc_parisii/components/nav_bar/nav_bar.dart';
import 'package:fc_parisii/components/view_padding.dart';
import 'package:fc_parisii/views/loader.dart';

class ViewScaffold extends StatefulWidget {

  final Widget header;
  final Widget body;
  final double topPadding;
  final double bottomPadding;
  final double leftPadding;
  final double rightPadding;
  final NavBarEnum navBarSelected;
  final bool loader;

  ViewScaffold({
    @required this.header,
    @required this.body,
    @required this.navBarSelected,
    this.topPadding = 30.0,
    this.bottomPadding = 30.0,
    this.leftPadding = 15.0,
    this.rightPadding = 15.0,
    this.loader = true,
  });

  @override
  _ViewScaffoldState createState() => _ViewScaffoldState();
}

class _ViewScaffoldState extends State<ViewScaffold> {

  final Duration _duration = Duration(milliseconds: 200);

  Future<Widget> _futureChild;

  @override
  void initState() {
    _futureChild = _delayViewChild();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ViewPadding(
          child: widget.header != null ? _buildWithHeader() : _buildFutureChild(),
          topPadding: widget.topPadding,
          bottomPadding: widget.bottomPadding,
          leftPadding: widget.leftPadding,
          rightPadding: widget.rightPadding
      ),
      bottomNavigationBar: NavBar(widget.navBarSelected),
    );
  }

  Widget _buildWithHeader() {
    return Column(
      children: <Widget>[
        Expanded(
            flex: 1,
            child: widget.header
        ),
        Expanded(
          flex: 9,
          child: _buildFutureChild()
        )
      ],
    );
  }

  Widget _buildFutureChild() {
    return FutureBuilder(
        future: _futureChild,
        builder : (BuildContext context, AsyncSnapshot<Widget> snapshot) {
          if(snapshot.connectionState == ConnectionState.done && snapshot.hasData) {
            return snapshot.data;
          }
          return widget.loader ? Loader() : SizedBox.shrink();
        }
    );
  }

  Future<Widget> _delayViewChild() async {
    if(widget.loader) {
      await Future.delayed(_duration);
    }
    return Future.value(widget.body);
  }
}
