import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/repartidor_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:auto_size_text/auto_size_text.dart';
import 'package:expandable/expandable.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PedidoListoSELLER5DIASWidget extends StatefulWidget {
  const PedidoListoSELLER5DIASWidget({
    Key key,
    this.orderId,
  }) : super(key: key);

  final String orderId;

  @override
  _PedidoListoSELLER5DIASWidgetState createState() =>
      _PedidoListoSELLER5DIASWidgetState();
}

class _PedidoListoSELLER5DIASWidgetState
    extends State<PedidoListoSELLER5DIASWidget> {
  TextEditingController parcelGuideController;
  TextEditingController parcelNameController;
  TextEditingController parcelLinkController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    parcelGuideController = TextEditingController();
    parcelNameController = TextEditingController();
    parcelLinkController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<OrdersForStoresRecord>>(
      stream: queryOrdersForStoresRecord(
        queryBuilder: (ordersForStoresRecord) =>
            ordersForStoresRecord.where('id', isEqualTo: widget.orderId),
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
        List<OrdersForStoresRecord>
            pedidoListoSELLER5DIASOrdersForStoresRecordList = snapshot.data;
        // Return an empty Container when the document does not exist.
        if (snapshot.data.isEmpty) {
          return Container();
        }
        final pedidoListoSELLER5DIASOrdersForStoresRecord =
            pedidoListoSELLER5DIASOrdersForStoresRecordList.isNotEmpty
                ? pedidoListoSELLER5DIASOrdersForStoresRecordList.first
                : null;
        return Scaffold(
          key: scaffoldKey,
          appBar: AppBar(
            backgroundColor: Colors.white,
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
              pedidoListoSELLER5DIASOrdersForStoresRecord.id,
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
          backgroundColor: Colors.white,
          floatingActionButton: FloatingActionButton.extended(
            onPressed: () {
              print('FloatingActionButton pressed ...');
            },
            backgroundColor: Color(0x00FDC054),
            elevation: 0,
            label: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                FFButtonWidget(
                  onPressed: () async {
                    context.pop();
                  },
                  text: 'Cancelar',
                  options: FFButtonOptions(
                    width: 150,
                    height: 40,
                    color: Colors.white,
                    textStyle: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Montserrat',
                          color: FlutterFlowTheme.of(context).alternate,
                          fontWeight: FontWeight.w500,
                        ),
                    elevation: 0,
                    borderSide: BorderSide(
                      color: Colors.transparent,
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                Padding(
                  padding: EdgeInsetsDirectional.fromSTEB(8, 0, 0, 0),
                  child: FFButtonWidget(
                    onPressed: () async {
                      setState(() => FFAppState().selectedDeliverer = '');
                      if ((pedidoListoSELLER5DIASOrdersForStoresRecord
                              .deliveredBy) ==
                          'Mi Repartidor') {
                        await PrepareNormalOrderDeliveryCall.call(
                          delivererId: FFAppState().selectedDeliverer,
                          bundleId: pedidoListoSELLER5DIASOrdersForStoresRecord
                              .bundleId,
                        );
                      } else {
                        if ((pedidoListoSELLER5DIASOrdersForStoresRecord
                                .deliveredBy) ==
                            'Solicitar Repartidor') {
                          await PrepareNormalOrderDeliveryCall.call(
                            delivererId:
                                pedidoListoSELLER5DIASOrdersForStoresRecord
                                    .assignedDeliverer,
                            bundleId:
                                pedidoListoSELLER5DIASOrdersForStoresRecord
                                    .bundleId,
                          );
                        } else {
                          if ((pedidoListoSELLER5DIASOrdersForStoresRecord
                                  .deliveredBy) ==
                              'Paquetería / Flete / Otro') {
                            await PrepareNormalOrderOtherDeliveryCall.call(
                              bundleId:
                                  pedidoListoSELLER5DIASOrdersForStoresRecord
                                      .bundleId,
                              parcelName: parcelNameController.text,
                              parcelGuide: parcelGuideController.text,
                              parcelLink: parcelLinkController.text,
                            );
                          }
                        }
                      }

                      await actions.updateOrderStatus(
                        pedidoListoSELLER5DIASOrdersForStoresRecord.id,
                        'onRoute',
                      );
                      context.pop();
                    },
                    text: 'Enviar Pedido',
                    options: FFButtonOptions(
                      width: 150,
                      height: 40,
                      color: Color(0xFFFD9954),
                      textStyle:
                          FlutterFlowTheme.of(context).bodyText1.override(
                                fontFamily: 'Montserrat',
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                              ),
                      elevation: 0,
                      borderSide: BorderSide(
                        color: Colors.transparent,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                ),
              ],
            ),
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.85,
                decoration: BoxDecoration(),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 10),
                        child: SingleChildScrollView(
                          primary: false,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                constraints: BoxConstraints(
                                  maxWidth: 400,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 10,
                                      color: Color(0x22000000),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0x00FFFFFF),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 0,
                                            color: Color(0x00171717),
                                            offset: Offset(0, 0),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 10, 8, 10),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              'PEDIDO  1 - 5 DÍAS',
                                              textAlign: TextAlign.center,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 20, 15, 0),
                        child: SingleChildScrollView(
                          primary: false,
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                constraints: BoxConstraints(
                                  maxWidth: 500,
                                ),
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      blurRadius: 10,
                                      color: Color(0x22000000),
                                    )
                                  ],
                                  borderRadius: BorderRadius.circular(20),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      width: double.infinity,
                                      decoration: BoxDecoration(
                                        color: Color(0x00FFFFFF),
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 0,
                                            color: Color(0x00171717),
                                            offset: Offset(0, 0),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(0),
                                      ),
                                      alignment: AlignmentDirectional(0, 0),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            8, 10, 8, 10),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Expanded(
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(16, 0, 0, 0),
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 300,
                                                      decoration: BoxDecoration(
                                                        color:
                                                            Color(0x00EEEEEE),
                                                      ),
                                                      child: Text(
                                                        pedidoListoSELLER5DIASOrdersForStoresRecord
                                                            .customerName,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle1
                                                                .override(
                                                                  fontFamily:
                                                                      'Lexend Deca',
                                                                  color: Color(
                                                                      0xFF090F13),
                                                                  fontSize: 20,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                ),
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      4, 0, 0),
                                                          child: Text(
                                                            'Tel',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 200,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x00EEEEEE),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5,
                                                                        4,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              pedidoListoSELLER5DIASOrdersForStoresRecord
                                                                  .customerPhone,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: Color(
                                                                        0xFF57636C),
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      4, 0, 0),
                                                          child: Text(
                                                            'Dirección',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                          ),
                                                        ),
                                                        Container(
                                                          width: 200,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Color(
                                                                0x00EEEEEE),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        5,
                                                                        4,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              pedidoListoSELLER5DIASOrdersForStoresRecord
                                                                  .customerAddress,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: Color(
                                                                        0xFF57636C),
                                                                    fontSize:
                                                                        12,
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                  ),
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(18, 20, 18, 20),
                        child: Container(
                          width: double.infinity,
                          constraints: BoxConstraints(
                            maxWidth: 500,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0x00FFFFFF),
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 0,
                                color: Color(0x001D2429),
                                offset: Offset(0, 0),
                              )
                            ],
                            borderRadius: BorderRadius.circular(0),
                          ),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 16, 7),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Productos',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                    Text(
                                      formatNumber(
                                        pedidoListoSELLER5DIASOrdersForStoresRecord
                                            .subtotal,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.periodDecimal,
                                        currency: '',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText2
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: Colors.black,
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                              Divider(
                                indent: 16,
                                endIndent: 16,
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 8, 16, 7),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total',
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: Color(0xFF090F13),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                    Text(
                                      formatNumber(
                                        pedidoListoSELLER5DIASOrdersForStoresRecord
                                            .total,
                                        formatType: FormatType.decimal,
                                        decimalType: DecimalType.periodDecimal,
                                        currency: '',
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: Color(0xFF090F13),
                                            fontSize: 20,
                                            fontWeight: FontWeight.w600,
                                          ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 20, 0, 20),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          constraints: BoxConstraints(
                            maxWidth: 500,
                          ),
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context)
                                .secondaryBackground,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Container(
                            width: double.infinity,
                            color: Color(0x00FFFFFF),
                            child: ExpandableNotifier(
                              initialExpanded: true,
                              child: ExpandablePanel(
                                header: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      15, 0, 0, 0),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            5, 0, 0, 0),
                                        child: Text(
                                          'Productos',
                                          style: FlutterFlowTheme.of(context)
                                              .title1
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color: Colors.black,
                                                fontSize: 14,
                                                fontWeight: FontWeight.w500,
                                              ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                collapsed: Container(
                                  width: 1,
                                  height: 1,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                  ),
                                ),
                                expanded: FutureBuilder<ApiCallResponse>(
                                  future: GetOrderForStoreInfoCall.call(
                                    orderId: widget.orderId,
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: CircularProgressIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                        ),
                                      );
                                    }
                                    final columnGetOrderForStoreInfoResponse =
                                        snapshot.data;
                                    return Builder(
                                      builder: (context) {
                                        final products =
                                            GetOrderForStoreInfoCall.products(
                                                  (columnGetOrderForStoreInfoResponse
                                                          ?.jsonBody ??
                                                      ''),
                                                )?.toList() ??
                                                [];
                                        return Column(
                                          mainAxisSize: MainAxisSize.max,
                                          children: List.generate(
                                              products.length, (productsIndex) {
                                            final productsItem =
                                                products[productsIndex];
                                            return Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 0, 0, 10),
                                              child: StreamBuilder<
                                                  List<ProductsRecord>>(
                                                stream: queryProductsRecord(
                                                  queryBuilder:
                                                      (productsRecord) =>
                                                          productsRecord.where(
                                                              'id',
                                                              isEqualTo:
                                                                  getJsonField(
                                                                productsItem,
                                                                r'''$.productId''',
                                                              ).toString()),
                                                  singleRecord: true,
                                                ),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50,
                                                        height: 50,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  List<ProductsRecord>
                                                      menuItemProductsRecordList =
                                                      snapshot.data;
                                                  final menuItemProductsRecord =
                                                      menuItemProductsRecordList
                                                              .isNotEmpty
                                                          ? menuItemProductsRecordList
                                                              .first
                                                          : null;
                                                  return Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x00FFFFFF),
                                                      boxShadow: [
                                                        BoxShadow(
                                                          blurRadius: 0,
                                                          color:
                                                              Color(0x001D2429),
                                                          offset: Offset(0, 0),
                                                        )
                                                      ],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              0),
                                                      border: Border.all(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                      ),
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8, 8, 8, 8),
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.min,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        1,
                                                                        1,
                                                                        1),
                                                            child: ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          12),
                                                              child:
                                                                  Image.network(
                                                                menuItemProductsRecord
                                                                    .mainImage,
                                                                width: 50,
                                                                height: 50,
                                                                fit: BoxFit
                                                                    .cover,
                                                              ),
                                                            ),
                                                          ),
                                                          Expanded(
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          8,
                                                                          8,
                                                                          4,
                                                                          0),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .min,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Text(
                                                                    menuItemProductsRecord
                                                                        .title,
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .subtitle1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color:
                                                                              Color(0xFF090F13),
                                                                          fontSize:
                                                                              15,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                  Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    children: [
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Text(
                                                                          'x',
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Montserrat',
                                                                                color: Colors.black,
                                                                                fontSize: 14,
                                                                                fontWeight: FontWeight.normal,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                      AutoSizeText(
                                                                        getJsonField(
                                                                          productsItem,
                                                                          r'''$.amount''',
                                                                        )
                                                                            .toString()
                                                                            .maybeHandleOverflow(
                                                                              maxChars: 70,
                                                                              replacement: '…',
                                                                            ),
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Montserrat',
                                                                              color: Colors.black,
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                      AutoSizeText(
                                                                        getJsonField(
                                                                          productsItem,
                                                                          r'''$.unit''',
                                                                        )
                                                                            .toString()
                                                                            .maybeHandleOverflow(
                                                                              maxChars: 70,
                                                                              replacement: '…',
                                                                            ),
                                                                        textAlign:
                                                                            TextAlign.start,
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Montserrat',
                                                                              color: Colors.black,
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                          Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .min,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .end,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .end,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            4,
                                                                            8),
                                                                child: Text(
                                                                  getJsonField(
                                                                    productsItem,
                                                                    r'''$.subtotal''',
                                                                  ).toString(),
                                                                  textAlign:
                                                                      TextAlign
                                                                          .end,
                                                                  style: FlutterFlowTheme.of(
                                                                          context)
                                                                      .bodyText1
                                                                      .override(
                                                                        fontFamily:
                                                                            'Montserrat',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryColor,
                                                                        fontSize:
                                                                            14,
                                                                        fontWeight:
                                                                            FontWeight.w500,
                                                                      ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  );
                                                },
                                              ),
                                            );
                                          }),
                                        );
                                      },
                                    );
                                  },
                                ),
                                theme: ExpandableThemeData(
                                  tapHeaderToExpand: true,
                                  tapBodyToExpand: false,
                                  tapBodyToCollapse: false,
                                  headerAlignment:
                                      ExpandablePanelHeaderAlignment.center,
                                  hasIcon: true,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width * 0.9,
                          constraints: BoxConstraints(
                            maxWidth: 500,
                          ),
                          decoration: BoxDecoration(
                            color: Color(0x00FFFFFF),
                            border: Border.all(
                              color: Color(0x00F9F9F9),
                            ),
                          ),
                          alignment: AlignmentDirectional(0, 0),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 10, 15, 10),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      20, 0, 0, 0),
                                  child: Text(
                                    'Método de Envío',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Montserrat',
                                          fontWeight: FontWeight.w500,
                                        ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width * 0.9,
                            decoration: BoxDecoration(),
                          ),
                        ],
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        decoration: BoxDecoration(
                          color: Color(0x00FFFFFF),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.9,
                        constraints: BoxConstraints(
                          maxWidth: 500,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            if ((pedidoListoSELLER5DIASOrdersForStoresRecord
                                    .deliveredBy) ==
                                'Paquetería / Flete / Otro')
                              Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 20, 0, 0),
                                    child: TextFormField(
                                      controller: parcelNameController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Paquetería / Fletería',
                                        hintText: 'Ingresa el nombre',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFDBE2E7),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFDBE2E7),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                24, 24, 20, 24),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: Color(0xFF1D2429),
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 20, 0, 0),
                                    child: TextFormField(
                                      controller: parcelGuideController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Número de Guía',
                                        hintText: 'Ingresa numero de guía',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFDBE2E7),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFDBE2E7),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                24, 24, 20, 24),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: Color(0xFF1D2429),
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 20, 0, 0),
                                    child: TextFormField(
                                      controller: parcelLinkController,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Link de Rastreo',
                                        hintText: 'Ingresa el link de rastreo',
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFDBE2E7),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0xFFDBE2E7),
                                            width: 2,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(8),
                                        ),
                                        filled: true,
                                        fillColor: Colors.white,
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                24, 24, 20, 24),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: Color(0xFF1D2429),
                                            fontSize: 14,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            if ((pedidoListoSELLER5DIASOrdersForStoresRecord
                                    .deliveredBy) ==
                                'Mi Repartidor')
                              AuthUserStreamWidget(
                                child: StreamBuilder<List<DeliverersRecord>>(
                                  stream: queryDeliverersRecord(
                                    queryBuilder: (deliverersRecord) =>
                                        deliverersRecord.where('associatedWith',
                                            isEqualTo: valueOrDefault(
                                                currentUserDocument?.storeId,
                                                '')),
                                  ),
                                  builder: (context, snapshot) {
                                    // Customize what your widget looks like when it's loading.
                                    if (!snapshot.hasData) {
                                      return Center(
                                        child: SizedBox(
                                          width: 50,
                                          height: 50,
                                          child: CircularProgressIndicator(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryColor,
                                          ),
                                        ),
                                      );
                                    }
                                    List<DeliverersRecord>
                                        columnDeliverersRecordList =
                                        snapshot.data;
                                    return Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: List.generate(
                                          columnDeliverersRecordList.length,
                                          (columnIndex) {
                                        final columnDeliverersRecord =
                                            columnDeliverersRecordList[
                                                columnIndex];
                                        return RepartidorWidget(
                                          delivererId:
                                              columnDeliverersRecord.uid,
                                          orderId: widget.orderId,
                                        );
                                      }),
                                    );
                                  },
                                ),
                              ),
                            if ((pedidoListoSELLER5DIASOrdersForStoresRecord
                                    .deliveredBy) ==
                                'Solicitar Repartidor')
                              Container(
                                width: MediaQuery.of(context).size.width * 0.9,
                                decoration: BoxDecoration(
                                  color: Color(0x00FFFFFF),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      13, 0, 20, 0),
                                  child: StreamBuilder<List<DeliverersRecord>>(
                                    stream: queryDeliverersRecord(
                                      queryBuilder: (deliverersRecord) =>
                                          deliverersRecord.where('uid',
                                              isEqualTo:
                                                  pedidoListoSELLER5DIASOrdersForStoresRecord
                                                      .assignedDeliverer),
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
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                            ),
                                          ),
                                        );
                                      }
                                      List<DeliverersRecord>
                                          rowDeliverersRecordList =
                                          snapshot.data;
                                      // Return an empty Container when the document does not exist.
                                      if (snapshot.data.isEmpty) {
                                        return Container();
                                      }
                                      final rowDeliverersRecord =
                                          rowDeliverersRecordList.isNotEmpty
                                              ? rowDeliverersRecordList.first
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
                                                rowDeliverersRecord.photoUrl,
                                                'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset%20predeterminado.png?alt=media&token=7c92986b-dd75-4755-8169-58cbbc6bce94',
                                              ),
                                              fit: BoxFit.fitWidth,
                                            ),
                                          ),
                                          Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 0, 0),
                                                child: Text(
                                                  rowDeliverersRecord
                                                      .displayName,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontSize: 12,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 0, 0),
                                                child: Text(
                                                  rowDeliverersRecord.transport,
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
                                            ],
                                          ),
                                        ],
                                      );
                                    },
                                  ),
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
          ),
        );
      },
    );
  }
}
