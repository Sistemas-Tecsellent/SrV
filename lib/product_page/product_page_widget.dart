import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductPageWidget extends StatefulWidget {
  const ProductPageWidget({
    Key key,
    this.productId,
    this.storeLocation,
  }) : super(key: key);

  final String productId;
  final String storeLocation;

  @override
  _ProductPageWidgetState createState() => _ProductPageWidgetState();
}

class _ProductPageWidgetState extends State<ProductPageWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<ProductsRecord>>(
      stream: queryProductsRecord(
        queryBuilder: (productsRecord) =>
            productsRecord.where('id', isEqualTo: widget.productId),
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
        List<ProductsRecord> productPageProductsRecordList = snapshot.data;
        // Return an empty Container when the document does not exist.
        if (snapshot.data.isEmpty) {
          return Container();
        }
        final productPageProductsRecord =
            productPageProductsRecordList.isNotEmpty
                ? productPageProductsRecordList.first
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
                Icons.keyboard_arrow_left,
                color: Colors.black,
                size: 30,
              ),
              onPressed: () async {
                context.pushNamed('Productos');
              },
            ),
            actions: [
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
                child: InkWell(
                  onTap: () async {
                    context.pushNamed('ProductPageComprar');
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      FFButtonWidget(
                        onPressed: () {
                          print('Button pressed ...');
                        },
                        text: 'Comprar Stock',
                        options: FFButtonOptions(
                          width: 150,
                          height: 40,
                          color: FlutterFlowTheme.of(context).primaryColor,
                          textStyle:
                              FlutterFlowTheme.of(context).subtitle2.override(
                                    fontFamily: 'Montserrat',
                                    color: Colors.white,
                                  ),
                          borderSide: BorderSide(
                            color: Colors.transparent,
                            width: 1,
                          ),
                          borderRadius: BorderRadius.circular(80),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
            centerTitle: false,
            elevation: 0,
          ),
          backgroundColor: Colors.white,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: AuthUserStreamWidget(
                child: StreamBuilder<List<StoresRecord>>(
                  stream: queryStoresRecord(
                    queryBuilder: (storesRecord) => storesRecord.where('id',
                        isEqualTo:
                            valueOrDefault(currentUserDocument?.storeId, '')),
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
                    List<StoresRecord> columnStoresRecordList = snapshot.data;
                    // Return an empty Container when the document does not exist.
                    if (snapshot.data.isEmpty) {
                      return Container();
                    }
                    final columnStoresRecord = columnStoresRecordList.isNotEmpty
                        ? columnStoresRecordList.first
                        : null;
                    return SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (responsiveVisibility(
                            context: context,
                            tabletLandscape: false,
                            desktop: false,
                          ))
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 300,
                                    decoration: BoxDecoration(
                                      color: Color(0x00EEEEEE),
                                    ),
                                    child: Image.network(
                                      valueOrDefault<String>(
                                        productPageProductsRecord.mainImage,
                                        'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset.png?alt=media&token=85f6129c-7ee9-4db8-87ae-2e1adc4e010a',
                                      ),
                                      width: 100,
                                      height: 100,
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          blurRadius: 10,
                                          color: Color(0x0C000000),
                                          offset: Offset(0, -10),
                                        )
                                      ],
                                      borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(0),
                                        bottomRight: Radius.circular(0),
                                        topLeft: Radius.circular(20),
                                        topRight: Radius.circular(20),
                                      ),
                                    ),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          20, 20, 20, 0),
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            productPageProductsRecord.title,
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 22,
                                                ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 5, 20, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 5, 0),
                                                  child: Text(
                                                    'Marca',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                                Container(
                                                  decoration: BoxDecoration(
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryBackground,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            50),
                                                    border: Border.all(
                                                      color: Color(0x00656565),
                                                    ),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                10, 0, 10, 0),
                                                    child: Text(
                                                      productPageProductsRecord
                                                          .brand,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 5, 20, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 5, 0),
                                                  child: Text(
                                                    'SKU',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 15,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ),
                                                Text(
                                                  productPageProductsRecord.sku,
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1,
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 10, 20, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Container(
                                              height: 60,
                                              decoration: BoxDecoration(
                                                color: Color(0x00F9F9F9),
                                              ),
                                              child: Stack(
                                                children: [
                                                  if (productPageProductsRecord
                                                      .soldBy
                                                      .toList()
                                                      .contains(valueOrDefault(
                                                          currentUserDocument
                                                              ?.storeId,
                                                          '')))
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 30,
                                                          borderWidth: 1,
                                                          buttonSize: 60,
                                                          icon: Icon(
                                                            Icons
                                                                .toggle_on_sharp,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryColor,
                                                            size: 43,
                                                          ),
                                                          onPressed: () async {
                                                            final productsUpdateData =
                                                                {
                                                              'stores': FieldValue
                                                                  .arrayRemove([
                                                                valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.storeId,
                                                                    '')
                                                              ]),
                                                              'soldBy': FieldValue
                                                                  .arrayRemove([
                                                                valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.storeId,
                                                                    '')
                                                              ]),
                                                            };
                                                            await productPageProductsRecord
                                                                .reference
                                                                .update(
                                                                    productsUpdateData);

                                                            final storesUpdateData =
                                                                {
                                                              'listedButNoAvailableProducts':
                                                                  FieldValue
                                                                      .arrayRemove([
                                                                widget.productId
                                                              ]),
                                                              'recentlyAddedProducts':
                                                                  FieldValue
                                                                      .arrayRemove([
                                                                widget.productId
                                                              ]),
                                                            };
                                                            await columnStoresRecord
                                                                .reference
                                                                .update(
                                                                    storesUpdateData);
                                                          },
                                                        ),
                                                        Text(
                                                          'Listado',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFFC9C6C6),
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                  if (!productPageProductsRecord
                                                      .soldBy
                                                      .toList()
                                                      .contains(valueOrDefault(
                                                          currentUserDocument
                                                              ?.storeId,
                                                          '')))
                                                    Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      children: [
                                                        FlutterFlowIconButton(
                                                          borderColor: Colors
                                                              .transparent,
                                                          borderRadius: 30,
                                                          borderWidth: 1,
                                                          buttonSize: 60,
                                                          icon: Icon(
                                                            Icons
                                                                .toggle_off_outlined,
                                                            color: Color(
                                                                0xFFC9C6C6),
                                                            size: 43,
                                                          ),
                                                          onPressed: () async {
                                                            final productsUpdateData =
                                                                {
                                                              'soldBy': FieldValue
                                                                  .arrayUnion([
                                                                valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.storeId,
                                                                    '')
                                                              ]),
                                                            };
                                                            await productPageProductsRecord
                                                                .reference
                                                                .update(
                                                                    productsUpdateData);

                                                            final storesUpdateData =
                                                                {
                                                              'listedButNoAvailableProducts':
                                                                  FieldValue
                                                                      .arrayUnion([
                                                                widget.productId
                                                              ]),
                                                              'availableProducts':
                                                                  FieldValue
                                                                      .increment(
                                                                          1),
                                                              'recentlyAddedProducts':
                                                                  FieldValue
                                                                      .arrayUnion([
                                                                widget.productId
                                                              ]),
                                                            };
                                                            await columnStoresRecord
                                                                .reference
                                                                .update(
                                                                    storesUpdateData);
                                                          },
                                                        ),
                                                        Text(
                                                          'Sin Listar',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: Color(
                                                                    0xFFFDC054),
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        20, 10, 20, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        if (productPageProductsRecord.soldBy
                                            .toList()
                                            .contains(valueOrDefault(
                                                currentUserDocument?.storeId,
                                                '')))
                                          Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Container(
                                                height: 60,
                                                decoration: BoxDecoration(
                                                  color: Color(0x00F9F9F9),
                                                ),
                                                child: Stack(
                                                  children: [
                                                    if (productPageProductsRecord
                                                        .stores
                                                        .toList()
                                                        .contains(valueOrDefault(
                                                            currentUserDocument
                                                                ?.storeId,
                                                            '')))
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 30,
                                                            borderWidth: 1,
                                                            buttonSize: 60,
                                                            icon: Icon(
                                                              Icons
                                                                  .toggle_on_sharp,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                              size: 43,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              final productsUpdateData =
                                                                  {
                                                                'stores': FieldValue
                                                                    .arrayRemove([
                                                                  valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.storeId,
                                                                      '')
                                                                ]),
                                                              };
                                                              await productPageProductsRecord
                                                                  .reference
                                                                  .update(
                                                                      productsUpdateData);

                                                              final storesUpdateData =
                                                                  {
                                                                'listedButNoAvailableProducts':
                                                                    FieldValue
                                                                        .arrayUnion([
                                                                  widget
                                                                      .productId
                                                                ]),
                                                                'availableProducts':
                                                                    FieldValue
                                                                        .increment(
                                                                            -(1)),
                                                              };
                                                              await columnStoresRecord
                                                                  .reference
                                                                  .update(
                                                                      storesUpdateData);
                                                            },
                                                          ),
                                                          Text(
                                                            'Disponible Para Venta',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: Color(
                                                                      0xFFC9C6C6),
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                    if (!productPageProductsRecord
                                                        .stores
                                                        .toList()
                                                        .contains(valueOrDefault(
                                                            currentUserDocument
                                                                ?.storeId,
                                                            '')))
                                                      Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          FlutterFlowIconButton(
                                                            borderColor: Colors
                                                                .transparent,
                                                            borderRadius: 30,
                                                            borderWidth: 1,
                                                            buttonSize: 60,
                                                            icon: Icon(
                                                              Icons
                                                                  .toggle_off_outlined,
                                                              color: Color(
                                                                  0xFFC9C6C6),
                                                              size: 43,
                                                            ),
                                                            onPressed:
                                                                () async {
                                                              final productsUpdateData =
                                                                  {
                                                                'stores': FieldValue
                                                                    .arrayUnion([
                                                                  valueOrDefault(
                                                                      currentUserDocument
                                                                          ?.storeId,
                                                                      '')
                                                                ]),
                                                              };
                                                              await productPageProductsRecord
                                                                  .reference
                                                                  .update(
                                                                      productsUpdateData);

                                                              final storesUpdateData =
                                                                  {
                                                                'listedButNoAvailableProducts':
                                                                    FieldValue
                                                                        .arrayRemove([
                                                                  widget
                                                                      .productId
                                                                ]),
                                                              };
                                                              await columnStoresRecord
                                                                  .reference
                                                                  .update(
                                                                      storesUpdateData);
                                                            },
                                                          ),
                                                          Text(
                                                            'No Disponible',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: Color(
                                                                      0xFFFDC054),
                                                                ),
                                                          ),
                                                        ],
                                                      ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                color: Color(0x00D6D6D6),
                                                borderRadius:
                                                    BorderRadius.circular(50),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                  Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      FutureBuilder<ApiCallResponse>(
                                        future: GetApplicableVariantsCall.call(
                                          productId: widget.productId,
                                          userLocation: widget.storeLocation,
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                ),
                                              ),
                                            );
                                          }
                                          final varianteGetApplicableVariantsResponse =
                                              snapshot.data;
                                          return Builder(
                                            builder: (context) {
                                              final applicableVariants =
                                                  GetApplicableVariantsCall
                                                      .variants(
                                                varianteGetApplicableVariantsResponse
                                                    .jsonBody,
                                              ).toList();
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: List.generate(
                                                    applicableVariants.length,
                                                    (applicableVariantsIndex) {
                                                  final applicableVariantsItem =
                                                      applicableVariants[
                                                          applicableVariantsIndex];
                                                  return Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20, 0, 20, 10),
                                                    child: FutureBuilder<
                                                        ApiCallResponse>(
                                                      future:
                                                          GetTotalVariantInventoryByStoreCall
                                                              .call(
                                                        productId:
                                                            widget.productId,
                                                        variantId: getJsonField(
                                                          applicableVariantsItem,
                                                          r'''$.id''',
                                                        ).toString(),
                                                        store: valueOrDefault(
                                                            currentUserDocument
                                                                ?.storeId,
                                                            ''),
                                                      ),
                                                      builder:
                                                          (context, snapshot) {
                                                        // Customize what your widget looks like when it's loading.
                                                        if (!snapshot.hasData) {
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
                                                        final containerGetTotalVariantInventoryByStoreResponse =
                                                            snapshot.data;
                                                        return Container(
                                                          width: MediaQuery.of(
                                                                  context)
                                                              .size
                                                              .width,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .secondaryBackground,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 0,
                                                                color: Color(
                                                                    0x14000000),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        5),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        25,
                                                                        20,
                                                                        25,
                                                                        20),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .end,
                                                              children: [
                                                                Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              0,
                                                                              5,
                                                                              0),
                                                                      child:
                                                                          Text(
                                                                        'Unidad',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Montserrat',
                                                                              fontSize: 16,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      getJsonField(
                                                                        applicableVariantsItem,
                                                                        r'''$.unit''',
                                                                      ).toString(),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            fontSize:
                                                                                16,
                                                                          ),
                                                                    ),
                                                                  ],
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          5,
                                                                          0,
                                                                          30),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Text(
                                                                        'Inventario',
                                                                        style: FlutterFlowTheme.of(context)
                                                                            .bodyText1
                                                                            .override(
                                                                              fontFamily: 'Montserrat',
                                                                              color: FlutterFlowTheme.of(context).primaryText,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                      ),
                                                                      Padding(
                                                                        padding: EdgeInsetsDirectional.fromSTEB(
                                                                            5,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Text(
                                                                          valueOrDefault<
                                                                              String>(
                                                                            GetTotalVariantInventoryByStoreCall.inventory(
                                                                              containerGetTotalVariantInventoryByStoreResponse.jsonBody,
                                                                            ).toString(),
                                                                            '0',
                                                                          ),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Montserrat',
                                                                                color: FlutterFlowTheme.of(context).primaryText,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          0,
                                                                          20),
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.3,
                                                                    constraints:
                                                                        BoxConstraints(
                                                                      maxWidth:
                                                                          300,
                                                                    ),
                                                                    decoration:
                                                                        BoxDecoration(),
                                                                    child:
                                                                        FFButtonWidget(
                                                                      onPressed:
                                                                          () async {
                                                                        context
                                                                            .pushNamed(
                                                                          'VariantInventory',
                                                                          params:
                                                                              {
                                                                            'productId':
                                                                                serializeParam(widget.productId, ParamType.String),
                                                                          }.withoutNulls,
                                                                          queryParams:
                                                                              {
                                                                            'productTitle':
                                                                                serializeParam(productPageProductsRecord.title, ParamType.String),
                                                                            'unit': serializeParam(
                                                                                getJsonField(
                                                                                  applicableVariantsItem,
                                                                                  r'''$.unit''',
                                                                                ).toString(),
                                                                                ParamType.String),
                                                                            'initialInventory': serializeParam(
                                                                                valueOrDefault<int>(
                                                                                  GetTotalVariantInventoryByStoreCall.inventory(
                                                                                    containerGetTotalVariantInventoryByStoreResponse.jsonBody,
                                                                                  ),
                                                                                  0,
                                                                                ),
                                                                                ParamType.int),
                                                                            'publicPriceEnabled': serializeParam(
                                                                                getJsonField(
                                                                                  containerGetTotalVariantInventoryByStoreResponse.jsonBody,
                                                                                  r'''$.publicPriceEnabled''',
                                                                                ),
                                                                                ParamType.bool),
                                                                            'wholesalePriceEnabled': serializeParam(
                                                                                getJsonField(
                                                                                  containerGetTotalVariantInventoryByStoreResponse.jsonBody,
                                                                                  r'''$.wholesalePriceEnabled''',
                                                                                ),
                                                                                ParamType.bool),
                                                                            'megaWholesalePriceEnabled': serializeParam(
                                                                                getJsonField(
                                                                                  containerGetTotalVariantInventoryByStoreResponse.jsonBody,
                                                                                  r'''$.megaWholesalePriceEnabled''',
                                                                                ),
                                                                                ParamType.bool),
                                                                            'discount1Enabled': serializeParam(
                                                                                getJsonField(
                                                                                  containerGetTotalVariantInventoryByStoreResponse.jsonBody,
                                                                                  r'''$.discount1Enabled''',
                                                                                ),
                                                                                ParamType.bool),
                                                                            'discount2Enabled': serializeParam(
                                                                                getJsonField(
                                                                                  containerGetTotalVariantInventoryByStoreResponse.jsonBody,
                                                                                  r'''$.discount2Enabled''',
                                                                                ),
                                                                                ParamType.bool),
                                                                            'discount3Enabled': serializeParam(
                                                                                getJsonField(
                                                                                  containerGetTotalVariantInventoryByStoreResponse.jsonBody,
                                                                                  r'''$.discount3Enabled''',
                                                                                ),
                                                                                ParamType.bool),
                                                                            'variantId': serializeParam(
                                                                                getJsonField(
                                                                                  applicableVariantsItem,
                                                                                  r'''$.id''',
                                                                                ).toString(),
                                                                                ParamType.String),
                                                                          }.withoutNulls,
                                                                        );
                                                                      },
                                                                      text:
                                                                          'Modificar',
                                                                      options:
                                                                          FFButtonOptions(
                                                                        width:
                                                                            100,
                                                                        height:
                                                                            40,
                                                                        color: Color(
                                                                            0xACE9E9E9),
                                                                        textStyle: FlutterFlowTheme.of(context)
                                                                            .subtitle2
                                                                            .override(
                                                                              fontFamily: 'Montserrat',
                                                                              color: Colors.black,
                                                                              fontSize: 14,
                                                                              fontWeight: FontWeight.normal,
                                                                            ),
                                                                        elevation:
                                                                            0,
                                                                        borderSide:
                                                                            BorderSide(
                                                                          color:
                                                                              Colors.transparent,
                                                                          width:
                                                                              1,
                                                                        ),
                                                                        borderRadius:
                                                                            BorderRadius.circular(5),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Divider(
                                                                  height: 2,
                                                                  color: Color(
                                                                      0x62000000),
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
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          if (responsiveVisibility(
                            context: context,
                            phone: false,
                            tablet: false,
                          ))
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.4,
                                  height: 500,
                                  decoration: BoxDecoration(
                                    color: Color(0x00EEEEEE),
                                  ),
                                  child: Image.network(
                                    valueOrDefault<String>(
                                      productPageProductsRecord.mainImage,
                                      'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset.png?alt=media&token=85f6129c-7ee9-4db8-87ae-2e1adc4e010a',
                                    ),
                                    width: 100,
                                    height: 100,
                                    fit: BoxFit.contain,
                                  ),
                                ),
                                SingleChildScrollView(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.5,
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 0,
                                              color: Colors.transparent,
                                              offset: Offset(0, 0),
                                            )
                                          ],
                                          borderRadius: BorderRadius.only(
                                            bottomLeft: Radius.circular(0),
                                            bottomRight: Radius.circular(0),
                                            topLeft: Radius.circular(20),
                                            topRight: Radius.circular(20),
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  20, 20, 20, 0),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                productPageProductsRecord.title,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontSize: 22,
                                                        ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 5, 20, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.end,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 5, 0),
                                                      child: Text(
                                                        'Marca',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                      ),
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .secondaryBackground,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(50),
                                                        border: Border.all(
                                                          color:
                                                              Color(0x00656565),
                                                        ),
                                                      ),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(10, 0,
                                                                    10, 0),
                                                        child: Text(
                                                          productPageProductsRecord
                                                              .brand,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(0, 5, 20, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 5, 0),
                                                      child: Text(
                                                        'SKU',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontSize: 15,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                      ),
                                                    ),
                                                    Text(
                                                      productPageProductsRecord
                                                          .sku,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 20, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Container(
                                                  height: 60,
                                                  decoration: BoxDecoration(
                                                    color: Color(0x00F9F9F9),
                                                  ),
                                                  child: Stack(
                                                    children: [
                                                      if (productPageProductsRecord
                                                          .soldBy
                                                          .toList()
                                                          .contains(valueOrDefault(
                                                              currentUserDocument
                                                                  ?.storeId,
                                                              '')))
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius: 30,
                                                              borderWidth: 1,
                                                              buttonSize: 60,
                                                              icon: Icon(
                                                                Icons
                                                                    .toggle_on_sharp,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryColor,
                                                                size: 43,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                final productsUpdateData =
                                                                    {
                                                                  'stores':
                                                                      FieldValue
                                                                          .arrayRemove([
                                                                    valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.storeId,
                                                                        '')
                                                                  ]),
                                                                  'soldBy':
                                                                      FieldValue
                                                                          .arrayRemove([
                                                                    valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.storeId,
                                                                        '')
                                                                  ]),
                                                                };
                                                                await productPageProductsRecord
                                                                    .reference
                                                                    .update(
                                                                        productsUpdateData);

                                                                final storesUpdateData =
                                                                    {
                                                                  'listedButNoAvailableProducts':
                                                                      FieldValue
                                                                          .arrayRemove([
                                                                    widget
                                                                        .productId
                                                                  ]),
                                                                  'recentlyAddedProducts':
                                                                      FieldValue
                                                                          .arrayRemove([
                                                                    widget
                                                                        .productId
                                                                  ]),
                                                                };
                                                                await columnStoresRecord
                                                                    .reference
                                                                    .update(
                                                                        storesUpdateData);
                                                              },
                                                            ),
                                                            Text(
                                                              'Listado',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: Color(
                                                                        0xFFC9C6C6),
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                      if (!productPageProductsRecord
                                                          .soldBy
                                                          .toList()
                                                          .contains(valueOrDefault(
                                                              currentUserDocument
                                                                  ?.storeId,
                                                              '')))
                                                        Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            FlutterFlowIconButton(
                                                              borderColor: Colors
                                                                  .transparent,
                                                              borderRadius: 30,
                                                              borderWidth: 1,
                                                              buttonSize: 60,
                                                              icon: Icon(
                                                                Icons
                                                                    .toggle_off_outlined,
                                                                color: Color(
                                                                    0xFFC9C6C6),
                                                                size: 43,
                                                              ),
                                                              onPressed:
                                                                  () async {
                                                                final productsUpdateData =
                                                                    {
                                                                  'soldBy':
                                                                      FieldValue
                                                                          .arrayUnion([
                                                                    valueOrDefault(
                                                                        currentUserDocument
                                                                            ?.storeId,
                                                                        '')
                                                                  ]),
                                                                };
                                                                await productPageProductsRecord
                                                                    .reference
                                                                    .update(
                                                                        productsUpdateData);

                                                                final storesUpdateData =
                                                                    {
                                                                  'listedButNoAvailableProducts':
                                                                      FieldValue
                                                                          .arrayUnion([
                                                                    widget
                                                                        .productId
                                                                  ]),
                                                                  'availableProducts':
                                                                      FieldValue
                                                                          .increment(
                                                                              1),
                                                                  'recentlyAddedProducts':
                                                                      FieldValue
                                                                          .arrayUnion([
                                                                    widget
                                                                        .productId
                                                                  ]),
                                                                };
                                                                await columnStoresRecord
                                                                    .reference
                                                                    .update(
                                                                        storesUpdateData);
                                                              },
                                                            ),
                                                            Text(
                                                              'Sin Listar',
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText1
                                                                  .override(
                                                                    fontFamily:
                                                                        'Montserrat',
                                                                    color: Color(
                                                                        0xFFFDC054),
                                                                  ),
                                                            ),
                                                          ],
                                                        ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 10, 20, 0),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            if (productPageProductsRecord.soldBy
                                                .toList()
                                                .contains(valueOrDefault(
                                                    currentUserDocument
                                                        ?.storeId,
                                                    '')))
                                              Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Container(
                                                    height: 60,
                                                    decoration: BoxDecoration(
                                                      color: Color(0x00F9F9F9),
                                                    ),
                                                    child: Stack(
                                                      children: [
                                                        if (productPageProductsRecord
                                                            .stores
                                                            .toList()
                                                            .contains(valueOrDefault(
                                                                currentUserDocument
                                                                    ?.storeId,
                                                                '')))
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    30,
                                                                borderWidth: 1,
                                                                buttonSize: 60,
                                                                icon: Icon(
                                                                  Icons
                                                                      .toggle_on_sharp,
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                  size: 43,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  final productsUpdateData =
                                                                      {
                                                                    'stores':
                                                                        FieldValue
                                                                            .arrayRemove([
                                                                      valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.storeId,
                                                                          '')
                                                                    ]),
                                                                  };
                                                                  await productPageProductsRecord
                                                                      .reference
                                                                      .update(
                                                                          productsUpdateData);

                                                                  final storesUpdateData =
                                                                      {
                                                                    'listedButNoAvailableProducts':
                                                                        FieldValue
                                                                            .arrayUnion([
                                                                      widget
                                                                          .productId
                                                                    ]),
                                                                    'availableProducts':
                                                                        FieldValue.increment(
                                                                            -(1)),
                                                                  };
                                                                  await columnStoresRecord
                                                                      .reference
                                                                      .update(
                                                                          storesUpdateData);
                                                                },
                                                              ),
                                                              Text(
                                                                'Disponible Para Venta',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: Color(
                                                                          0xFFC9C6C6),
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                        if (!productPageProductsRecord
                                                            .stores
                                                            .toList()
                                                            .contains(valueOrDefault(
                                                                currentUserDocument
                                                                    ?.storeId,
                                                                '')))
                                                          Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              FlutterFlowIconButton(
                                                                borderColor: Colors
                                                                    .transparent,
                                                                borderRadius:
                                                                    30,
                                                                borderWidth: 1,
                                                                buttonSize: 60,
                                                                icon: Icon(
                                                                  Icons
                                                                      .toggle_off_outlined,
                                                                  color: Color(
                                                                      0xFFC9C6C6),
                                                                  size: 43,
                                                                ),
                                                                onPressed:
                                                                    () async {
                                                                  final productsUpdateData =
                                                                      {
                                                                    'stores':
                                                                        FieldValue
                                                                            .arrayUnion([
                                                                      valueOrDefault(
                                                                          currentUserDocument
                                                                              ?.storeId,
                                                                          '')
                                                                    ]),
                                                                  };
                                                                  await productPageProductsRecord
                                                                      .reference
                                                                      .update(
                                                                          productsUpdateData);

                                                                  final storesUpdateData =
                                                                      {
                                                                    'listedButNoAvailableProducts':
                                                                        FieldValue
                                                                            .arrayRemove([
                                                                      widget
                                                                          .productId
                                                                    ]),
                                                                  };
                                                                  await columnStoresRecord
                                                                      .reference
                                                                      .update(
                                                                          storesUpdateData);
                                                                },
                                                              ),
                                                              Text(
                                                                'No Disponible',
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText1
                                                                    .override(
                                                                      fontFamily:
                                                                          'Montserrat',
                                                                      color: Color(
                                                                          0xFFFDC054),
                                                                    ),
                                                              ),
                                                            ],
                                                          ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                          ],
                                        ),
                                      ),
                                      FutureBuilder<ApiCallResponse>(
                                        future: GetApplicableVariantsCall.call(
                                          productId: widget.productId,
                                          userLocation: widget.storeLocation,
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
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryColor,
                                                ),
                                              ),
                                            );
                                          }
                                          final variantesGetApplicableVariantsResponse =
                                              snapshot.data;
                                          return Builder(
                                            builder: (context) {
                                              final applicableVariant =
                                                  GetApplicableVariantsCall
                                                      .variants(
                                                variantesGetApplicableVariantsResponse
                                                    .jsonBody,
                                              ).toList();
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: List.generate(
                                                    applicableVariant.length,
                                                    (applicableVariantIndex) {
                                                  final applicableVariantItem =
                                                      applicableVariant[
                                                          applicableVariantIndex];
                                                  return Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(20, 0,
                                                                    20, 10),
                                                        child: FutureBuilder<
                                                            ApiCallResponse>(
                                                          future:
                                                              GetTotalVariantInventoryByStoreCall
                                                                  .call(
                                                            productId: widget
                                                                .productId,
                                                            variantId:
                                                                getJsonField(
                                                              applicableVariantItem,
                                                              r'''$.id''',
                                                            ).toString(),
                                                            store: valueOrDefault(
                                                                currentUserDocument
                                                                    ?.storeId,
                                                                ''),
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
                                                            final containerGetTotalVariantInventoryByStoreResponse =
                                                                snapshot.data;
                                                            return Container(
                                                              width: MediaQuery.of(
                                                                          context)
                                                                      .size
                                                                      .width *
                                                                  0.5,
                                                              decoration:
                                                                  BoxDecoration(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                boxShadow: [
                                                                  BoxShadow(
                                                                    blurRadius:
                                                                        0,
                                                                    color: Color(
                                                                        0x14000000),
                                                                  )
                                                                ],
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            5),
                                                              ),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            25,
                                                                            20,
                                                                            25,
                                                                            20),
                                                                child: Column(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  crossAxisAlignment:
                                                                      CrossAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      children: [
                                                                        Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              0,
                                                                              0,
                                                                              5,
                                                                              0),
                                                                          child:
                                                                              Text(
                                                                            'Unidad',
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Montserrat',
                                                                                  fontSize: 16,
                                                                                  fontWeight: FontWeight.normal,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        Text(
                                                                          getJsonField(
                                                                            applicableVariantItem,
                                                                            r'''$.unit''',
                                                                          ).toString(),
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Montserrat',
                                                                                fontSize: 16,
                                                                              ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              0,
                                                                              5,
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        crossAxisAlignment:
                                                                            CrossAxisAlignment.start,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Text(
                                                                                'Inventario',
                                                                                style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      color: FlutterFlowTheme.of(context).primaryText,
                                                                                      fontWeight: FontWeight.normal,
                                                                                    ),
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                                                                child: Text(
                                                                                  valueOrDefault<String>(
                                                                                    GetTotalVariantInventoryByStoreCall.inventory(
                                                                                      containerGetTotalVariantInventoryByStoreResponse.jsonBody,
                                                                                    ).toString(),
                                                                                    '0',
                                                                                  ),
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        color: FlutterFlowTheme.of(context).primaryText,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Container(
                                                                            width:
                                                                                MediaQuery.of(context).size.width * 0.3,
                                                                            constraints:
                                                                                BoxConstraints(
                                                                              maxWidth: 100,
                                                                            ),
                                                                            decoration:
                                                                                BoxDecoration(),
                                                                            child:
                                                                                FFButtonWidget(
                                                                              onPressed: () async {
                                                                                context.pushNamed(
                                                                                  'VariantInventory',
                                                                                  params: {
                                                                                    'productId': serializeParam(widget.productId, ParamType.String),
                                                                                  }.withoutNulls,
                                                                                  queryParams: {
                                                                                    'productTitle': serializeParam(productPageProductsRecord.title, ParamType.String),
                                                                                    'unit': serializeParam(
                                                                                        getJsonField(
                                                                                          applicableVariantItem,
                                                                                          r'''$.unit''',
                                                                                        ).toString(),
                                                                                        ParamType.String),
                                                                                    'initialInventory': serializeParam(
                                                                                        GetTotalVariantInventoryByStoreCall.inventory(
                                                                                          containerGetTotalVariantInventoryByStoreResponse.jsonBody,
                                                                                        ),
                                                                                        ParamType.int),
                                                                                    'publicPriceEnabled': serializeParam(
                                                                                        getJsonField(
                                                                                          containerGetTotalVariantInventoryByStoreResponse.jsonBody,
                                                                                          r'''$.publicPriceEnabled''',
                                                                                        ),
                                                                                        ParamType.bool),
                                                                                    'wholesalePriceEnabled': serializeParam(
                                                                                        getJsonField(
                                                                                          containerGetTotalVariantInventoryByStoreResponse.jsonBody,
                                                                                          r'''$.wholesalePriceEnabled''',
                                                                                        ),
                                                                                        ParamType.bool),
                                                                                    'megaWholesalePriceEnabled': serializeParam(
                                                                                        getJsonField(
                                                                                          containerGetTotalVariantInventoryByStoreResponse.jsonBody,
                                                                                          r'''$.megaWholesalePriceEnabled''',
                                                                                        ),
                                                                                        ParamType.bool),
                                                                                    'discount1Enabled': serializeParam(
                                                                                        getJsonField(
                                                                                          containerGetTotalVariantInventoryByStoreResponse.jsonBody,
                                                                                          r'''$.discount1Enabled''',
                                                                                        ),
                                                                                        ParamType.bool),
                                                                                    'discount2Enabled': serializeParam(
                                                                                        getJsonField(
                                                                                          containerGetTotalVariantInventoryByStoreResponse.jsonBody,
                                                                                          r'''$.discount2Enabled''',
                                                                                        ),
                                                                                        ParamType.bool),
                                                                                    'discount3Enabled': serializeParam(
                                                                                        getJsonField(
                                                                                          containerGetTotalVariantInventoryByStoreResponse.jsonBody,
                                                                                          r'''$.discount3Enabled''',
                                                                                        ),
                                                                                        ParamType.bool),
                                                                                    'variantId': serializeParam(
                                                                                        getJsonField(
                                                                                          applicableVariantItem,
                                                                                          r'''$.id''',
                                                                                        ).toString(),
                                                                                        ParamType.String),
                                                                                  }.withoutNulls,
                                                                                );
                                                                              },
                                                                              text: 'Modificar',
                                                                              options: FFButtonOptions(
                                                                                width: 100,
                                                                                height: 40,
                                                                                color: Color(0xACE9E9E9),
                                                                                textStyle: FlutterFlowTheme.of(context).subtitle2.override(
                                                                                      fontFamily: 'Montserrat',
                                                                                      color: Colors.black,
                                                                                      fontSize: 14,
                                                                                      fontWeight: FontWeight.normal,
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
                                                                    Divider(
                                                                      height: 2,
                                                                      color: Color(
                                                                          0x62000000),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          },
                                                        ),
                                                      ),
                                                    ],
                                                  );
                                                }),
                                              );
                                            },
                                          );
                                        },
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
