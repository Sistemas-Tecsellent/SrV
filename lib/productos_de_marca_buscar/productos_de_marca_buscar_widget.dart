import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/product_card_grid_desk_widget.dart';
import '../components/product_card_grid_mobile_widget.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductosDeMarcaBuscarWidget extends StatefulWidget {
  const ProductosDeMarcaBuscarWidget({
    Key key,
    this.brand,
  }) : super(key: key);

  final String brand;

  @override
  _ProductosDeMarcaBuscarWidgetState createState() =>
      _ProductosDeMarcaBuscarWidgetState();
}

class _ProductosDeMarcaBuscarWidgetState
    extends State<ProductosDeMarcaBuscarWidget> {
  List<ProductsRecord> algoliaSearchResults = [];
  TextEditingController buscarWebController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    buscarWebController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return AuthUserStreamWidget(
      child: FutureBuilder<List<StoresRecord>>(
        future: queryStoresRecordOnce(
          queryBuilder: (storesRecord) => storesRecord.where('id',
              isEqualTo: valueOrDefault(currentUserDocument?.storeId, '')),
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
          List<StoresRecord> productosDeMarcaBuscarStoresRecordList =
              snapshot.data;
          // Return an empty Container when the document does not exist.
          if (snapshot.data.isEmpty) {
            return Container();
          }
          final productosDeMarcaBuscarStoresRecord =
              productosDeMarcaBuscarStoresRecordList.isNotEmpty
                  ? productosDeMarcaBuscarStoresRecordList.first
                  : null;
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
              title: Text(
                widget.brand,
                style: FlutterFlowTheme.of(context).bodyText1,
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
                          InkWell(
                            onTap: () async {
                              context.pushNamed(
                                'ProductosDeMarcaList',
                                params: {
                                  'brand': serializeParam(
                                      widget.brand, ParamType.String),
                                }.withoutNulls,
                              );
                            },
                            child: Container(
                              width: MediaQuery.of(context).size.width * 0.9,
                              height: 50,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Expanded(
                                    child: TextFormField(
                                      controller: buscarWebController,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        'buscarWebController',
                                        Duration(milliseconds: 2000),
                                        () async {
                                          setState(() =>
                                              algoliaSearchResults = null);
                                          await ProductsRecord.search(
                                            term: buscarWebController.text,
                                            maxResults: 50,
                                          )
                                              .then((r) =>
                                                  algoliaSearchResults = r)
                                              .onError((_, __) =>
                                                  algoliaSearchResults = [])
                                              .whenComplete(
                                                  () => setState(() {}));
                                        },
                                      ),
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Buscar',
                                        hintText: 'Buscar',
                                        hintStyle: FlutterFlowTheme.of(context)
                                            .bodyText2,
                                        enabledBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        focusedBorder: UnderlineInputBorder(
                                          borderSide: BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius: const BorderRadius.only(
                                            topLeft: Radius.circular(4.0),
                                            topRight: Radius.circular(4.0),
                                          ),
                                        ),
                                        contentPadding:
                                            EdgeInsetsDirectional.fromSTEB(
                                                10, 20, 0, 0),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1,
                                      textAlign: TextAlign.start,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 5, 0),
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
                              labelColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              unselectedLabelColor:
                                  FlutterFlowTheme.of(context).primaryText,
                              labelStyle: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Montserrat',
                                    fontWeight: FontWeight.normal,
                                  ),
                              indicatorColor:
                                  FlutterFlowTheme.of(context).secondaryColor,
                              tabs: [
                                Tab(
                                  text: 'Listados',
                                ),
                                Tab(
                                  text: 'No Listados',
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
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.7,
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15, 10, 0, 0),
                                            child: FutureBuilder<
                                                List<ProductsRecord>>(
                                              future: queryProductsRecordOnce(
                                                queryBuilder: (productsRecord) =>
                                                    productsRecord
                                                        .where('stores',
                                                            arrayContains:
                                                                valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.storeId,
                                                                    ''))
                                                        .where('brand',
                                                            isEqualTo:
                                                                widget.brand)
                                                        .where('owner',
                                                            isEqualTo:
                                                                'srconstruccion'),
                                                limit: 50,
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
                                                        color:
                                                            FlutterFlowTheme.of(
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
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      gridViewProductsRecordList
                                                          .length,
                                                  itemBuilder:
                                                      (context, gridViewIndex) {
                                                    final gridViewProductsRecord =
                                                        gridViewProductsRecordList[
                                                            gridViewIndex];
                                                    return ProductCardGridDeskWidget(
                                                      productId:
                                                          gridViewProductsRecord
                                                              .id,
                                                      storeLocation:
                                                          productosDeMarcaBuscarStoresRecord
                                                              .location,
                                                      status: 'available',
                                                      prodRef:
                                                          gridViewProductsRecord
                                                              .reference,
                                                      prodDoc:
                                                          gridViewProductsRecord,
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      if (responsiveVisibility(
                                        context: context,
                                        tabletLandscape: false,
                                        desktop: false,
                                      ))
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.7,
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15, 10, 0, 0),
                                            child: FutureBuilder<
                                                List<ProductsRecord>>(
                                              future: queryProductsRecordOnce(
                                                queryBuilder: (productsRecord) =>
                                                    productsRecord
                                                        .where('stores',
                                                            arrayContains:
                                                                valueOrDefault(
                                                                    currentUserDocument
                                                                        ?.storeId,
                                                                    ''))
                                                        .where('brand',
                                                            isEqualTo:
                                                                widget.brand)
                                                        .where('owner',
                                                            isEqualTo:
                                                                'srconstruccion'),
                                                limit: 50,
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
                                                        color:
                                                            FlutterFlowTheme.of(
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
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      gridViewProductsRecordList
                                                          .length,
                                                  itemBuilder:
                                                      (context, gridViewIndex) {
                                                    final gridViewProductsRecord =
                                                        gridViewProductsRecordList[
                                                            gridViewIndex];
                                                    return ProductCardGridMobileWidget(
                                                      productId:
                                                          gridViewProductsRecord
                                                              .id,
                                                      storeLocation:
                                                          productosDeMarcaBuscarStoresRecord
                                                              .location,
                                                      status: 'available',
                                                      prodRef:
                                                          gridViewProductsRecord
                                                              .reference,
                                                      prodDoc:
                                                          gridViewProductsRecord,
                                                    );
                                                  },
                                                );
                                              },
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
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.7,
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15, 10, 0, 0),
                                            child: FutureBuilder<
                                                List<ProductsRecord>>(
                                              future: queryProductsRecordOnce(
                                                queryBuilder: (productsRecord) =>
                                                    productsRecord
                                                        .where('brand',
                                                            isEqualTo:
                                                                widget.brand)
                                                        .where('owner',
                                                            isEqualTo:
                                                                'srconstruccion'),
                                                limit: 50,
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
                                                        color:
                                                            FlutterFlowTheme.of(
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
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      gridViewProductsRecordList
                                                          .length,
                                                  itemBuilder:
                                                      (context, gridViewIndex) {
                                                    final gridViewProductsRecord =
                                                        gridViewProductsRecordList[
                                                            gridViewIndex];
                                                    return Visibility(
                                                      visible:
                                                          !gridViewProductsRecord
                                                              .soldBy
                                                              .toList()
                                                              .contains(
                                                                  gridViewProductsRecord
                                                                      .id),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child:
                                                            ProductCardGridDeskWidget(
                                                          productId:
                                                              gridViewProductsRecord
                                                                  .id,
                                                          storeLocation:
                                                              productosDeMarcaBuscarStoresRecord
                                                                  .location,
                                                          status: 'unlisted',
                                                          prodRef:
                                                              gridViewProductsRecord
                                                                  .reference,
                                                          prodDoc:
                                                              gridViewProductsRecord,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                      if (responsiveVisibility(
                                        context: context,
                                        tabletLandscape: false,
                                        desktop: false,
                                      ))
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.7,
                                          decoration: BoxDecoration(),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    15, 10, 0, 0),
                                            child: FutureBuilder<
                                                List<ProductsRecord>>(
                                              future: queryProductsRecordOnce(
                                                queryBuilder: (productsRecord) =>
                                                    productsRecord
                                                        .where('brand',
                                                            isEqualTo:
                                                                widget.brand)
                                                        .where('owner',
                                                            isEqualTo:
                                                                'srconstruccion'),
                                                limit: 50,
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
                                                        color:
                                                            FlutterFlowTheme.of(
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
                                                  scrollDirection:
                                                      Axis.vertical,
                                                  itemCount:
                                                      gridViewProductsRecordList
                                                          .length,
                                                  itemBuilder:
                                                      (context, gridViewIndex) {
                                                    final gridViewProductsRecord =
                                                        gridViewProductsRecordList[
                                                            gridViewIndex];
                                                    return Visibility(
                                                      visible:
                                                          !gridViewProductsRecord
                                                              .soldBy
                                                              .toList()
                                                              .contains(
                                                                  gridViewProductsRecord
                                                                      .id),
                                                      child: Container(
                                                        decoration:
                                                            BoxDecoration(),
                                                        child:
                                                            ProductCardGridMobileWidget(
                                                          productId:
                                                              gridViewProductsRecord
                                                                  .id,
                                                          storeLocation:
                                                              productosDeMarcaBuscarStoresRecord
                                                                  .location,
                                                          status: 'unlisted',
                                                          prodRef:
                                                              gridViewProductsRecord
                                                                  .reference,
                                                          prodDoc:
                                                              gridViewProductsRecord,
                                                        ),
                                                      ),
                                                    );
                                                  },
                                                );
                                              },
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
        },
      ),
    );
  }
}
