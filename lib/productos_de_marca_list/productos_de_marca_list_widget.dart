import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/product_card_list_mobile_widget.dart';
import '../flutter_flow/flutter_flow_drop_down.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class ProductosDeMarcaListWidget extends StatefulWidget {
  const ProductosDeMarcaListWidget({
    Key key,
    this.brand,
  }) : super(key: key);

  final String brand;

  @override
  _ProductosDeMarcaListWidgetState createState() =>
      _ProductosDeMarcaListWidgetState();
}

class _ProductosDeMarcaListWidgetState
    extends State<ProductosDeMarcaListWidget> {
  PagingController<DocumentSnapshot, ProductsRecord> _pagingController;
  Query _pagingQuery;

  String dropDownBrandsValue;
  String dropDownCategoriesValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();

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
          List<StoresRecord> productosDeMarcaListStoresRecordList =
              snapshot.data;
          // Return an empty Container when the document does not exist.
          if (snapshot.data.isEmpty) {
            return Container();
          }
          final productosDeMarcaListStoresRecord =
              productosDeMarcaListStoresRecordList.isNotEmpty
                  ? productosDeMarcaListStoresRecordList.first
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
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SingleChildScrollView(
                          scrollDirection: Axis.horizontal,
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              FutureBuilder<List<StoreBrandsRecord>>(
                                future: queryStoreBrandsRecordOnce(
                                  parent: productosDeMarcaListStoresRecord
                                      .reference,
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
                                  List<StoreBrandsRecord>
                                      containerStoreBrandsRecordList =
                                      snapshot.data;
                                  return Container(
                                    width: 120,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEEEEEE),
                                      borderRadius: BorderRadius.circular(5),
                                    ),
                                    child: FutureBuilder<List<BrandsRecord>>(
                                      future: queryBrandsRecordOnce(
                                        queryBuilder: (brandsRecord) =>
                                            brandsRecord.where('id',
                                                whereIn:
                                                    containerStoreBrandsRecordList
                                                        .map((e) => e.id)
                                                        .toList()),
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
                                        List<BrandsRecord>
                                            dropDownBrandsBrandsRecordList =
                                            snapshot.data;
                                        return FlutterFlowDropDown(
                                          initialOption: dropDownBrandsValue ??=
                                              widget.brand,
                                          options:
                                              dropDownBrandsBrandsRecordList
                                                  .map((e) => e.id)
                                                  .toList()
                                                  .toList(),
                                          onChanged: (val) => setState(
                                              () => dropDownBrandsValue = val),
                                          width: 180,
                                          height: 50,
                                          textStyle:
                                              FlutterFlowTheme.of(context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: Colors.black,
                                                    fontSize: 11,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                          hintText: 'Marca',
                                          fillColor: Colors.white,
                                          elevation: 2,
                                          borderColor: Colors.transparent,
                                          borderWidth: 0,
                                          borderRadius: 0,
                                          margin:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 4, 12, 4),
                                          hidesUnderline: true,
                                        );
                                      },
                                    ),
                                  );
                                },
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    10, 0, 10, 0),
                                child: Container(
                                  width: 120,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFEEEEEE),
                                    borderRadius: BorderRadius.circular(5),
                                  ),
                                  child: StreamBuilder<List<CategoriesRecord>>(
                                    stream: queryCategoriesRecord(
                                      queryBuilder: (categoriesRecord) =>
                                          categoriesRecord.where('brands',
                                              arrayContains:
                                                  dropDownBrandsValue),
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
                                      List<CategoriesRecord>
                                          dropDownCategoriesCategoriesRecordList =
                                          snapshot.data;
                                      return FlutterFlowDropDown(
                                        options:
                                            dropDownCategoriesCategoriesRecordList
                                                .map((e) => e.title)
                                                .toList()
                                                .toList(),
                                        onChanged: (val) => setState(() =>
                                            dropDownCategoriesValue = val),
                                        width: 180,
                                        height: 50,
                                        textStyle: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Montserrat',
                                              color: Colors.black,
                                              fontSize: 11,
                                              fontWeight: FontWeight.normal,
                                            ),
                                        hintText: 'Categoría',
                                        fillColor: Colors.white,
                                        elevation: 2,
                                        borderColor: Colors.transparent,
                                        borderWidth: 0,
                                        borderRadius: 0,
                                        margin: EdgeInsetsDirectional.fromSTEB(
                                            12, 4, 12, 4),
                                        hidesUnderline: true,
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
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.75,
                      decoration: BoxDecoration(
                        color: FlutterFlowTheme.of(context).secondaryBackground,
                      ),
                      child: PagedListView<DocumentSnapshot<Object>,
                          ProductsRecord>(
                        pagingController: () {
                          final Query<Object> Function(Query<Object>)
                              queryBuilder = (productsRecord) => productsRecord
                                  .where('brand',
                                      isEqualTo: dropDownBrandsValue)
                                  .where('category',
                                      isEqualTo: dropDownCategoriesValue);
                          if (_pagingController != null) {
                            final query =
                                queryBuilder(ProductsRecord.collection);
                            if (query != _pagingQuery) {
                              // The query has changed
                              _pagingQuery = query;

                              _pagingController.refresh();
                            }
                            return _pagingController;
                          }

                          _pagingController =
                              PagingController(firstPageKey: null);
                          _pagingQuery =
                              queryBuilder(ProductsRecord.collection);
                          _pagingController
                              .addPageRequestListener((nextPageMarker) {
                            queryProductsRecordPage(
                              queryBuilder: (productsRecord) => productsRecord
                                  .where('brand',
                                      isEqualTo: dropDownBrandsValue)
                                  .where('category',
                                      isEqualTo: dropDownCategoriesValue),
                              nextPageMarker: nextPageMarker,
                              pageSize: 25,
                              isStream: false,
                            ).then((page) {
                              _pagingController.appendPage(
                                page.data,
                                page.nextPageMarker,
                              );
                            });
                          });
                          return _pagingController;
                        }(),
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        builderDelegate:
                            PagedChildBuilderDelegate<ProductsRecord>(
                          // Customize what your widget looks like when it's loading the first page.
                          firstPageProgressIndicatorBuilder: (_) => Center(
                            child: SizedBox(
                              width: 50,
                              height: 50,
                              child: CircularProgressIndicator(
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                              ),
                            ),
                          ),

                          itemBuilder: (context, _, listViewIndex) {
                            final listViewProductsRecord =
                                _pagingController.itemList[listViewIndex];
                            return Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                ProductCardListMobileWidget(
                                  productId: listViewProductsRecord.id,
                                  storeLocation:
                                      productosDeMarcaListStoresRecord.location,
                                  status: functions.defineProductStatus(
                                      listViewProductsRecord.stores.toList(),
                                      productosDeMarcaListStoresRecord
                                          .listedButNoAvailableProducts
                                          .toList(),
                                      listViewProductsRecord.id),
                                  prodRef: listViewProductsRecord.reference,
                                  prodDoc: listViewProductsRecord,
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
            ),
          );
        },
      ),
    );
  }
}
