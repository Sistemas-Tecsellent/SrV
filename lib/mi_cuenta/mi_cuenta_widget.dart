import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MiCuentaWidget extends StatefulWidget {
  const MiCuentaWidget({Key key}) : super(key: key);

  @override
  _MiCuentaWidgetState createState() => _MiCuentaWidgetState();
}

class _MiCuentaWidgetState extends State<MiCuentaWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        leading: FlutterFlowIconButton(
          borderColor: Colors.transparent,
          borderRadius: 30,
          borderWidth: 1,
          buttonSize: 60,
          icon: Icon(
            Icons.keyboard_arrow_left_sharp,
            color: FlutterFlowTheme.of(context).primaryText,
            size: 30,
          ),
          onPressed: () async {
            context.pop();
          },
        ),
        title: Text(
          'Mi cuenta',
          style: FlutterFlowTheme.of(context).title2.override(
                fontFamily: 'Montserrat',
                color: FlutterFlowTheme.of(context).primaryText,
                fontSize: 18,
              ),
        ),
        actions: [],
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              InkWell(
                onTap: () async {
                  context.pushNamed('EditarPerfil');
                },
                child: ListTile(
                  leading: Icon(
                    Icons.person_outline,
                    size: 20,
                  ),
                  title: Text(
                    'Editar perfil',
                    style: FlutterFlowTheme.of(context).title3.override(
                          fontFamily: 'Montserrat',
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF303030),
                    size: 15,
                  ),
                  tileColor: FlutterFlowTheme.of(context).primaryBackground,
                  dense: false,
                  contentPadding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                ),
              ),
              InkWell(
                onTap: () async {
                  context.pushNamed('InformacionFiscal');
                },
                child: ListTile(
                  leading: Icon(
                    Icons.insert_drive_file_outlined,
                    size: 20,
                  ),
                  title: Text(
                    'Información Fiscal',
                    style: FlutterFlowTheme.of(context).title3.override(
                          fontFamily: 'Montserrat',
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF303030),
                    size: 15,
                  ),
                  tileColor: FlutterFlowTheme.of(context).primaryBackground,
                  dense: false,
                  contentPadding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                ),
              ),
              InkWell(
                onTap: () async {
                  context.pushNamed('DatosBancarios');
                },
                child: ListTile(
                  leading: Icon(
                    Icons.payment_outlined,
                    size: 20,
                  ),
                  title: Text(
                    'Datos Bancarios',
                    style: FlutterFlowTheme.of(context).title3.override(
                          fontFamily: 'Montserrat',
                          fontSize: 15,
                          fontWeight: FontWeight.normal,
                        ),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xFF303030),
                    size: 15,
                  ),
                  tileColor: FlutterFlowTheme.of(context).primaryBackground,
                  dense: false,
                  contentPadding: EdgeInsetsDirectional.fromSTEB(20, 0, 20, 0),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
