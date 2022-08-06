import '../components/tienda_aprobada_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TiendaAceptadaWidget extends StatefulWidget {
  const TiendaAceptadaWidget({Key key}) : super(key: key);

  @override
  _TiendaAceptadaWidgetState createState() => _TiendaAceptadaWidgetState();
}

class _TiendaAceptadaWidgetState extends State<TiendaAceptadaWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: FlutterFlowTheme.of(context).primaryColor,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Align(
                alignment: AlignmentDirectional(0, 1),
                child: TiendaAprobadaWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
