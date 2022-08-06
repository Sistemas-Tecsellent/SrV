import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/product_card_grid_desk_widget.dart';
import '../components/product_card_grid_mobile_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SearchWitCategoryWidget extends StatefulWidget {
  const SearchWitCategoryWidget({
    Key key,
    this.category,
  }) : super(key: key);

  final String category;

  @override
  _SearchWitCategoryWidgetState createState() =>
      _SearchWitCategoryWidgetState();
}

class _SearchWitCategoryWidgetState extends State<SearchWitCategoryWidget> {
  TextEditingController textController;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    textController = TextEditingController();
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
          List<StoresRecord> searchWitCategoryStoresRecordList = snapshot.data;
          // Return an empty Container when the document does not exist.
          if (snapshot.data.isEmpty) {
            return Container();
          }
          final searchWitCategoryStoresRecord =
              searchWitCategoryStoresRecordList.isNotEmpty
                  ? searchWitCategoryStoresRecordList.first
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
                'Buscar',
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
                child: SingleChildScrollView(
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
                                      controller: textController,
                                      onChanged: (_) => EasyDebounce.debounce(
                                        'textController',
                                        Duration(milliseconds: 2000),
                                        () => setState(() {}),
                                      ),
                                      autofocus: true,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        hintText: '    Buscar Producto',
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
                                                5, 0, 0, 5),
                                      ),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Montserrat',
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      if (responsiveVisibility(
                        context: context,
                        phone: false,
                        tablet: false,
                      ))
                        Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.8,
                          decoration: BoxDecoration(),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(15, 10, 0, 0),
                            child: FutureBuilder<List<ProductsRecord>>(
                              future: ProductsRecord.search(
                                term: textController.text,
                                maxResults: 20,
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
                                List<ProductsRecord>
                                    gridViewProductsRecordList = snapshot.data;
                                // Customize what your widget looks like with no search results.
                                if (snapshot.data.isEmpty) {
                                  return Container(
                                    height: 100,
                                    child: Center(
                                      child: Text('No results.'),
                                    ),
                                  );
                                }
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
                                  itemCount: gridViewProductsRecordList.length,
                                  itemBuilder: (context, gridViewIndex) {
                                    final gridViewProductsRecord =
                                        gridViewProductsRecordList[
                                            gridViewIndex];
                                    return ProductCardGridDeskWidget(
                                      productId: gridViewProductsRecord.id,
                                      storeLocation:
                                          searchWitCategoryStoresRecord
                                              .location,
                                      status: valueOrDefault<String>(
                                        functions.defineProductStatus(
                                            gridViewProductsRecord.stores
                                                .toList(),
                                            searchWitCategoryStoresRecord
                                                .listedButNoAvailableProducts
                                                .toList(),
                                            gridViewProductsRecord.id),
                                        'unlisted',
                                      ),
                                      prodRef: gridViewProductsRecord.reference,
                                      prodDoc: gridViewProductsRecord,
                                    );
                                  },
                                );
                              },
                            ),
                          ),
                        ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height * 0.8,
                        decoration: BoxDecoration(),
                        child: Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(15, 10, 0, 0),
                          child: FutureBuilder<List<ProductsRecord>>(
                            future: ProductsRecord.search(
                              term: textController.text,
                              maxResults: 20,
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
                              List<ProductsRecord> gridViewProductsRecordList =
                                  snapshot.data;
                              // Customize what your widget looks like with no search results.
                              if (snapshot.data.isEmpty) {
                                return Container(
                                  height: 100,
                                  child: Center(
                                    child: Text('No results.'),
                                  ),
                                );
                              }
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
                                itemCount: gridViewProductsRecordList.length,
                                itemBuilder: (context, gridViewIndex) {
                                  final gridViewProductsRecord =
                                      gridViewProductsRecordList[gridViewIndex];
                                  return ProductCardGridMobileWidget(
                                    productId: gridViewProductsRecord.id,
                                    storeLocation:
                                        searchWitCategoryStoresRecord.location,
                                    status: valueOrDefault<String>(
                                      functions.defineProductStatus(
                                          gridViewProductsRecord.stores
                                              .toList(),
                                          searchWitCategoryStoresRecord
                                              .listedButNoAvailableProducts
                                              .toList(),
                                          gridViewProductsRecord.id),
                                      'unlisted',
                                    ),
                                    prodRef: gridViewProductsRecord.reference,
                                    prodDoc: gridViewProductsRecord,
                                  );
                                },
                              );
                            },
                          ),
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
