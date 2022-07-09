import '../flutter_flow/flutter_flow_radio_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TipoDeEnvioWidget extends StatefulWidget {
  const TipoDeEnvioWidget({Key key}) : super(key: key);

  @override
  _TipoDeEnvioWidgetState createState() => _TipoDeEnvioWidgetState();
}

class _TipoDeEnvioWidgetState extends State<TipoDeEnvioWidget> {
  String radioButtonValue;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 130,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: FlutterFlowRadioButton(
        options: [
          'Mi Repartidor',
          'Solicitar Repartidor',
          'Ingresar costo y fecha de entrega'
        ].toList(),
        initialValue: 'Mi Repartidor',
        onChanged: (value) {
          setState(() => radioButtonValue = value);
        },
        optionHeight: 40,
        textStyle: FlutterFlowTheme.of(context).bodyText1.override(
              fontFamily: 'Montserrat',
              color: Color(0xFFAEAEAE),
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
        selectedTextStyle: FlutterFlowTheme.of(context).bodyText1.override(
              fontFamily: 'Montserrat',
              color: Color(0xFF1EEBBD),
              fontSize: 12,
              fontWeight: FontWeight.normal,
            ),
        buttonPosition: RadioButtonPosition.left,
        direction: Axis.vertical,
        radioButtonColor: Color(0xFF1EEBBD),
        inactiveRadioButtonColor: Color(0xFFAEAEAE),
        toggleable: false,
        horizontalAlignment: WrapAlignment.start,
        verticalAlignment: WrapCrossAlignment.start,
      ),
    );
  }
}
