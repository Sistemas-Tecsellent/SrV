import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class RepartidorWidget extends StatefulWidget {
  const RepartidorWidget({
    Key key,
    this.delivererId,
    this.orderId,
  }) : super(key: key);

  final String delivererId;
  final String orderId;

  @override
  _RepartidorWidgetState createState() => _RepartidorWidgetState();
}

class _RepartidorWidgetState extends State<RepartidorWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<DeliverersRecord>>(
      stream: queryDeliverersRecord(
        queryBuilder: (deliverersRecord) =>
            deliverersRecord.where('uid', isEqualTo: widget.delivererId),
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
        List<DeliverersRecord> containerDeliverersRecordList = snapshot.data;
        // Return an empty Container when the document does not exist.
        if (snapshot.data.isEmpty) {
          return Container();
        }
        final containerDeliverersRecord =
            containerDeliverersRecordList.isNotEmpty
                ? containerDeliverersRecordList.first
                : null;
        return Container(
          width: double.infinity,
          height: 80,
          decoration: BoxDecoration(
            color: FlutterFlowTheme.of(context).secondaryBackground,
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(12, 8, 12, 8),
            child: StreamBuilder<List<OrdersForStoresRecord>>(
              stream: queryOrdersForStoresRecord(
                queryBuilder: (ordersForStoresRecord) => ordersForStoresRecord
                    .where('id', isEqualTo: widget.orderId),
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
                List<OrdersForStoresRecord> rowOrdersForStoresRecordList =
                    snapshot.data;
                // Return an empty Container when the document does not exist.
                if (snapshot.data.isEmpty) {
                  return Container();
                }
                final rowOrdersForStoresRecord =
                    rowOrdersForStoresRecordList.isNotEmpty
                        ? rowOrdersForStoresRecordList.first
                        : null;
                return Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                      ),
                      child: Image.network(
                        valueOrDefault<String>(
                          containerDeliverersRecord.photoUrl,
                          'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset.png?alt=media&token=85f6129c-7ee9-4db8-87ae-2e1adc4e010a',
                        ),
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              containerDeliverersRecord.displayName,
                              style: FlutterFlowTheme.of(context)
                                  .subtitle1
                                  .override(
                                    fontFamily: 'Montserrat',
                                    fontSize: 12,
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 4, 0, 0),
                                    child: Text(
                                      containerDeliverersRecord.transport,
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: Color(0xFFAAAAAA),
                                            fontSize: 11,
                                            fontWeight: FontWeight.normal,
                                            fontStyle: FontStyle.italic,
                                          ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                              child: Text(
                                containerDeliverersRecord.status,
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Montserrat',
                                      fontSize: 10,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Stack(
                      children: [
                        InkWell(
                          onTap: () async {
                            setState(() => FFAppState().selectedDeliverer =
                                containerDeliverersRecord.uid);
                          },
                          child: Icon(
                            Icons.lens_outlined,
                            color: Color(0xFF1EEBBD),
                            size: 24,
                          ),
                        ),
                        if ((FFAppState().selectedDeliverer) ==
                            (containerDeliverersRecord.uid))
                          InkWell(
                            onTap: () async {
                              setState(
                                  () => FFAppState().selectedDeliverer = '');
                            },
                            child: Icon(
                              Icons.radio_button_checked,
                              color: Color(0xFF1EEBBD),
                              size: 24,
                            ),
                          ),
                      ],
                    ),
                  ],
                );
              },
            ),
          ),
        );
      },
    );
  }
}
