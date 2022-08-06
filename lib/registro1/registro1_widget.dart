import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class Registro1Widget extends StatefulWidget {
  const Registro1Widget({Key key}) : super(key: key);

  @override
  _Registro1WidgetState createState() => _Registro1WidgetState();
}

class _Registro1WidgetState extends State<Registro1Widget> {
  DateTime datePicked10;
  DateTime datePicked9;
  DateTime datePicked1;
  DateTime datePicked2;
  DateTime datePicked3;
  DateTime datePicked4;
  DateTime datePicked5;
  DateTime datePicked6;
  DateTime datePicked7;
  DateTime datePicked8;
  DateTime datePicked11;
  DateTime datePicked12;
  DateTime datePicked13;
  DateTime datePicked14;
  TextEditingController textController1;
  TextEditingController textController2;
  TextEditingController textController3;
  TextEditingController textController4;
  TextEditingController textController5;
  String dropDownValue;
  TextEditingController textController6;
  TextEditingController textController7;
  TextEditingController textController8;
  TextEditingController textController9;
  TextEditingController textController10;
  TextEditingController textController11;
  TextEditingController textController12;
  TextEditingController textController13;
  TextEditingController textController14;
  final formKey = GlobalKey<FormState>();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController10 = TextEditingController(
        text: valueOrDefault(currentUserDocument?.fiscalEmail, ''));
    textController6 = TextEditingController(
        text: valueOrDefault(currentUserDocument?.fiscalName, ''));
    textController7 = TextEditingController(
        text: valueOrDefault(currentUserDocument?.fiscalRFC, ''));
    textController8 = TextEditingController(
        text: valueOrDefault(currentUserDocument?.fiscalAddress, ''));
    textController9 = TextEditingController(
        text: valueOrDefault(currentUserDocument?.fiscalContactName, ''));
    textController11 = TextEditingController(
        text: valueOrDefault(currentUserDocument?.fiscalContactPhone, ''));
    textController12 = TextEditingController(
        text:
            valueOrDefault(currentUserDocument?.fiscalRepresentativeName, ''));
    textController13 = TextEditingController(
        text:
            valueOrDefault(currentUserDocument?.fiscalRepresentativeEmail, ''));
    textController14 = TextEditingController(
        text: valueOrDefault(currentUserDocument?.businessType, ''));
  }

  @override
  Widget build(BuildContext context) {
    return AuthUserStreamWidget(
      child: StreamBuilder<List<StoresRecord>>(
        stream: queryStoresRecord(
          queryBuilder: (storesRecord) => storesRecord.where('owner',
              isEqualTo: valueOrDefault(currentUserDocument?.sellerId, '')),
          singleRecord: true,
        ),
        builder: (context, snapshot) {
          // Customize what your widget looks like when it's loading.
          if (!snapshot.hasData) {
            return Center(
              child: SizedBox(
                width: 50,
                height: 50,
                child: CircularProgressIndicator(
                  color: FlutterFlowTheme.of(context).primaryColor,
                ),
              ),
            );
          }
          List<StoresRecord> registro1StoresRecordList = snapshot.data;
          // Return an empty Container when the document does not exist.
          if (snapshot.data.isEmpty) {
            return Container();
          }
          final registro1StoresRecord = registro1StoresRecordList.isNotEmpty
              ? registro1StoresRecordList.first
              : null;
          return Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            body: SafeArea(
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.network(
                              'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FlogoLogin.png?alt=media&token=fa452c40-c004-49d2-9e2c-29e9904a58fd',
                              height: 70,
                              fit: BoxFit.cover,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '¡Bienvenido ',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            Text(
                              '[name]',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            Text(
                              '!',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Proceso de Registro',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Montserrat',
                                    fontSize: 18,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(20, 40, 20, 20),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 40,
                              height: 40,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              alignment: AlignmentDirectional(0, 0),
                              child: Text(
                                '1',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                      fontSize: 20,
                                    ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                              child: Text(
                                'Datos Generales',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryText,
                                      fontSize: 15,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(10, 0, 10, 0),
                              child: InkWell(
                                onTap: () async {
                                  context.pushNamed(
                                    'registro2',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType:
                                            PageTransitionType.rightToLeft,
                                      ),
                                    },
                                  );
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Color(0x94FAF1E2),
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Text(
                                    '2',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryColor,
                                          fontSize: 20,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                              child: InkWell(
                                onTap: () async {
                                  context.pushNamed(
                                    'registro2',
                                    extra: <String, dynamic>{
                                      kTransitionInfoKey: TransitionInfo(
                                        hasTransition: true,
                                        transitionType:
                                            PageTransitionType.rightToLeft,
                                      ),
                                    },
                                  );
                                },
                                child: Container(
                                  width: 40,
                                  height: 40,
                                  decoration: BoxDecoration(
                                    color: Color(0x94FAF1E2),
                                    shape: BoxShape.circle,
                                  ),
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Text(
                                    '3',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Montserrat',
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryColor,
                                          fontSize: 20,
                                        ),
                                  ),
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: () async {
                                context.pushNamed(
                                  'registro4',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType:
                                          PageTransitionType.rightToLeft,
                                    ),
                                  },
                                );
                              },
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Color(0x95FAF1E2),
                                  shape: BoxShape.circle,
                                ),
                                alignment: AlignmentDirectional(0, 0),
                                child: Text(
                                  '4',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Montserrat',
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryColor,
                                        fontSize: 20,
                                      ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          color:
                              FlutterFlowTheme.of(context).secondaryBackground,
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Form(
                          key: formKey,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    0, 20, 0, 20),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 0, 20, 10),
                                            child: TextFormField(
                                              controller: textController1 ??=
                                                  TextEditingController(
                                                text:
                                                    registro1StoresRecord.name,
                                              ),
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText:
                                                    'Nombre del comercio que saldrá en la app',
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFE2E2E2),
                                                    width: 1.5,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFE2E2E2),
                                                    width: 1.5,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                              validator: (val) {
                                                if (val == null ||
                                                    val.isEmpty) {
                                                  return 'Es requerido';
                                                }

                                                return null;
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    20, 0, 20, 10),
                                            child: TextFormField(
                                              controller: textController2 ??=
                                                  TextEditingController(
                                                text: registro1StoresRecord
                                                    .storePhone,
                                              ),
                                              obscureText: false,
                                              decoration: InputDecoration(
                                                labelText:
                                                    'Teléfono del comercio',
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFE2E2E2),
                                                    width: 1.5,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                    color: Color(0xFFE2E2E2),
                                                    width: 1.5,
                                                  ),
                                                  borderRadius:
                                                      const BorderRadius.only(
                                                    topLeft:
                                                        Radius.circular(4.0),
                                                    topRight:
                                                        Radius.circular(4.0),
                                                  ),
                                                ),
                                              ),
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Expanded(
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(20, 10,
                                                                  10, 0),
                                                      child: TextFormField(
                                                        controller:
                                                            textController3 ??=
                                                                TextEditingController(
                                                          text:
                                                              registro1StoresRecord
                                                                  .address,
                                                        ),
                                                        obscureText: false,
                                                        decoration:
                                                            InputDecoration(
                                                          labelText:
                                                              'Dirección',
                                                          enabledBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0xFFE2E2E2),
                                                              width: 1.5,
                                                            ),
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      4.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      4.0),
                                                            ),
                                                          ),
                                                          focusedBorder:
                                                              UnderlineInputBorder(
                                                            borderSide:
                                                                BorderSide(
                                                              color: Color(
                                                                  0xFFE2E2E2),
                                                              width: 1.5,
                                                            ),
                                                            borderRadius:
                                                                const BorderRadius
                                                                    .only(
                                                              topLeft: Radius
                                                                  .circular(
                                                                      4.0),
                                                              topRight: Radius
                                                                  .circular(
                                                                      4.0),
                                                            ),
                                                          ),
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                        keyboardType:
                                                            TextInputType
                                                                .streetAddress,
                                                        validator: (val) {
                                                          if (val == null ||
                                                              val.isEmpty) {
                                                            return 'Es requerido';
                                                          }

                                                          return null;
                                                        },
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 0, 10, 0),
                                                    child:
                                                        FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 30,
                                                      borderWidth: 1,
                                                      buttonSize: 60,
                                                      fillColor:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .alternate,
                                                      icon: FaIcon(
                                                        FontAwesomeIcons
                                                            .mapMarkerAlt,
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        size: 30,
                                                      ),
                                                      onPressed: () async {
                                                        context.pushNamed(
                                                            'EnterLocationWithMap');
                                                      },
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(20, 5, 10, 0),
                                                child: Text(
                                                  '*Da click en el botón rojo y selecciona tu ubicación en el mapa.',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color:
                                                            Color(0xFFAEAEAE),
                                                        fontSize: 11,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontStyle:
                                                            FontStyle.italic,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(20, 0, 20, 0),
                                                child: TextFormField(
                                                  controller:
                                                      textController4 ??=
                                                          TextEditingController(
                                                    text: registro1StoresRecord
                                                        .location,
                                                  ),
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText: 'Estado',
                                                    hintText: 'Estado',
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xFFE2E2E2),
                                                        width: 1.5,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xFFE2E2E2),
                                                        width: 1.5,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(20, 0, 20, 0),
                                                child: TextFormField(
                                                  controller:
                                                      textController5 ??=
                                                          TextEditingController(
                                                    text: registro1StoresRecord
                                                        .locationCity,
                                                  ),
                                                  obscureText: false,
                                                  decoration: InputDecoration(
                                                    labelText: 'Ciudad',
                                                    hintText: 'Ciudad',
                                                    enabledBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xFFE2E2E2),
                                                        width: 1.5,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                    focusedBorder:
                                                        UnderlineInputBorder(
                                                      borderSide: BorderSide(
                                                        color:
                                                            Color(0xFFE2E2E2),
                                                        width: 1.5,
                                                      ),
                                                      borderRadius:
                                                          const BorderRadius
                                                              .only(
                                                        topLeft:
                                                            Radius.circular(
                                                                4.0),
                                                        topRight:
                                                            Radius.circular(
                                                                4.0),
                                                      ),
                                                    ),
                                                  ),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 20, 0, 0),
                                        child: Container(
                                          width: double.infinity,
                                          color: Colors.white,
                                          child: ExpandableNotifier(
                                            initialExpanded: true,
                                            child: ExpandablePanel(
                                              header: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(20, 0, 20, 0),
                                                child: Text(
                                                  'Horario de Apertura',
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .title1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color: Colors.black,
                                                        fontSize: 14,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                              ),
                                              collapsed: Container(
                                                width: MediaQuery.of(context)
                                                    .size
                                                    .width,
                                                height: 0,
                                                decoration: BoxDecoration(
                                                  color: Color(0xFFEEEEEE),
                                                ),
                                              ),
                                              expanded: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 10, 20, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 5, 0, 0),
                                                      child: StreamBuilder<
                                                          List<WorkDaysRecord>>(
                                                        stream:
                                                            queryWorkDaysRecord(
                                                          parent:
                                                              registro1StoresRecord
                                                                  .reference,
                                                          queryBuilder:
                                                              (workDaysRecord) =>
                                                                  workDaysRecord.where(
                                                                      'id',
                                                                      isEqualTo:
                                                                          'Lunes'),
                                                          singleRecord: true,
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50,
                                                                height: 50,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<WorkDaysRecord>
                                                              rowWorkDaysRecordList =
                                                              snapshot.data;
                                                          // Return an empty Container when the document does not exist.
                                                          if (snapshot
                                                              .data.isEmpty) {
                                                            return Container();
                                                          }
                                                          final rowWorkDaysRecord =
                                                              rowWorkDaysRecordList
                                                                      .isNotEmpty
                                                                  ? rowWorkDaysRecordList
                                                                      .first
                                                                  : null;
                                                          return Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  ToggleIcon(
                                                                    onPressed:
                                                                        () async {
                                                                      final enabledDaysElement =
                                                                          'Lunes';
                                                                      final enabledDaysUpdate = registro1StoresRecord
                                                                              .enabledDays
                                                                              .toList()
                                                                              .contains(
                                                                                  enabledDaysElement)
                                                                          ? FieldValue
                                                                              .arrayRemove([
                                                                              enabledDaysElement
                                                                            ])
                                                                          : FieldValue
                                                                              .arrayUnion([
                                                                              enabledDaysElement
                                                                            ]);
                                                                      final storesUpdateData =
                                                                          {
                                                                        'enabledDays':
                                                                            enabledDaysUpdate,
                                                                      };
                                                                      await registro1StoresRecord
                                                                          .reference
                                                                          .update(
                                                                              storesUpdateData);
                                                                    },
                                                                    value: registro1StoresRecord
                                                                        .enabledDays
                                                                        .toList()
                                                                        .contains(
                                                                            'Lunes'),
                                                                    onIcon:
                                                                        Icon(
                                                                      Icons
                                                                          .toggle_on_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      size: 40,
                                                                    ),
                                                                    offIcon:
                                                                        Icon(
                                                                      Icons
                                                                          .toggle_off_outlined,
                                                                      color: Color(
                                                                          0xFFCCCCCC),
                                                                      size: 38,
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: 50,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: Text(
                                                                      'Lunes',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .end,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            fontSize:
                                                                                11,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            5,
                                                                            0),
                                                                    child: Text(
                                                                      dateTimeFormat(
                                                                          'jm',
                                                                          datePicked1),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            fontSize:
                                                                                11,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            5,
                                                                            0),
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        await DatePicker
                                                                            .showTimePicker(
                                                                          context,
                                                                          showTitleActions:
                                                                              true,
                                                                          onConfirm:
                                                                              (date) {
                                                                            setState(() =>
                                                                                datePicked1 = date);
                                                                          },
                                                                          currentTime:
                                                                              rowWorkDaysRecord.opens,
                                                                        );

                                                                        final workDaysUpdateData =
                                                                            createWorkDaysRecordData(
                                                                          opens:
                                                                              datePicked1,
                                                                        );
                                                                        await rowWorkDaysRecord
                                                                            .reference
                                                                            .update(workDaysUpdateData);
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0xFFEEEEEE),
                                                                          borderRadius:
                                                                              BorderRadius.circular(5),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              10,
                                                                              2,
                                                                              10,
                                                                              2),
                                                                          child:
                                                                              Icon(
                                                                            Icons.access_time,
                                                                            color:
                                                                                Colors.black,
                                                                            size:
                                                                                15,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            5,
                                                                            0),
                                                                    child: Text(
                                                                      '-',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            fontSize:
                                                                                11,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            5,
                                                                            0),
                                                                    child: Text(
                                                                      dateTimeFormat(
                                                                          'jm',
                                                                          datePicked2),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            fontSize:
                                                                                11,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      await DatePicker
                                                                          .showTimePicker(
                                                                        context,
                                                                        showTitleActions:
                                                                            true,
                                                                        onConfirm:
                                                                            (date) {
                                                                          setState(() =>
                                                                              datePicked2 = date);
                                                                        },
                                                                        currentTime:
                                                                            rowWorkDaysRecord.closes,
                                                                      );

                                                                      final workDaysUpdateData =
                                                                          createWorkDaysRecordData(
                                                                        closes:
                                                                            datePicked2,
                                                                      );
                                                                      await rowWorkDaysRecord
                                                                          .reference
                                                                          .update(
                                                                              workDaysUpdateData);
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xFFEEEEEE),
                                                                        borderRadius:
                                                                            BorderRadius.circular(5),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10,
                                                                            2,
                                                                            10,
                                                                            2),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .access_time,
                                                                          color:
                                                                              Colors.black,
                                                                          size:
                                                                              15,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 5, 0, 0),
                                                      child: StreamBuilder<
                                                          List<WorkDaysRecord>>(
                                                        stream:
                                                            queryWorkDaysRecord(
                                                          parent:
                                                              registro1StoresRecord
                                                                  .reference,
                                                          queryBuilder:
                                                              (workDaysRecord) =>
                                                                  workDaysRecord.where(
                                                                      'id',
                                                                      isEqualTo:
                                                                          'Martes'),
                                                          singleRecord: true,
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50,
                                                                height: 50,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<WorkDaysRecord>
                                                              rowWorkDaysRecordList =
                                                              snapshot.data;
                                                          // Return an empty Container when the document does not exist.
                                                          if (snapshot
                                                              .data.isEmpty) {
                                                            return Container();
                                                          }
                                                          final rowWorkDaysRecord =
                                                              rowWorkDaysRecordList
                                                                      .isNotEmpty
                                                                  ? rowWorkDaysRecordList
                                                                      .first
                                                                  : null;
                                                          return Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  ToggleIcon(
                                                                    onPressed:
                                                                        () async {
                                                                      final workDaysUpdateData =
                                                                          {
                                                                        'enabled':
                                                                            !rowWorkDaysRecord.enabled,
                                                                      };
                                                                      await rowWorkDaysRecord
                                                                          .reference
                                                                          .update(
                                                                              workDaysUpdateData);
                                                                    },
                                                                    value: rowWorkDaysRecord
                                                                        .enabled,
                                                                    onIcon:
                                                                        Icon(
                                                                      Icons
                                                                          .toggle_on_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      size: 40,
                                                                    ),
                                                                    offIcon:
                                                                        Icon(
                                                                      Icons
                                                                          .toggle_off_outlined,
                                                                      color: Color(
                                                                          0xFFCCCCCC),
                                                                      size: 38,
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: 50,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: Text(
                                                                      'Martes',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .end,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            fontSize:
                                                                                11,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            5,
                                                                            0),
                                                                    child: Text(
                                                                      dateTimeFormat(
                                                                          'jm',
                                                                          datePicked3),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            fontSize:
                                                                                11,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            5,
                                                                            0),
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        await DatePicker
                                                                            .showTimePicker(
                                                                          context,
                                                                          showTitleActions:
                                                                              true,
                                                                          onConfirm:
                                                                              (date) {
                                                                            setState(() =>
                                                                                datePicked3 = date);
                                                                          },
                                                                          currentTime:
                                                                              rowWorkDaysRecord.opens,
                                                                        );

                                                                        final workDaysUpdateData =
                                                                            createWorkDaysRecordData(
                                                                          opens:
                                                                              datePicked3,
                                                                        );
                                                                        await rowWorkDaysRecord
                                                                            .reference
                                                                            .update(workDaysUpdateData);
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0xFFEEEEEE),
                                                                          borderRadius:
                                                                              BorderRadius.circular(5),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              10,
                                                                              2,
                                                                              10,
                                                                              2),
                                                                          child:
                                                                              Icon(
                                                                            Icons.access_time,
                                                                            color:
                                                                                Colors.black,
                                                                            size:
                                                                                15,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            5,
                                                                            0),
                                                                    child: Text(
                                                                      '-',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            fontSize:
                                                                                11,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            5,
                                                                            0),
                                                                    child: Text(
                                                                      dateTimeFormat(
                                                                          'jm',
                                                                          datePicked4),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            fontSize:
                                                                                11,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      await DatePicker
                                                                          .showTimePicker(
                                                                        context,
                                                                        showTitleActions:
                                                                            true,
                                                                        onConfirm:
                                                                            (date) {
                                                                          setState(() =>
                                                                              datePicked4 = date);
                                                                        },
                                                                        currentTime:
                                                                            rowWorkDaysRecord.closes,
                                                                      );

                                                                      final workDaysUpdateData =
                                                                          createWorkDaysRecordData(
                                                                        closes:
                                                                            datePicked4,
                                                                      );
                                                                      await rowWorkDaysRecord
                                                                          .reference
                                                                          .update(
                                                                              workDaysUpdateData);
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xFFEEEEEE),
                                                                        borderRadius:
                                                                            BorderRadius.circular(5),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10,
                                                                            2,
                                                                            10,
                                                                            2),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .access_time,
                                                                          color:
                                                                              Colors.black,
                                                                          size:
                                                                              15,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 5, 0, 0),
                                                      child: StreamBuilder<
                                                          List<WorkDaysRecord>>(
                                                        stream:
                                                            queryWorkDaysRecord(
                                                          parent:
                                                              registro1StoresRecord
                                                                  .reference,
                                                          queryBuilder:
                                                              (workDaysRecord) =>
                                                                  workDaysRecord.where(
                                                                      'id',
                                                                      isEqualTo:
                                                                          'Miercoles'),
                                                          singleRecord: true,
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50,
                                                                height: 50,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<WorkDaysRecord>
                                                              rowWorkDaysRecordList =
                                                              snapshot.data;
                                                          // Return an empty Container when the document does not exist.
                                                          if (snapshot
                                                              .data.isEmpty) {
                                                            return Container();
                                                          }
                                                          final rowWorkDaysRecord =
                                                              rowWorkDaysRecordList
                                                                      .isNotEmpty
                                                                  ? rowWorkDaysRecordList
                                                                      .first
                                                                  : null;
                                                          return Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  ToggleIcon(
                                                                    onPressed:
                                                                        () async {
                                                                      final enabledDaysElement =
                                                                          'Miercoles';
                                                                      final enabledDaysUpdate = registro1StoresRecord
                                                                              .enabledDays
                                                                              .toList()
                                                                              .contains(
                                                                                  enabledDaysElement)
                                                                          ? FieldValue
                                                                              .arrayRemove([
                                                                              enabledDaysElement
                                                                            ])
                                                                          : FieldValue
                                                                              .arrayUnion([
                                                                              enabledDaysElement
                                                                            ]);
                                                                      final storesUpdateData =
                                                                          {
                                                                        'enabledDays':
                                                                            enabledDaysUpdate,
                                                                      };
                                                                      await registro1StoresRecord
                                                                          .reference
                                                                          .update(
                                                                              storesUpdateData);
                                                                    },
                                                                    value: registro1StoresRecord
                                                                        .enabledDays
                                                                        .toList()
                                                                        .contains(
                                                                            'Miercoles'),
                                                                    onIcon:
                                                                        Icon(
                                                                      Icons
                                                                          .toggle_on_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      size: 40,
                                                                    ),
                                                                    offIcon:
                                                                        Icon(
                                                                      Icons
                                                                          .toggle_off_outlined,
                                                                      color: Color(
                                                                          0xFFCCCCCC),
                                                                      size: 38,
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: 53,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: Text(
                                                                      'Miércoles',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .end,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            fontSize:
                                                                                11,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            2,
                                                                            0),
                                                                    child: Text(
                                                                      dateTimeFormat(
                                                                          'jm',
                                                                          datePicked5),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            fontSize:
                                                                                11,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            5,
                                                                            0),
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        await DatePicker
                                                                            .showTimePicker(
                                                                          context,
                                                                          showTitleActions:
                                                                              true,
                                                                          onConfirm:
                                                                              (date) {
                                                                            setState(() =>
                                                                                datePicked5 = date);
                                                                          },
                                                                          currentTime:
                                                                              rowWorkDaysRecord.opens,
                                                                        );

                                                                        final workDaysUpdateData =
                                                                            createWorkDaysRecordData(
                                                                          opens:
                                                                              datePicked5,
                                                                        );
                                                                        await rowWorkDaysRecord
                                                                            .reference
                                                                            .update(workDaysUpdateData);
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0xFFEEEEEE),
                                                                          borderRadius:
                                                                              BorderRadius.circular(5),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              10,
                                                                              2,
                                                                              10,
                                                                              2),
                                                                          child:
                                                                              Icon(
                                                                            Icons.access_time,
                                                                            color:
                                                                                Colors.black,
                                                                            size:
                                                                                15,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            2,
                                                                            0),
                                                                    child: Text(
                                                                      '-',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            fontSize:
                                                                                11,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            2,
                                                                            0),
                                                                    child: Text(
                                                                      dateTimeFormat(
                                                                          'jm',
                                                                          datePicked6),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            fontSize:
                                                                                11,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      await DatePicker
                                                                          .showTimePicker(
                                                                        context,
                                                                        showTitleActions:
                                                                            true,
                                                                        onConfirm:
                                                                            (date) {
                                                                          setState(() =>
                                                                              datePicked6 = date);
                                                                        },
                                                                        currentTime:
                                                                            rowWorkDaysRecord.closes,
                                                                      );

                                                                      final workDaysUpdateData =
                                                                          createWorkDaysRecordData(
                                                                        closes:
                                                                            datePicked6,
                                                                      );
                                                                      await rowWorkDaysRecord
                                                                          .reference
                                                                          .update(
                                                                              workDaysUpdateData);
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xFFEEEEEE),
                                                                        borderRadius:
                                                                            BorderRadius.circular(5),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10,
                                                                            2,
                                                                            10,
                                                                            2),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .access_time,
                                                                          color:
                                                                              Colors.black,
                                                                          size:
                                                                              15,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 5, 0, 0),
                                                      child: StreamBuilder<
                                                          List<WorkDaysRecord>>(
                                                        stream:
                                                            queryWorkDaysRecord(
                                                          parent:
                                                              registro1StoresRecord
                                                                  .reference,
                                                          queryBuilder:
                                                              (workDaysRecord) =>
                                                                  workDaysRecord.where(
                                                                      'id',
                                                                      isEqualTo:
                                                                          'Jueves'),
                                                          singleRecord: true,
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50,
                                                                height: 50,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<WorkDaysRecord>
                                                              rowWorkDaysRecordList =
                                                              snapshot.data;
                                                          // Return an empty Container when the document does not exist.
                                                          if (snapshot
                                                              .data.isEmpty) {
                                                            return Container();
                                                          }
                                                          final rowWorkDaysRecord =
                                                              rowWorkDaysRecordList
                                                                      .isNotEmpty
                                                                  ? rowWorkDaysRecordList
                                                                      .first
                                                                  : null;
                                                          return Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  ToggleIcon(
                                                                    onPressed:
                                                                        () async {
                                                                      final enabledDaysElement =
                                                                          'Jueves';
                                                                      final enabledDaysUpdate = registro1StoresRecord
                                                                              .enabledDays
                                                                              .toList()
                                                                              .contains(
                                                                                  enabledDaysElement)
                                                                          ? FieldValue
                                                                              .arrayRemove([
                                                                              enabledDaysElement
                                                                            ])
                                                                          : FieldValue
                                                                              .arrayUnion([
                                                                              enabledDaysElement
                                                                            ]);
                                                                      final storesUpdateData =
                                                                          {
                                                                        'enabledDays':
                                                                            enabledDaysUpdate,
                                                                      };
                                                                      await registro1StoresRecord
                                                                          .reference
                                                                          .update(
                                                                              storesUpdateData);
                                                                    },
                                                                    value: registro1StoresRecord
                                                                        .enabledDays
                                                                        .toList()
                                                                        .contains(
                                                                            'Jueves'),
                                                                    onIcon:
                                                                        Icon(
                                                                      Icons
                                                                          .toggle_on_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      size: 40,
                                                                    ),
                                                                    offIcon:
                                                                        Icon(
                                                                      Icons
                                                                          .toggle_off_outlined,
                                                                      color: Color(
                                                                          0xFFCCCCCC),
                                                                      size: 38,
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: 50,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: Text(
                                                                      'Jueves',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .end,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            fontSize:
                                                                                11,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            5,
                                                                            0),
                                                                    child: Text(
                                                                      dateTimeFormat(
                                                                          'jm',
                                                                          datePicked7),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            fontSize:
                                                                                11,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            5,
                                                                            0),
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        await DatePicker
                                                                            .showTimePicker(
                                                                          context,
                                                                          showTitleActions:
                                                                              true,
                                                                          onConfirm:
                                                                              (date) {
                                                                            setState(() =>
                                                                                datePicked7 = date);
                                                                          },
                                                                          currentTime:
                                                                              rowWorkDaysRecord.opens,
                                                                        );

                                                                        final workDaysUpdateData =
                                                                            createWorkDaysRecordData(
                                                                          opens:
                                                                              datePicked7,
                                                                        );
                                                                        await rowWorkDaysRecord
                                                                            .reference
                                                                            .update(workDaysUpdateData);
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0xFFEEEEEE),
                                                                          borderRadius:
                                                                              BorderRadius.circular(5),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              10,
                                                                              2,
                                                                              10,
                                                                              2),
                                                                          child:
                                                                              Icon(
                                                                            Icons.access_time,
                                                                            color:
                                                                                Colors.black,
                                                                            size:
                                                                                15,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            5,
                                                                            0),
                                                                    child: Text(
                                                                      '-',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            fontSize:
                                                                                11,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            5,
                                                                            0),
                                                                    child: Text(
                                                                      dateTimeFormat(
                                                                          'jm',
                                                                          datePicked8),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            fontSize:
                                                                                11,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      await DatePicker
                                                                          .showTimePicker(
                                                                        context,
                                                                        showTitleActions:
                                                                            true,
                                                                        onConfirm:
                                                                            (date) {
                                                                          setState(() =>
                                                                              datePicked8 = date);
                                                                        },
                                                                        currentTime:
                                                                            rowWorkDaysRecord.closes,
                                                                      );

                                                                      final workDaysUpdateData =
                                                                          createWorkDaysRecordData(
                                                                        closes:
                                                                            datePicked8,
                                                                      );
                                                                      await rowWorkDaysRecord
                                                                          .reference
                                                                          .update(
                                                                              workDaysUpdateData);
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xFFEEEEEE),
                                                                        borderRadius:
                                                                            BorderRadius.circular(5),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10,
                                                                            2,
                                                                            10,
                                                                            2),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .access_time,
                                                                          color:
                                                                              Colors.black,
                                                                          size:
                                                                              15,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 5, 0, 0),
                                                      child: StreamBuilder<
                                                          List<WorkDaysRecord>>(
                                                        stream:
                                                            queryWorkDaysRecord(
                                                          parent:
                                                              registro1StoresRecord
                                                                  .reference,
                                                          queryBuilder:
                                                              (workDaysRecord) =>
                                                                  workDaysRecord.where(
                                                                      'id',
                                                                      isEqualTo:
                                                                          'Viernes'),
                                                          singleRecord: true,
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50,
                                                                height: 50,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<WorkDaysRecord>
                                                              rowWorkDaysRecordList =
                                                              snapshot.data;
                                                          // Return an empty Container when the document does not exist.
                                                          if (snapshot
                                                              .data.isEmpty) {
                                                            return Container();
                                                          }
                                                          final rowWorkDaysRecord =
                                                              rowWorkDaysRecordList
                                                                      .isNotEmpty
                                                                  ? rowWorkDaysRecordList
                                                                      .first
                                                                  : null;
                                                          return Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  ToggleIcon(
                                                                    onPressed:
                                                                        () async {
                                                                      final enabledDaysElement =
                                                                          'Viernes';
                                                                      final enabledDaysUpdate = registro1StoresRecord
                                                                              .enabledDays
                                                                              .toList()
                                                                              .contains(
                                                                                  enabledDaysElement)
                                                                          ? FieldValue
                                                                              .arrayRemove([
                                                                              enabledDaysElement
                                                                            ])
                                                                          : FieldValue
                                                                              .arrayUnion([
                                                                              enabledDaysElement
                                                                            ]);
                                                                      final storesUpdateData =
                                                                          {
                                                                        'enabledDays':
                                                                            enabledDaysUpdate,
                                                                      };
                                                                      await registro1StoresRecord
                                                                          .reference
                                                                          .update(
                                                                              storesUpdateData);
                                                                    },
                                                                    value: registro1StoresRecord
                                                                        .enabledDays
                                                                        .toList()
                                                                        .contains(
                                                                            'Viernes'),
                                                                    onIcon:
                                                                        Icon(
                                                                      Icons
                                                                          .toggle_on_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      size: 40,
                                                                    ),
                                                                    offIcon:
                                                                        Icon(
                                                                      Icons
                                                                          .toggle_off_outlined,
                                                                      color: Color(
                                                                          0xFFCCCCCC),
                                                                      size: 38,
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: 50,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: Text(
                                                                      'Viernes',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .end,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            fontSize:
                                                                                11,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            5,
                                                                            0),
                                                                    child: Text(
                                                                      dateTimeFormat(
                                                                          'jm',
                                                                          datePicked9),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            fontSize:
                                                                                11,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            5,
                                                                            0),
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        await DatePicker
                                                                            .showTimePicker(
                                                                          context,
                                                                          showTitleActions:
                                                                              true,
                                                                          onConfirm:
                                                                              (date) {
                                                                            setState(() =>
                                                                                datePicked9 = date);
                                                                          },
                                                                          currentTime:
                                                                              rowWorkDaysRecord.opens,
                                                                        );

                                                                        final workDaysUpdateData =
                                                                            createWorkDaysRecordData(
                                                                          opens:
                                                                              datePicked9,
                                                                        );
                                                                        await rowWorkDaysRecord
                                                                            .reference
                                                                            .update(workDaysUpdateData);
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0xFFEEEEEE),
                                                                          borderRadius:
                                                                              BorderRadius.circular(5),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              10,
                                                                              2,
                                                                              10,
                                                                              2),
                                                                          child:
                                                                              Icon(
                                                                            Icons.access_time,
                                                                            color:
                                                                                Colors.black,
                                                                            size:
                                                                                15,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            5,
                                                                            0),
                                                                    child: Text(
                                                                      '-',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            fontSize:
                                                                                11,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            5,
                                                                            0),
                                                                    child: Text(
                                                                      dateTimeFormat(
                                                                          'jm',
                                                                          datePicked10),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            fontSize:
                                                                                11,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      await DatePicker
                                                                          .showTimePicker(
                                                                        context,
                                                                        showTitleActions:
                                                                            true,
                                                                        onConfirm:
                                                                            (date) {
                                                                          setState(() =>
                                                                              datePicked10 = date);
                                                                        },
                                                                        currentTime:
                                                                            rowWorkDaysRecord.closes,
                                                                      );

                                                                      final workDaysUpdateData =
                                                                          createWorkDaysRecordData(
                                                                        closes:
                                                                            datePicked10,
                                                                      );
                                                                      await rowWorkDaysRecord
                                                                          .reference
                                                                          .update(
                                                                              workDaysUpdateData);
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xFFEEEEEE),
                                                                        borderRadius:
                                                                            BorderRadius.circular(5),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10,
                                                                            2,
                                                                            10,
                                                                            2),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .access_time,
                                                                          color:
                                                                              Colors.black,
                                                                          size:
                                                                              15,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 5, 0, 0),
                                                      child: StreamBuilder<
                                                          List<WorkDaysRecord>>(
                                                        stream:
                                                            queryWorkDaysRecord(
                                                          parent:
                                                              registro1StoresRecord
                                                                  .reference,
                                                          queryBuilder:
                                                              (workDaysRecord) =>
                                                                  workDaysRecord.where(
                                                                      'id',
                                                                      isEqualTo:
                                                                          'Sabado'),
                                                          singleRecord: true,
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50,
                                                                height: 50,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<WorkDaysRecord>
                                                              rowWorkDaysRecordList =
                                                              snapshot.data;
                                                          // Return an empty Container when the document does not exist.
                                                          if (snapshot
                                                              .data.isEmpty) {
                                                            return Container();
                                                          }
                                                          final rowWorkDaysRecord =
                                                              rowWorkDaysRecordList
                                                                      .isNotEmpty
                                                                  ? rowWorkDaysRecordList
                                                                      .first
                                                                  : null;
                                                          return Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  ToggleIcon(
                                                                    onPressed:
                                                                        () async {
                                                                      final enabledDaysElement =
                                                                          'Sabado';
                                                                      final enabledDaysUpdate = registro1StoresRecord
                                                                              .enabledDays
                                                                              .toList()
                                                                              .contains(
                                                                                  enabledDaysElement)
                                                                          ? FieldValue
                                                                              .arrayRemove([
                                                                              enabledDaysElement
                                                                            ])
                                                                          : FieldValue
                                                                              .arrayUnion([
                                                                              enabledDaysElement
                                                                            ]);
                                                                      final storesUpdateData =
                                                                          {
                                                                        'enabledDays':
                                                                            enabledDaysUpdate,
                                                                      };
                                                                      await registro1StoresRecord
                                                                          .reference
                                                                          .update(
                                                                              storesUpdateData);
                                                                    },
                                                                    value: registro1StoresRecord
                                                                        .enabledDays
                                                                        .toList()
                                                                        .contains(
                                                                            'Sabado'),
                                                                    onIcon:
                                                                        Icon(
                                                                      Icons
                                                                          .toggle_on_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      size: 40,
                                                                    ),
                                                                    offIcon:
                                                                        Icon(
                                                                      Icons
                                                                          .toggle_off_outlined,
                                                                      color: Color(
                                                                          0xFFCCCCCC),
                                                                      size: 38,
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: 50,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: Text(
                                                                      'Sábado',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .end,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            fontSize:
                                                                                11,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            5,
                                                                            0),
                                                                    child: Text(
                                                                      dateTimeFormat(
                                                                          'jm',
                                                                          datePicked11),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            fontSize:
                                                                                11,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            5,
                                                                            0),
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        await DatePicker
                                                                            .showTimePicker(
                                                                          context,
                                                                          showTitleActions:
                                                                              true,
                                                                          onConfirm:
                                                                              (date) {
                                                                            setState(() =>
                                                                                datePicked11 = date);
                                                                          },
                                                                          currentTime:
                                                                              rowWorkDaysRecord.opens,
                                                                        );

                                                                        final workDaysUpdateData =
                                                                            createWorkDaysRecordData(
                                                                          opens:
                                                                              datePicked11,
                                                                        );
                                                                        await rowWorkDaysRecord
                                                                            .reference
                                                                            .update(workDaysUpdateData);
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0xFFEEEEEE),
                                                                          borderRadius:
                                                                              BorderRadius.circular(5),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              10,
                                                                              2,
                                                                              10,
                                                                              2),
                                                                          child:
                                                                              Icon(
                                                                            Icons.access_time,
                                                                            color:
                                                                                Colors.black,
                                                                            size:
                                                                                15,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            5,
                                                                            0),
                                                                    child: Text(
                                                                      '-',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            fontSize:
                                                                                11,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            5,
                                                                            0),
                                                                    child: Text(
                                                                      dateTimeFormat(
                                                                          'jm',
                                                                          datePicked12),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            fontSize:
                                                                                11,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      await DatePicker
                                                                          .showTimePicker(
                                                                        context,
                                                                        showTitleActions:
                                                                            true,
                                                                        onConfirm:
                                                                            (date) {
                                                                          setState(() =>
                                                                              datePicked12 = date);
                                                                        },
                                                                        currentTime:
                                                                            rowWorkDaysRecord.closes,
                                                                      );

                                                                      final workDaysUpdateData =
                                                                          createWorkDaysRecordData(
                                                                        closes:
                                                                            datePicked12,
                                                                      );
                                                                      await rowWorkDaysRecord
                                                                          .reference
                                                                          .update(
                                                                              workDaysUpdateData);
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xFFEEEEEE),
                                                                        borderRadius:
                                                                            BorderRadius.circular(5),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10,
                                                                            2,
                                                                            10,
                                                                            2),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .access_time,
                                                                          color:
                                                                              Colors.black,
                                                                          size:
                                                                              15,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 5, 0, 0),
                                                      child: StreamBuilder<
                                                          List<WorkDaysRecord>>(
                                                        stream:
                                                            queryWorkDaysRecord(
                                                          parent:
                                                              registro1StoresRecord
                                                                  .reference,
                                                          queryBuilder:
                                                              (workDaysRecord) =>
                                                                  workDaysRecord.where(
                                                                      'id',
                                                                      isEqualTo:
                                                                          'Domingo'),
                                                          singleRecord: true,
                                                        ),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50,
                                                                height: 50,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          List<WorkDaysRecord>
                                                              rowWorkDaysRecordList =
                                                              snapshot.data;
                                                          // Return an empty Container when the document does not exist.
                                                          if (snapshot
                                                              .data.isEmpty) {
                                                            return Container();
                                                          }
                                                          final rowWorkDaysRecord =
                                                              rowWorkDaysRecordList
                                                                      .isNotEmpty
                                                                  ? rowWorkDaysRecordList
                                                                      .first
                                                                  : null;
                                                          return Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  ToggleIcon(
                                                                    onPressed:
                                                                        () async {
                                                                      final enabledDaysElement =
                                                                          'Domingo';
                                                                      final enabledDaysUpdate = registro1StoresRecord
                                                                              .enabledDays
                                                                              .toList()
                                                                              .contains(
                                                                                  enabledDaysElement)
                                                                          ? FieldValue
                                                                              .arrayRemove([
                                                                              enabledDaysElement
                                                                            ])
                                                                          : FieldValue
                                                                              .arrayUnion([
                                                                              enabledDaysElement
                                                                            ]);
                                                                      final storesUpdateData =
                                                                          {
                                                                        'enabledDays':
                                                                            enabledDaysUpdate,
                                                                      };
                                                                      await registro1StoresRecord
                                                                          .reference
                                                                          .update(
                                                                              storesUpdateData);
                                                                    },
                                                                    value: registro1StoresRecord
                                                                        .enabledDays
                                                                        .toList()
                                                                        .contains(
                                                                            'Domingo'),
                                                                    onIcon:
                                                                        Icon(
                                                                      Icons
                                                                          .toggle_on_rounded,
                                                                      color: FlutterFlowTheme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      size: 40,
                                                                    ),
                                                                    offIcon:
                                                                        Icon(
                                                                      Icons
                                                                          .toggle_off_outlined,
                                                                      color: Color(
                                                                          0xFFCCCCCC),
                                                                      size: 38,
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: 53,
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child: Text(
                                                                      'Domingo',
                                                                      textAlign:
                                                                          TextAlign
                                                                              .end,
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            fontSize:
                                                                                11,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            2,
                                                                            0),
                                                                    child: Text(
                                                                      dateTimeFormat(
                                                                          'jm',
                                                                          datePicked13),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            fontSize:
                                                                                11,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            5,
                                                                            0),
                                                                    child:
                                                                        InkWell(
                                                                      onTap:
                                                                          () async {
                                                                        await DatePicker
                                                                            .showTimePicker(
                                                                          context,
                                                                          showTitleActions:
                                                                              true,
                                                                          onConfirm:
                                                                              (date) {
                                                                            setState(() =>
                                                                                datePicked13 = date);
                                                                          },
                                                                          currentTime:
                                                                              rowWorkDaysRecord.opens,
                                                                        );

                                                                        final workDaysUpdateData =
                                                                            createWorkDaysRecordData(
                                                                          opens:
                                                                              datePicked13,
                                                                        );
                                                                        await rowWorkDaysRecord
                                                                            .reference
                                                                            .update(workDaysUpdateData);
                                                                      },
                                                                      child:
                                                                          Container(
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Color(0xFFEEEEEE),
                                                                          borderRadius:
                                                                              BorderRadius.circular(5),
                                                                        ),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              10,
                                                                              2,
                                                                              10,
                                                                              2),
                                                                          child:
                                                                              Icon(
                                                                            Icons.access_time,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryText,
                                                                            size:
                                                                                15,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            2,
                                                                            0),
                                                                    child: Text(
                                                                      '-',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color:
                                                                                Color(0xFF8B8B8B),
                                                                            fontSize:
                                                                                11,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            2,
                                                                            0),
                                                                    child: Text(
                                                                      dateTimeFormat(
                                                                          'jm',
                                                                          datePicked14),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                11,
                                                                            fontWeight:
                                                                                FontWeight.normal,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  InkWell(
                                                                    onTap:
                                                                        () async {
                                                                      await DatePicker
                                                                          .showTimePicker(
                                                                        context,
                                                                        showTitleActions:
                                                                            true,
                                                                        onConfirm:
                                                                            (date) {
                                                                          setState(() =>
                                                                              datePicked14 = date);
                                                                        },
                                                                        currentTime:
                                                                            rowWorkDaysRecord.closes,
                                                                      );

                                                                      final workDaysUpdateData =
                                                                          createWorkDaysRecordData(
                                                                        closes:
                                                                            datePicked14,
                                                                      );
                                                                      await rowWorkDaysRecord
                                                                          .reference
                                                                          .update(
                                                                              workDaysUpdateData);
                                                                    },
                                                                    child:
                                                                        Container(
                                                                      decoration:
                                                                          BoxDecoration(
                                                                        color: Color(
                                                                            0xFFEEEEEE),
                                                                        borderRadius:
                                                                            BorderRadius.circular(5),
                                                                      ),
                                                                      child:
                                                                          Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            10,
                                                                            2,
                                                                            10,
                                                                            2),
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .access_time,
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryText,
                                                                          size:
                                                                              15,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          );
                                                        },
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              theme: ExpandableThemeData(
                                                tapHeaderToExpand: true,
                                                tapBodyToExpand: false,
                                                tapBodyToCollapse: false,
                                                headerAlignment:
                                                    ExpandablePanelHeaderAlignment
                                                        .center,
                                                hasIcon: true,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Divider(
                                thickness: 3,
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                              Padding(
                                padding:
                                    EdgeInsetsDirectional.fromSTEB(0, 0, 0, 10),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    color: Colors.white,
                                    child: ExpandableNotifier(
                                      initialExpanded: true,
                                      child: ExpandablePanel(
                                        header: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 0, 20, 0),
                                          child: Text(
                                            'Información fiscal',
                                            style: FlutterFlowTheme.of(context)
                                                .title1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.black,
                                                  fontSize: 14,
                                                ),
                                          ),
                                        ),
                                        collapsed: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 0,
                                          decoration: BoxDecoration(
                                            color: Color(0xFFEEEEEE),
                                          ),
                                        ),
                                        expanded: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 10),
                                                  child: FlutterFlowDropDown(
                                                    initialOption:
                                                        dropDownValue ??=
                                                            valueOrDefault<
                                                                String>(
                                                      valueOrDefault(
                                                          currentUserDocument
                                                              ?.fiscalType,
                                                          ''),
                                                      'Tipo de persona',
                                                    ),
                                                    options: [
                                                      'Persona Física',
                                                      'Persona Moral'
                                                    ],
                                                    onChanged: (val) =>
                                                        setState(() =>
                                                            dropDownValue =
                                                                val),
                                                    width: 320,
                                                    height: 50,
                                                    textStyle: FlutterFlowTheme
                                                            .of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.black,
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                    hintText: 'Tipo de persona',
                                                    fillColor: Colors.white,
                                                    elevation: 0,
                                                    borderColor:
                                                        Color(0x00FFFFFF),
                                                    borderWidth: 0,
                                                    borderRadius: 0,
                                                    margin:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                12, 4, 12, 4),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20, 0, 20, 10),
                                                  child: TextFormField(
                                                    controller: textController6,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          'Razón Social / Nombre de la persona física',
                                                      enabledBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xFFE2E2E2),
                                                          width: 1.5,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                      focusedBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xFFE2E2E2),
                                                          width: 1.5,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                    validator: (val) {
                                                      if (val == null ||
                                                          val.isEmpty) {
                                                        return 'Es requerido';
                                                      }

                                                      return null;
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20, 0, 20, 10),
                                                  child: TextFormField(
                                                    controller: textController7,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          'RFC con homoclave',
                                                      enabledBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xFFE2E2E2),
                                                          width: 1.5,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                      focusedBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xFFE2E2E2),
                                                          width: 1.5,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                    validator: (val) {
                                                      if (val == null ||
                                                          val.isEmpty) {
                                                        return 'Es requerido';
                                                      }

                                                      return null;
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20, 0, 20, 10),
                                                  child: TextFormField(
                                                    controller: textController8,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          'Dirección Fiscal',
                                                      enabledBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xFFE2E2E2),
                                                          width: 1.5,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                      focusedBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xFFE2E2E2),
                                                          width: 1.5,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20, 0, 20, 10),
                                                  child: TextFormField(
                                                    controller: textController9,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          'Nombre del contacto de facturación',
                                                      enabledBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xFFE2E2E2),
                                                          width: 1.5,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                      focusedBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xFFE2E2E2),
                                                          width: 1.5,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20, 0, 20, 10),
                                                  child: TextFormField(
                                                    controller:
                                                        textController10,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          'Email del contacto de facturación',
                                                      enabledBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xFFE2E2E2),
                                                          width: 1.5,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                      focusedBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xFFE2E2E2),
                                                          width: 1.5,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20, 0, 20, 10),
                                                  child: TextFormField(
                                                    controller:
                                                        textController11,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          'Teléfono del contacto de facturación',
                                                      enabledBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xFFE2E2E2),
                                                          width: 1.5,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                      focusedBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xFFE2E2E2),
                                                          width: 1.5,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Divider(
                                              thickness: 3,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                            ),
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20, 10, 20, 10),
                                                  child: TextFormField(
                                                    controller:
                                                        textController12,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          'Nombre del Representante Legal',
                                                      enabledBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xFFE2E2E2),
                                                          width: 1.5,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                      focusedBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xFFE2E2E2),
                                                          width: 1.5,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                    validator: (val) {
                                                      if (val == null ||
                                                          val.isEmpty) {
                                                        return 'Es requerido';
                                                      }

                                                      return null;
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20, 0, 20, 15),
                                                  child: TextFormField(
                                                    controller:
                                                        textController13,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          'Email del Representante Legal',
                                                      enabledBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xFFE2E2E2),
                                                          width: 1.5,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                      focusedBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xFFE2E2E2),
                                                          width: 1.5,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                    validator: (val) {
                                                      if (val == null ||
                                                          val.isEmpty) {
                                                        return 'Es requerido';
                                                      }

                                                      return null;
                                                    },
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(20, 0, 20, 20),
                                                  child: TextFormField(
                                                    controller:
                                                        textController14,
                                                    obscureText: false,
                                                    decoration: InputDecoration(
                                                      labelText:
                                                          'Constructora, ferretería, eléctrica, etc.',
                                                      hintText:
                                                          'Giro de la Empresa',
                                                      enabledBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xFFE2E2E2),
                                                          width: 1.5,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                      focusedBorder:
                                                          UnderlineInputBorder(
                                                        borderSide: BorderSide(
                                                          color:
                                                              Color(0xFFE2E2E2),
                                                          width: 1.5,
                                                        ),
                                                        borderRadius:
                                                            const BorderRadius
                                                                .only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  4.0),
                                                          topRight:
                                                              Radius.circular(
                                                                  4.0),
                                                        ),
                                                      ),
                                                    ),
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 14,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                    validator: (val) {
                                                      if (val == null ||
                                                          val.isEmpty) {
                                                        return 'Es requerido';
                                                      }

                                                      return null;
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        theme: ExpandableThemeData(
                                          tapHeaderToExpand: true,
                                          tapBodyToExpand: false,
                                          tapBodyToCollapse: false,
                                          headerAlignment:
                                              ExpandablePanelHeaderAlignment
                                                  .center,
                                          hasIcon: true,
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 50, 0, 50),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            FFButtonWidget(
                              onPressed: () async {
                                final storesUpdateData = createStoresRecordData(
                                  name: textController1?.text ?? '',
                                  location: textController4?.text ?? '',
                                  locationCity: textController5?.text ?? '',
                                  address: textController3?.text ?? '',
                                  storePhone: textController2?.text ?? '',
                                );
                                await registro1StoresRecord.reference
                                    .update(storesUpdateData);

                                final sellersUpdateData =
                                    createSellersRecordData(
                                  fiscalType: dropDownValue,
                                  fiscalName: textController6.text,
                                  fiscalRFC: textController7.text,
                                  fiscalAddress: textController8.text,
                                  fiscalContactName: textController9.text,
                                  fiscalEmail: textController10.text,
                                  fiscalContactPhone: textController11.text,
                                  fiscalRepresentativeName:
                                      textController12.text,
                                  fiscalRepresentativeEmail:
                                      textController13.text,
                                  businessType: textController14.text,
                                );
                                await currentUserReference
                                    .update(sellersUpdateData);
                                context.pushNamed(
                                  'registro2',
                                  extra: <String, dynamic>{
                                    kTransitionInfoKey: TransitionInfo(
                                      hasTransition: true,
                                      transitionType: PageTransitionType.fade,
                                      duration: Duration(milliseconds: 0),
                                    ),
                                  },
                                );
                              },
                              text: 'Siguiente',
                              options: FFButtonOptions(
                                width: 200,
                                height: 40,
                                color: Colors.white,
                                textStyle: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Colors.black,
                                    ),
                                borderSide: BorderSide(
                                  color: Colors.transparent,
                                  width: 1,
                                ),
                                borderRadius: BorderRadius.circular(5),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
