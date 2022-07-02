import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:google_fonts/google_fonts.dart';

class NotificacionesWidget extends StatefulWidget {
  const NotificacionesWidget({Key key}) : super(key: key);

  @override
  _NotificacionesWidgetState createState() => _NotificacionesWidgetState();
}

class _NotificacionesWidgetState extends State<NotificacionesWidget> {
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
            Navigator.pop(context);
          },
        ),
        title: Text(
          'Notificaciones',
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
              Expanded(
                child: StreamBuilder<List<NotificationsRecord>>(
                  stream: queryNotificationsRecord(
                    parent: currentUserReference,
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
                    List<NotificationsRecord> listViewNotificationsRecordList =
                        snapshot.data;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewNotificationsRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewNotificationsRecord =
                            listViewNotificationsRecordList[listViewIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 0),
                          child: Slidable(
                            actionPane: const SlidableScrollActionPane(),
                            secondaryActions: [
                              IconSlideAction(
                                caption: 'Eliminar',
                                color: Color(0x00FFFFFF),
                                icon: Icons.clear_outlined,
                                onTap: () async {
                                  await actions.deleteNotification(
                                    currentUserUid,
                                    listViewNotificationsRecord.id,
                                  );
                                },
                              ),
                            ],
                            child: ListTile(
                              title: Text(
                                listViewNotificationsRecord.title,
                                style: FlutterFlowTheme.of(context)
                                    .title3
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Colors.black,
                                      fontSize: 18,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                              subtitle: Text(
                                listViewNotificationsRecord.description,
                                style: FlutterFlowTheme.of(context)
                                    .subtitle2
                                    .override(
                                      fontFamily: 'Montserrat',
                                      color: Color(0xFF969696),
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal,
                                    ),
                              ),
                              dense: false,
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
