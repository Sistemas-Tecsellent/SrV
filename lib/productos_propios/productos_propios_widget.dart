import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductosPropiosWidget extends StatefulWidget {
  const ProductosPropiosWidget({
    Key key,
    this.brand,
  }) : super(key: key);

  final String brand;

  @override
  _ProductosPropiosWidgetState createState() => _ProductosPropiosWidgetState();
}

class _ProductosPropiosWidgetState extends State<ProductosPropiosWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: AppBar(
        backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
        automaticallyImplyLeading: false,
        leading: InkWell(
          onTap: () async {
            context.pop();
          },
          child: Icon(
            Icons.chevron_left_outlined,
            color: Colors.black,
            size: 24,
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
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(15, 10, 15, 0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: 50,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 0, 0),
                            child: Text(
                              'Buscar',
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.normal,
                                  ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(0, 0, 5, 0),
                            child: FlutterFlowIconButton(
                              borderColor: Colors.transparent,
                              borderRadius: 5,
                              borderWidth: 1,
                              buttonSize: 40,
                              fillColor: Color(0xFF1EEBBD),
                              icon: Icon(
                                Icons.search,
                                color: Colors.white,
                                size: 15,
                              ),
                              onPressed: () {
                                print('IconButton pressed ...');
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: DefaultTabController(
                  length: 2,
                  initialIndex: 0,
                  child: Column(
                    children: [
                      TabBar(
                        labelColor: FlutterFlowTheme.of(context).primaryText,
                        unselectedLabelColor:
                            FlutterFlowTheme.of(context).primaryText,
                        labelStyle:
                            FlutterFlowTheme.of(context).bodyText1.override(
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.normal,
                                ),
                        indicatorColor:
                            FlutterFlowTheme.of(context).secondaryColor,
                        tabs: [
                          Tab(
                            text: 'Disponibles',
                          ),
                          Tab(
                            text: 'No Disponibles',
                          ),
                        ],
                      ),
                      Expanded(
                        child: TabBarView(
                          children: [
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (responsiveVisibility(
                                  context: context,
                                  phone: false,
                                ))
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.7,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15, 10, 0, 0),
                                      child: AuthUserStreamWidget(
                                        child:
                                            StreamBuilder<List<ProductsRecord>>(
                                          stream: queryProductsRecord(
                                            queryBuilder: (productsRecord) =>
                                                productsRecord
                                                    .where('stores',
                                                        arrayContains:
                                                            valueOrDefault(
                                                                currentUserDocument
                                                                    ?.storeId,
                                                                ''))
                                                    .where('owner',
                                                        isEqualTo: valueOrDefault(
                                                            currentUserDocument
                                                                ?.storeId,
                                                            '')),
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
                                            List<ProductsRecord>
                                                gridViewProductsRecordList =
                                                snapshot.data;
                                            return GridView.builder(
                                              padding: EdgeInsets.zero,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 6,
                                                crossAxisSpacing: 0,
                                                mainAxisSpacing: 0,
                                                childAspectRatio: 0.7,
                                              ),
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  gridViewProductsRecordList
                                                      .length,
                                              itemBuilder:
                                                  (context, gridViewIndex) {
                                                final gridViewProductsRecord =
                                                    gridViewProductsRecordList[
                                                        gridViewIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 10, 15, 0),
                                                  child: StreamBuilder<
                                                      List<StoresRecord>>(
                                                    stream: queryStoresRecord(
                                                      queryBuilder: (storesRecord) =>
                                                          storesRecord.where(
                                                              'id',
                                                              isEqualTo: valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.storeId,
                                                                  '')),
                                                      singleRecord: true,
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<StoresRecord>
                                                          productStoresRecordList =
                                                          snapshot.data;
                                                      final productStoresRecord =
                                                          productStoresRecordList
                                                                  .isNotEmpty
                                                              ? productStoresRecordList
                                                                  .first
                                                              : null;
                                                      return InkWell(
                                                        onTap: () async {
                                                          context.pushNamed(
                                                            'ProductPage',
                                                            params: {
                                                              'productId':
                                                                  serializeParam(
                                                                      gridViewProductsRecord
                                                                          .id,
                                                                      ParamType
                                                                          .String),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        child: Container(
                                                          width: 150,
                                                          height: 200,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 5,
                                                                color: Color(
                                                                    0x0D000000),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        10,
                                                                        10,
                                                                        10,
                                                                        10),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          5,
                                                                          0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      if (gridViewProductsRecord
                                                                              .stores
                                                                              .toList()
                                                                              ?.contains(valueOrDefault(currentUserDocument?.storeId, '')) ??
                                                                          true)
                                                                        Icon(
                                                                          Icons
                                                                              .check_circle_rounded,
                                                                          color:
                                                                              Color(0xFF2FE74D),
                                                                          size:
                                                                              24,
                                                                        ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0, 0),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    child: Image
                                                                        .network(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        gridViewProductsRecord
                                                                            .mainImage,
                                                                        'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset.png?alt=media&token=85f6129c-7ee9-4db8-87ae-2e1adc4e010a',
                                                                      ),
                                                                      width:
                                                                          130,
                                                                      height:
                                                                          100,
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: 140,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  child: Text(
                                                                    gridViewProductsRecord
                                                                        .title
                                                                        .maybeHandleOverflow(
                                                                            maxChars:
                                                                                35),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color:
                                                                              Colors.black,
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.1,
                                                                          0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -0.45,
                                                                            -0.05),
                                                                        child:
                                                                            Text(
                                                                          gridViewProductsRecord
                                                                              .brand,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Montserrat',
                                                                                color: FlutterFlowTheme.of(context).primaryColor,
                                                                                fontSize: 11,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.1,
                                                                          0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -0.45,
                                                                            -0.05),
                                                                        child:
                                                                            Text(
                                                                          gridViewProductsRecord
                                                                              .sku,
                                                                          style: FlutterFlowTheme.of(context)
                                                                              .bodyText1
                                                                              .override(
                                                                                fontFamily: 'Montserrat',
                                                                                color: Color(0xFFAEAEAE),
                                                                                fontSize: 10,
                                                                                fontWeight: FontWeight.w500,
                                                                              ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                FutureBuilder<
                                                                    ApiCallResponse>(
                                                                  future:
                                                                      GetApplicableVariantsCall
                                                                          .call(
                                                                    productId:
                                                                        gridViewProductsRecord
                                                                            .id,
                                                                    userLocation:
                                                                        productStoresRecord
                                                                            .location,
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50,
                                                                          height:
                                                                              50,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    final columnGetApplicableVariantsResponse =
                                                                        snapshot
                                                                            .data;
                                                                    return Builder(
                                                                      builder:
                                                                          (context) {
                                                                        final variants1 = GetApplicableVariantsCall.variants(
                                                                              (columnGetApplicableVariantsResponse?.jsonBody ?? ''),
                                                                            )?.toList() ??
                                                                            [];
                                                                        return Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: List.generate(
                                                                              variants1.length,
                                                                              (variants1Index) {
                                                                            final variants1Item =
                                                                                variants1[variants1Index];
                                                                            return Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Text(
                                                                                    'Stock:',
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: Colors.black,
                                                                                          fontSize: 9,
                                                                                          fontWeight: FontWeight.normal,
                                                                                        ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                                                                                    child: FutureBuilder<ApiCallResponse>(
                                                                                      future: GetTotalVariantInventoryByStoreCall.call(
                                                                                        productId: gridViewProductsRecord.id,
                                                                                        variantId: getJsonField(
                                                                                          variants1Item,
                                                                                          r'''$.id''',
                                                                                        ).toString(),
                                                                                        store: valueOrDefault(currentUserDocument?.storeId, ''),
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
                                                                                        final textGetTotalVariantInventoryByStoreResponse = snapshot.data;
                                                                                        return Text(
                                                                                          GetTotalVariantInventoryByStoreCall.inventory(
                                                                                            (textGetTotalVariantInventoryByStoreResponse?.jsonBody ?? ''),
                                                                                          ).toString().maybeHandleOverflow(maxChars: 18),
                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                fontFamily: 'Montserrat',
                                                                                                color: Colors.black,
                                                                                                fontSize: 9,
                                                                                                fontWeight: FontWeight.normal,
                                                                                              ),
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                                                                                    child: Text(
                                                                                      getJsonField(
                                                                                        variants1Item,
                                                                                        r'''$.unit''',
                                                                                      ).toString().maybeHandleOverflow(maxChars: 18),
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: Colors.black,
                                                                                            fontSize: 9,
                                                                                            fontWeight: FontWeight.normal,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                ],
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
                                                          ),
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                if (responsiveVisibility(
                                  context: context,
                                  tabletLandscape: false,
                                  desktop: false,
                                ))
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.7,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15, 10, 0, 0),
                                      child: AuthUserStreamWidget(
                                        child:
                                            StreamBuilder<List<ProductsRecord>>(
                                          stream: queryProductsRecord(
                                            queryBuilder: (productsRecord) =>
                                                productsRecord
                                                    .where('stores',
                                                        arrayContains:
                                                            valueOrDefault(
                                                                currentUserDocument
                                                                    ?.storeId,
                                                                ''))
                                                    .where('owner',
                                                        isEqualTo: valueOrDefault(
                                                            currentUserDocument
                                                                ?.storeId,
                                                            '')),
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
                                            List<ProductsRecord>
                                                gridViewProductsRecordList =
                                                snapshot.data;
                                            return GridView.builder(
                                              padding: EdgeInsets.zero,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                crossAxisSpacing: 0,
                                                mainAxisSpacing: 0,
                                                childAspectRatio: 0.7,
                                              ),
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  gridViewProductsRecordList
                                                      .length,
                                              itemBuilder:
                                                  (context, gridViewIndex) {
                                                final gridViewProductsRecord =
                                                    gridViewProductsRecordList[
                                                        gridViewIndex];
                                                return Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 10, 15, 0),
                                                  child: StreamBuilder<
                                                      List<StoresRecord>>(
                                                    stream: queryStoresRecord(
                                                      queryBuilder: (storesRecord) =>
                                                          storesRecord.where(
                                                              'id',
                                                              isEqualTo: valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.storeId,
                                                                  '')),
                                                      singleRecord: true,
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
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .primaryColor,
                                                            ),
                                                          ),
                                                        );
                                                      }
                                                      List<StoresRecord>
                                                          productStoresRecordList =
                                                          snapshot.data;
                                                      final productStoresRecord =
                                                          productStoresRecordList
                                                                  .isNotEmpty
                                                              ? productStoresRecordList
                                                                  .first
                                                              : null;
                                                      return InkWell(
                                                        onTap: () async {
                                                          context.pushNamed(
                                                            'ProductPage',
                                                            params: {
                                                              'productId':
                                                                  serializeParam(
                                                                      gridViewProductsRecord
                                                                          .id,
                                                                      ParamType
                                                                          .String),
                                                            }.withoutNulls,
                                                          );
                                                        },
                                                        child: Container(
                                                          width: 150,
                                                          height: 200,
                                                          decoration:
                                                              BoxDecoration(
                                                            color: Colors.white,
                                                            boxShadow: [
                                                              BoxShadow(
                                                                blurRadius: 5,
                                                                color: Color(
                                                                    0x0D000000),
                                                              )
                                                            ],
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                          ),
                                                          child: Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceEvenly,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            5,
                                                                            0),
                                                                child: Row(
                                                                  mainAxisSize:
                                                                      MainAxisSize
                                                                          .max,
                                                                  mainAxisAlignment:
                                                                      MainAxisAlignment
                                                                          .end,
                                                                  children: [
                                                                    if (gridViewProductsRecord
                                                                            .stores
                                                                            .toList()
                                                                            ?.contains(valueOrDefault(currentUserDocument?.storeId,
                                                                                '')) ??
                                                                        true)
                                                                      Icon(
                                                                        Icons
                                                                            .check_circle_rounded,
                                                                        color: Color(
                                                                            0xFF2FE74D),
                                                                        size:
                                                                            24,
                                                                      ),
                                                                  ],
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0, 0),
                                                                child:
                                                                    ClipRRect(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  child: Image
                                                                      .network(
                                                                    valueOrDefault<
                                                                        String>(
                                                                      gridViewProductsRecord
                                                                          .mainImage,
                                                                      'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset.png?alt=media&token=85f6129c-7ee9-4db8-87ae-2e1adc4e010a',
                                                                    ),
                                                                    width: 130,
                                                                    height: 100,
                                                                    fit: BoxFit
                                                                        .contain,
                                                                  ),
                                                                ),
                                                              ),
                                                              Container(
                                                                width: 140,
                                                                decoration:
                                                                    BoxDecoration(
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child: Text(
                                                                    gridViewProductsRecord
                                                                        .title
                                                                        .maybeHandleOverflow(
                                                                            maxChars:
                                                                                35),
                                                                    style: FlutterFlowTheme.of(
                                                                            context)
                                                                        .bodyText1
                                                                        .override(
                                                                          fontFamily:
                                                                              'Montserrat',
                                                                          color:
                                                                              Colors.black,
                                                                          fontSize:
                                                                              12,
                                                                          fontWeight:
                                                                              FontWeight.w500,
                                                                        ),
                                                                  ),
                                                                ),
                                                              ),
                                                              Align(
                                                                alignment:
                                                                    AlignmentDirectional(
                                                                        0.1, 0),
                                                                child: Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          5,
                                                                          0,
                                                                          0,
                                                                          0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .start,
                                                                    children: [
                                                                      Align(
                                                                        alignment: AlignmentDirectional(
                                                                            -0.45,
                                                                            -0.05),
                                                                        child:
                                                                            Padding(
                                                                          padding: EdgeInsetsDirectional.fromSTEB(
                                                                              5,
                                                                              0,
                                                                              0,
                                                                              0),
                                                                          child:
                                                                              Text(
                                                                            gridViewProductsRecord.brand,
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Montserrat',
                                                                                  color: Color(0xFFAEAEAE),
                                                                                  fontSize: 12,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                              FutureBuilder<
                                                                  ApiCallResponse>(
                                                                future:
                                                                    GetApplicableVariantsCall
                                                                        .call(
                                                                  productId:
                                                                      gridViewProductsRecord
                                                                          .id,
                                                                  userLocation:
                                                                      productStoresRecord
                                                                          .location,
                                                                ),
                                                                builder: (context,
                                                                    snapshot) {
                                                                  // Customize what your widget looks like when it's loading.
                                                                  if (!snapshot
                                                                      .hasData) {
                                                                    return Center(
                                                                      child:
                                                                          SizedBox(
                                                                        width:
                                                                            50,
                                                                        height:
                                                                            50,
                                                                        child:
                                                                            CircularProgressIndicator(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).primaryColor,
                                                                        ),
                                                                      ),
                                                                    );
                                                                  }
                                                                  final columnGetApplicableVariantsResponse =
                                                                      snapshot
                                                                          .data;
                                                                  return Builder(
                                                                    builder:
                                                                        (context) {
                                                                      final variants =
                                                                          GetApplicableVariantsCall.variants(
                                                                                (columnGetApplicableVariantsResponse?.jsonBody ?? ''),
                                                                              )?.toList() ??
                                                                              [];
                                                                      return Column(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        children: List.generate(
                                                                            variants.length,
                                                                            (variantsIndex) {
                                                                          final variantsItem =
                                                                              variants[variantsIndex];
                                                                          return Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                5,
                                                                                0,
                                                                                0,
                                                                                2),
                                                                            child:
                                                                                Row(
                                                                              mainAxisSize: MainAxisSize.max,
                                                                              children: [
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                                                                  child: Text(
                                                                                    getJsonField(
                                                                                      variantsItem,
                                                                                      r'''$.unit''',
                                                                                    ).toString().maybeHandleOverflow(maxChars: 18),
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: Colors.black,
                                                                                          fontSize: 12,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                                                                                  child: Text(
                                                                                    'x',
                                                                                    style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                          fontFamily: 'Montserrat',
                                                                                          color: Colors.black,
                                                                                          fontSize: 12,
                                                                                          fontWeight: FontWeight.w500,
                                                                                        ),
                                                                                  ),
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                                                                                  child: FutureBuilder<ApiCallResponse>(
                                                                                    future: GetTotalVariantInventoryByStoreCall.call(
                                                                                      productId: gridViewProductsRecord.id,
                                                                                      variantId: getJsonField(
                                                                                        variantsItem,
                                                                                        r'''$.id''',
                                                                                      ).toString(),
                                                                                      store: valueOrDefault(currentUserDocument?.storeId, ''),
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
                                                                                      final textGetTotalVariantInventoryByStoreResponse = snapshot.data;
                                                                                      return Text(
                                                                                        GetTotalVariantInventoryByStoreCall.inventory(
                                                                                          (textGetTotalVariantInventoryByStoreResponse?.jsonBody ?? ''),
                                                                                        ).toString().maybeHandleOverflow(maxChars: 18),
                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                              fontFamily: 'Montserrat',
                                                                                              color: Colors.black,
                                                                                              fontSize: 12,
                                                                                              fontWeight: FontWeight.w500,
                                                                                            ),
                                                                                      );
                                                                                    },
                                                                                  ),
                                                                                ),
                                                                              ],
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
                                                        ),
                                                      );
                                                    },
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                            Column(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                if (responsiveVisibility(
                                  context: context,
                                  phone: false,
                                  tablet: false,
                                ))
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.7,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15, 10, 0, 0),
                                      child: AuthUserStreamWidget(
                                        child:
                                            StreamBuilder<List<ProductsRecord>>(
                                          stream: queryProductsRecord(
                                            queryBuilder: (productsRecord) =>
                                                productsRecord
                                                    .where('soldBy',
                                                        arrayContains:
                                                            valueOrDefault(
                                                                currentUserDocument
                                                                    ?.storeId,
                                                                ''))
                                                    .where('owner',
                                                        isEqualTo: valueOrDefault(
                                                            currentUserDocument
                                                                ?.storeId,
                                                            '')),
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
                                            List<ProductsRecord>
                                                gridViewProductsRecordList =
                                                snapshot.data;
                                            return GridView.builder(
                                              padding: EdgeInsets.zero,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 6,
                                                crossAxisSpacing: 0,
                                                mainAxisSpacing: 0,
                                                childAspectRatio: 0.7,
                                              ),
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  gridViewProductsRecordList
                                                      .length,
                                              itemBuilder:
                                                  (context, gridViewIndex) {
                                                final gridViewProductsRecord =
                                                    gridViewProductsRecordList[
                                                        gridViewIndex];
                                                return Visibility(
                                                  visible: !(gridViewProductsRecord
                                                          .stores
                                                          .toList()
                                                          .contains(valueOrDefault(
                                                              currentUserDocument
                                                                  ?.storeId,
                                                              ''))) ??
                                                      true,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 10, 15, 0),
                                                    child: StreamBuilder<
                                                        List<StoresRecord>>(
                                                      stream: queryStoresRecord(
                                                        queryBuilder: (storesRecord) =>
                                                            storesRecord.where(
                                                                'id',
                                                                isEqualTo: valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.storeId,
                                                                    '')),
                                                        singleRecord: true,
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
                                                        List<StoresRecord>
                                                            productStoresRecordList =
                                                            snapshot.data;
                                                        final productStoresRecord =
                                                            productStoresRecordList
                                                                    .isNotEmpty
                                                                ? productStoresRecordList
                                                                    .first
                                                                : null;
                                                        return InkWell(
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              'ProductPage',
                                                              params: {
                                                                'productId': serializeParam(
                                                                    gridViewProductsRecord
                                                                        .id,
                                                                    ParamType
                                                                        .String),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: Container(
                                                            width: 150,
                                                            height: 200,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius: 5,
                                                                  color: Color(
                                                                      0x0D000000),
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            child: Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          10,
                                                                          10,
                                                                          10,
                                                                          10),
                                                              child: Column(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .spaceEvenly,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            0,
                                                                            0,
                                                                            5,
                                                                            0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .end,
                                                                      children: [
                                                                        InkWell(
                                                                          onTap:
                                                                              () async {
                                                                            context.pushNamed(
                                                                              'ProductPage',
                                                                              params: {
                                                                                'productId': serializeParam(gridViewProductsRecord.id, ParamType.String),
                                                                              }.withoutNulls,
                                                                            );
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            Icons.add_circle_sharp,
                                                                            color:
                                                                                Color(0xFFAEAEAE),
                                                                            size:
                                                                                24,
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        ClipRRect(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                      child: Image
                                                                          .network(
                                                                        valueOrDefault<
                                                                            String>(
                                                                          gridViewProductsRecord
                                                                              .mainImage,
                                                                          'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset.png?alt=media&token=85f6129c-7ee9-4db8-87ae-2e1adc4e010a',
                                                                        ),
                                                                        width:
                                                                            130,
                                                                        height:
                                                                            100,
                                                                        fit: BoxFit
                                                                            .contain,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Container(
                                                                    width: 140,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                    ),
                                                                    child: Text(
                                                                      gridViewProductsRecord
                                                                          .title
                                                                          .maybeHandleOverflow(
                                                                              maxChars: 35),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.1,
                                                                            0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              -0.45,
                                                                              -0.05),
                                                                          child:
                                                                              Text(
                                                                            gridViewProductsRecord.brand,
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Montserrat',
                                                                                  color: FlutterFlowTheme.of(context).primaryColor,
                                                                                  fontSize: 11,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Align(
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0.1,
                                                                            0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              -0.45,
                                                                              -0.05),
                                                                          child:
                                                                              Text(
                                                                            gridViewProductsRecord.sku,
                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                  fontFamily: 'Montserrat',
                                                                                  color: Color(0xFFAEAEAE),
                                                                                  fontSize: 10,
                                                                                  fontWeight: FontWeight.w500,
                                                                                ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  FutureBuilder<
                                                                      ApiCallResponse>(
                                                                    future:
                                                                        GetApplicableVariantsCall
                                                                            .call(
                                                                      productId:
                                                                          gridViewProductsRecord
                                                                              .id,
                                                                      userLocation:
                                                                          productStoresRecord
                                                                              .location,
                                                                    ),
                                                                    builder:
                                                                        (context,
                                                                            snapshot) {
                                                                      // Customize what your widget looks like when it's loading.
                                                                      if (!snapshot
                                                                          .hasData) {
                                                                        return Center(
                                                                          child:
                                                                              SizedBox(
                                                                            width:
                                                                                50,
                                                                            height:
                                                                                50,
                                                                            child:
                                                                                CircularProgressIndicator(
                                                                              color: FlutterFlowTheme.of(context).primaryColor,
                                                                            ),
                                                                          ),
                                                                        );
                                                                      }
                                                                      final columnGetApplicableVariantsResponse =
                                                                          snapshot
                                                                              .data;
                                                                      return Builder(
                                                                        builder:
                                                                            (context) {
                                                                          final variant2 = GetApplicableVariantsCall.variants(
                                                                                (columnGetApplicableVariantsResponse?.jsonBody ?? ''),
                                                                              )?.toList() ??
                                                                              [];
                                                                          return Column(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children:
                                                                                List.generate(variant2.length, (variant2Index) {
                                                                              final variant2Item = variant2[variant2Index];
                                                                              return Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
                                                                                child: Row(
                                                                                  mainAxisSize: MainAxisSize.max,
                                                                                  children: [
                                                                                    Text(
                                                                                      'Stock:',
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: Colors.black,
                                                                                            fontSize: 9,
                                                                                            fontWeight: FontWeight.normal,
                                                                                          ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                                                                                      child: FutureBuilder<ApiCallResponse>(
                                                                                        future: GetTotalVariantInventoryByStoreCall.call(
                                                                                          productId: gridViewProductsRecord.id,
                                                                                          variantId: getJsonField(
                                                                                            variant2Item,
                                                                                            r'''$.id''',
                                                                                          ).toString(),
                                                                                          store: valueOrDefault(currentUserDocument?.storeId, ''),
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
                                                                                          final textGetTotalVariantInventoryByStoreResponse = snapshot.data;
                                                                                          return Text(
                                                                                            GetTotalVariantInventoryByStoreCall.inventory(
                                                                                              (textGetTotalVariantInventoryByStoreResponse?.jsonBody ?? ''),
                                                                                            ).toString().maybeHandleOverflow(maxChars: 18),
                                                                                            style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                  fontFamily: 'Montserrat',
                                                                                                  color: Colors.black,
                                                                                                  fontSize: 9,
                                                                                                  fontWeight: FontWeight.normal,
                                                                                                ),
                                                                                          );
                                                                                        },
                                                                                      ),
                                                                                    ),
                                                                                    Padding(
                                                                                      padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                                                                                      child: Text(
                                                                                        getJsonField(
                                                                                          variant2Item,
                                                                                          r'''$.unit''',
                                                                                        ).toString().maybeHandleOverflow(maxChars: 18),
                                                                                        style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                              fontFamily: 'Montserrat',
                                                                                              color: Colors.black,
                                                                                              fontSize: 9,
                                                                                              fontWeight: FontWeight.normal,
                                                                                            ),
                                                                                      ),
                                                                                    ),
                                                                                  ],
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
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                if (responsiveVisibility(
                                  context: context,
                                  tabletLandscape: false,
                                  desktop: false,
                                ))
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height *
                                        0.7,
                                    decoration: BoxDecoration(),
                                    child: Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          15, 10, 0, 0),
                                      child: AuthUserStreamWidget(
                                        child:
                                            StreamBuilder<List<ProductsRecord>>(
                                          stream: queryProductsRecord(
                                            queryBuilder: (productsRecord) =>
                                                productsRecord
                                                    .where('soldBy',
                                                        arrayContains:
                                                            valueOrDefault(
                                                                currentUserDocument
                                                                    ?.storeId,
                                                                ''))
                                                    .where('owner',
                                                        isEqualTo: valueOrDefault(
                                                            currentUserDocument
                                                                ?.storeId,
                                                            '')),
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
                                            List<ProductsRecord>
                                                gridViewProductsRecordList =
                                                snapshot.data;
                                            return GridView.builder(
                                              padding: EdgeInsets.zero,
                                              gridDelegate:
                                                  SliverGridDelegateWithFixedCrossAxisCount(
                                                crossAxisCount: 2,
                                                crossAxisSpacing: 0,
                                                mainAxisSpacing: 0,
                                                childAspectRatio: 0.7,
                                              ),
                                              scrollDirection: Axis.vertical,
                                              itemCount:
                                                  gridViewProductsRecordList
                                                      .length,
                                              itemBuilder:
                                                  (context, gridViewIndex) {
                                                final gridViewProductsRecord =
                                                    gridViewProductsRecordList[
                                                        gridViewIndex];
                                                return Visibility(
                                                  visible: !(gridViewProductsRecord
                                                          .stores
                                                          .toList()
                                                          .contains(valueOrDefault(
                                                              currentUserDocument
                                                                  ?.storeId,
                                                              ''))) ??
                                                      true,
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 10, 15, 0),
                                                    child: StreamBuilder<
                                                        List<StoresRecord>>(
                                                      stream: queryStoresRecord(
                                                        queryBuilder: (storesRecord) =>
                                                            storesRecord.where(
                                                                'id',
                                                                isEqualTo: valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.storeId,
                                                                    '')),
                                                        singleRecord: true,
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
                                                        List<StoresRecord>
                                                            productStoresRecordList =
                                                            snapshot.data;
                                                        final productStoresRecord =
                                                            productStoresRecordList
                                                                    .isNotEmpty
                                                                ? productStoresRecordList
                                                                    .first
                                                                : null;
                                                        return InkWell(
                                                          onTap: () async {
                                                            context.pushNamed(
                                                              'ProductPage',
                                                              params: {
                                                                'productId': serializeParam(
                                                                    gridViewProductsRecord
                                                                        .id,
                                                                    ParamType
                                                                        .String),
                                                              }.withoutNulls,
                                                            );
                                                          },
                                                          child: Container(
                                                            width: 150,
                                                            height: 200,
                                                            decoration:
                                                                BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              boxShadow: [
                                                                BoxShadow(
                                                                  blurRadius: 5,
                                                                  color: Color(
                                                                      0x0D000000),
                                                                )
                                                              ],
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .max,
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceEvenly,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              children: [
                                                                Padding(
                                                                  padding: EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          0,
                                                                          0,
                                                                          5,
                                                                          0),
                                                                  child: Row(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .end,
                                                                    children: [
                                                                      InkWell(
                                                                        onTap:
                                                                            () async {
                                                                          context
                                                                              .pushNamed(
                                                                            'ProductPage',
                                                                            params:
                                                                                {
                                                                              'productId': serializeParam(gridViewProductsRecord.id, ParamType.String),
                                                                            }.withoutNulls,
                                                                          );
                                                                        },
                                                                        child:
                                                                            Icon(
                                                                          Icons
                                                                              .add_circle_sharp,
                                                                          color:
                                                                              Color(0xFFAEAEAE),
                                                                          size:
                                                                              24,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0, 0),
                                                                  child:
                                                                      ClipRRect(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            10),
                                                                    child: Image
                                                                        .network(
                                                                      valueOrDefault<
                                                                          String>(
                                                                        gridViewProductsRecord
                                                                            .mainImage,
                                                                        'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset.png?alt=media&token=85f6129c-7ee9-4db8-87ae-2e1adc4e010a',
                                                                      ),
                                                                      width:
                                                                          130,
                                                                      height:
                                                                          100,
                                                                      fit: BoxFit
                                                                          .contain,
                                                                    ),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  width: 140,
                                                                  decoration:
                                                                      BoxDecoration(
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      gridViewProductsRecord
                                                                          .title
                                                                          .maybeHandleOverflow(
                                                                              maxChars: 35),
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color:
                                                                                Colors.black,
                                                                            fontSize:
                                                                                12,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ),
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0.1,
                                                                          0),
                                                                  child:
                                                                      Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            5,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child: Row(
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .max,
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        Align(
                                                                          alignment: AlignmentDirectional(
                                                                              -0.45,
                                                                              -0.05),
                                                                          child:
                                                                              Padding(
                                                                            padding: EdgeInsetsDirectional.fromSTEB(
                                                                                5,
                                                                                0,
                                                                                0,
                                                                                0),
                                                                            child:
                                                                                Text(
                                                                              gridViewProductsRecord.brand,
                                                                              style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                    fontFamily: 'Montserrat',
                                                                                    color: Color(0xFFAEAEAE),
                                                                                    fontSize: 12,
                                                                                    fontWeight: FontWeight.w500,
                                                                                  ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                FutureBuilder<
                                                                    ApiCallResponse>(
                                                                  future:
                                                                      GetApplicableVariantsCall
                                                                          .call(
                                                                    productId:
                                                                        gridViewProductsRecord
                                                                            .id,
                                                                    userLocation:
                                                                        productStoresRecord
                                                                            .location,
                                                                  ),
                                                                  builder: (context,
                                                                      snapshot) {
                                                                    // Customize what your widget looks like when it's loading.
                                                                    if (!snapshot
                                                                        .hasData) {
                                                                      return Center(
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              50,
                                                                          height:
                                                                              50,
                                                                          child:
                                                                              CircularProgressIndicator(
                                                                            color:
                                                                                FlutterFlowTheme.of(context).primaryColor,
                                                                          ),
                                                                        ),
                                                                      );
                                                                    }
                                                                    final columnGetApplicableVariantsResponse =
                                                                        snapshot
                                                                            .data;
                                                                    return Builder(
                                                                      builder:
                                                                          (context) {
                                                                        final variant = GetApplicableVariantsCall.variants(
                                                                              (columnGetApplicableVariantsResponse?.jsonBody ?? ''),
                                                                            )?.toList() ??
                                                                            [];
                                                                        return Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.max,
                                                                          children: List.generate(
                                                                              variant.length,
                                                                              (variantIndex) {
                                                                            final variantItem =
                                                                                variant[variantIndex];
                                                                            return Padding(
                                                                              padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 2),
                                                                              child: Row(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                children: [
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(5, 0, 0, 0),
                                                                                    child: Text(
                                                                                      getJsonField(
                                                                                        variantItem,
                                                                                        r'''$.unit''',
                                                                                      ).toString().maybeHandleOverflow(maxChars: 18),
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: Colors.black,
                                                                                            fontSize: 12,
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                                                                                    child: Text(
                                                                                      'x',
                                                                                      style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                            fontFamily: 'Montserrat',
                                                                                            color: Colors.black,
                                                                                            fontSize: 12,
                                                                                            fontWeight: FontWeight.w500,
                                                                                          ),
                                                                                    ),
                                                                                  ),
                                                                                  Padding(
                                                                                    padding: EdgeInsetsDirectional.fromSTEB(2, 0, 0, 0),
                                                                                    child: FutureBuilder<ApiCallResponse>(
                                                                                      future: GetTotalVariantInventoryByStoreCall.call(
                                                                                        productId: gridViewProductsRecord.id,
                                                                                        variantId: getJsonField(
                                                                                          variantItem,
                                                                                          r'''$.id''',
                                                                                        ).toString(),
                                                                                        store: valueOrDefault(currentUserDocument?.storeId, ''),
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
                                                                                        final textGetTotalVariantInventoryByStoreResponse = snapshot.data;
                                                                                        return Text(
                                                                                          GetTotalVariantInventoryByStoreCall.inventory(
                                                                                            (textGetTotalVariantInventoryByStoreResponse?.jsonBody ?? ''),
                                                                                          ).toString().maybeHandleOverflow(maxChars: 18),
                                                                                          style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                                fontFamily: 'Montserrat',
                                                                                                color: Colors.black,
                                                                                                fontSize: 12,
                                                                                                fontWeight: FontWeight.w500,
                                                                                              ),
                                                                                        );
                                                                                      },
                                                                                    ),
                                                                                  ),
                                                                                ],
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
                                                          ),
                                                        );
                                                      },
                                                    ),
                                                  ),
                                                );
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
