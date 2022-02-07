import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MChokeWidget extends StatefulWidget {
  const MChokeWidget({Key key}) : super(key: key);

  @override
  _MChokeWidgetState createState() => _MChokeWidgetState();
}

class _MChokeWidgetState extends State<MChokeWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
    );
  }
}
