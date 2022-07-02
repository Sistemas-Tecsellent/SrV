import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_toggle_icon.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../product_page_comprar/product_page_comprar_widget.dart';
import '../productos/productos_widget.dart';
import '../variant_inventory/variant_inventory_widget.dart';
import '../custom_code/actions/index.dart' as actions;
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductPageWidget extends StatefulWidget {
  const ProductPageWidget({
    Key key,
    this.productId,
  }) : super(key: key);

  final String productId;

  @override
  _ProductPageWidgetState createState() => _ProductPageWidgetState();
}

class _ProductPageWidgetState extends State<ProductPageWidget> {
  List<dynamic> applicableVariants;
  List<dynamic> applicableVariantsInventories;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance?.addPostFrameCallback((_) async {
      applicableVariants = await actions.getApplicableVariants(
        widget.productId,
        valueOrDefault(currentUserDocument?.storeId, ''),
      );
      applicableVariantsInventories =
          await actions.getVariantsInventoryForSeller(
        valueOrDefault(currentUserDocument?.storeId, ''),
        applicableVariants.toList(),
      );
      setState(() => FFAppState().variantsInventories =
          applicableVariantsInventories.toList());
    });
  }

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
                await Navigator.push(
                  context,
                  PageTransition(
                    type: PageTransitionType.fade,
                    duration: Duration(milliseconds: 0),
                    reverseDuration: Duration(milliseconds: 0),
                    child: ProductosWidget(),
                  ),
                );
              },
            ),
            actions: [],
            centerTitle: false,
            elevation: 0,
          ),
          backgroundColor: Colors.white,
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).unfocus(),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(20, 20, 20, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
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
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 5, 20, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 5, 0),
                                          child: Text(
                                            'Marca',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            borderRadius:
                                                BorderRadius.circular(50),
                                            border: Border.all(
                                              color: Color(0x00656565),
                                            ),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    10, 0, 10, 0),
                                            child: Text(
                                              productPageProductsRecord.brand,
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 5, 20, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 5, 0),
                                          child: Text(
                                            'SKU',
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  fontSize: 15,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          ),
                                        ),
                                        Text(
                                          productPageProductsRecord.sku,
                                          style: FlutterFlowTheme.of(context)
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
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        await Future.delayed(
                                            const Duration(milliseconds: 1000));
                                        if (productPageProductsRecord.stores
                                            .toList()
                                            .contains(valueOrDefault(
                                                currentUserDocument?.storeId,
                                                ''))) {
                                          await AddToRecentlyAddedCall.call(
                                            productId:
                                                productPageProductsRecord.id,
                                            sellerId: valueOrDefault(
                                                currentUserDocument?.sellerId,
                                                ''),
                                          );
                                        }
                                      },
                                      child: Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: Color(0x00F9F9F9),
                                        ),
                                        alignment: AlignmentDirectional(-1, 0),
                                        child: AuthUserStreamWidget(
                                          child: ToggleIcon(
                                            onPressed: () async {
                                              final storesElement =
                                                  valueOrDefault(
                                                      currentUserDocument
                                                          ?.storeId,
                                                      '');
                                              final storesUpdate =
                                                  productPageProductsRecord
                                                          .stores
                                                          .toList()
                                                          .contains(
                                                              storesElement)
                                                      ? FieldValue.arrayRemove(
                                                          [storesElement])
                                                      : FieldValue.arrayUnion(
                                                          [storesElement]);
                                              final productsUpdateData = {
                                                'stores': storesUpdate,
                                              };
                                              await productPageProductsRecord
                                                  .reference
                                                  .update(productsUpdateData);
                                            },
                                            value: productPageProductsRecord
                                                .stores
                                                .toList()
                                                .contains(valueOrDefault(
                                                    currentUserDocument
                                                        ?.storeId,
                                                    '')),
                                            onIcon: Icon(
                                              Icons.toggle_on_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 43,
                                            ),
                                            offIcon: Icon(
                                              Icons.toggle_off_outlined,
                                              color: Color(0xFFC9C6C6),
                                              size: 43,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Stack(
                                      children: [
                                        Text(
                                          'No disponible',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color: Color(0xFFC9C6C6),
                                              ),
                                        ),
                                        Text(
                                          'Disponible',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color: Color(0xFFFDC054),
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                        color: Color(0x00D6D6D6),
                                        borderRadius: BorderRadius.circular(50),
                                      ),
                                      child: InkWell(
                                        onTap: () async {
                                          await Navigator.push(
                                            context,
                                            PageTransition(
                                              type: PageTransitionType.fade,
                                              duration:
                                                  Duration(milliseconds: 0),
                                              reverseDuration:
                                                  Duration(milliseconds: 0),
                                              child: ProductPageComprarWidget(),
                                            ),
                                          );
                                        },
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(15, 7, 2, 7),
                                              child: Text(
                                                'Comprar Stock',
                                                textAlign: TextAlign.center,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.black,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                              ),
                                            ),
                                            Icon(
                                              Icons
                                                  .keyboard_arrow_right_rounded,
                                              color: Colors.black,
                                              size: 24,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 10, 20, 0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        await Future.delayed(
                                            const Duration(milliseconds: 1000));
                                        if (productPageProductsRecord.stores
                                            .toList()
                                            .contains(valueOrDefault(
                                                currentUserDocument?.storeId,
                                                ''))) {
                                          await AddToRecentlyAddedCall.call(
                                            productId:
                                                productPageProductsRecord.id,
                                            sellerId: valueOrDefault(
                                                currentUserDocument?.sellerId,
                                                ''),
                                          );
                                        }
                                      },
                                      child: Container(
                                        width: 60,
                                        height: 60,
                                        decoration: BoxDecoration(
                                          color: Color(0x00F9F9F9),
                                        ),
                                        alignment: AlignmentDirectional(-1, 0),
                                        child: AuthUserStreamWidget(
                                          child: ToggleIcon(
                                            onPressed: () async {
                                              final soldByElement =
                                                  valueOrDefault(
                                                      currentUserDocument
                                                          ?.storeId,
                                                      '');
                                              final soldByUpdate =
                                                  productPageProductsRecord
                                                          .soldBy
                                                          .toList()
                                                          .contains(
                                                              soldByElement)
                                                      ? FieldValue.arrayRemove(
                                                          [soldByElement])
                                                      : FieldValue.arrayUnion(
                                                          [soldByElement]);
                                              final productsUpdateData = {
                                                'soldBy': soldByUpdate,
                                              };
                                              await productPageProductsRecord
                                                  .reference
                                                  .update(productsUpdateData);
                                            },
                                            value: productPageProductsRecord
                                                .soldBy
                                                .toList()
                                                .contains(valueOrDefault(
                                                    currentUserDocument
                                                        ?.storeId,
                                                    '')),
                                            onIcon: Icon(
                                              Icons.toggle_on_rounded,
                                              color:
                                                  FlutterFlowTheme.of(context)
                                                      .primaryColor,
                                              size: 43,
                                            ),
                                            offIcon: Icon(
                                              Icons.toggle_off_outlined,
                                              color: Color(0xFFC9C6C6),
                                              size: 43,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Stack(
                                      children: [
                                        Text(
                                          'Sin Listar',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color: Color(0xFFC9C6C6),
                                              ),
                                        ),
                                        Text(
                                          'Listado',
                                          style: FlutterFlowTheme.of(context)
                                              .bodyText1
                                              .override(
                                                fontFamily: 'Montserrat',
                                                color: Color(0xFFFDC054),
                                              ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Builder(
                            builder: (context) {
                              final variantsInventoryDisplayed =
                                  FFAppState().variantsInventories?.toList() ??
                                      [];
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                children: List.generate(
                                    variantsInventoryDisplayed.length,
                                    (variantsInventoryDisplayedIndex) {
                                  final variantsInventoryDisplayedItem =
                                      variantsInventoryDisplayed[
                                          variantsInventoryDisplayedIndex];
                                  return Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            20, 0, 20, 10),
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 0,
                                                color: Color(0x14000000),
                                              )
                                            ],
                                            borderRadius:
                                                BorderRadius.circular(5),
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    25, 20, 25, 20),
                                            child: Column(
                                              mainAxisSize: MainAxisSize.max,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 5, 0),
                                                      child: Text(
                                                        'Unidad',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  fontSize: 16,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                      ),
                                                    ),
                                                    Text(
                                                      getJsonField(
                                                        variantsInventoryDisplayedItem,
                                                        r'''$.unit''',
                                                      ).toString(),
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                fontSize: 16,
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 5, 0, 30),
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Text(
                                                        'Inventario',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5, 0, 0, 0),
                                                        child: Text(
                                                          getJsonField(
                                                            variantsInventoryDisplayedItem,
                                                            r'''$.inventory''',
                                                          ).toString(),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 0, 20),
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                                .size
                                                                .width *
                                                            0.3,
                                                    decoration: BoxDecoration(),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        await Navigator.push(
                                                          context,
                                                          PageTransition(
                                                            type:
                                                                PageTransitionType
                                                                    .fade,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    0),
                                                            reverseDuration:
                                                                Duration(
                                                                    milliseconds:
                                                                        0),
                                                            child:
                                                                VariantInventoryWidget(
                                                              productTitle:
                                                                  productPageProductsRecord
                                                                      .title,
                                                              unit:
                                                                  getJsonField(
                                                                variantsInventoryDisplayedItem,
                                                                r'''$.unit''',
                                                              ).toString(),
                                                              initialInventory:
                                                                  getJsonField(
                                                                variantsInventoryDisplayedItem,
                                                                r'''$.inventory''',
                                                              ),
                                                              publicPriceEnabled:
                                                                  getJsonField(
                                                                variantsInventoryDisplayedItem,
                                                                r'''$.publicPriceEnabled''',
                                                              ),
                                                              wholesalePriceEnabled:
                                                                  getJsonField(
                                                                variantsInventoryDisplayedItem,
                                                                r'''$.wholesalePriceEnabled''',
                                                              ),
                                                              megaWholesalePriceEnabled:
                                                                  getJsonField(
                                                                variantsInventoryDisplayedItem,
                                                                r'''$.megaWholesalePriceEnabled''',
                                                              ),
                                                              discount1Enabled:
                                                                  getJsonField(
                                                                variantsInventoryDisplayedItem,
                                                                r'''$.discount1Enabled''',
                                                              ),
                                                              discount2Enabled:
                                                                  getJsonField(
                                                                variantsInventoryDisplayedItem,
                                                                r'''$.discount2Enabled''',
                                                              ),
                                                              discount3Enabled:
                                                                  getJsonField(
                                                                variantsInventoryDisplayedItem,
                                                                r'''$.discount3Enabled''',
                                                              ),
                                                              variantId:
                                                                  getJsonField(
                                                                variantsInventoryDisplayedItem,
                                                                r'''$.id''',
                                                              ).toString(),
                                                              productId: widget
                                                                  .productId,
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      text: 'Modificar',
                                                      options: FFButtonOptions(
                                                        width: 100,
                                                        height: 40,
                                                        color:
                                                            Color(0xACE9E9E9),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle2
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .normal,
                                                                ),
                                                        elevation: 0,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1,
                                                        ),
                                                        borderRadius: 5,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Divider(
                                                  height: 2,
                                                  color: Color(0x62000000),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                }),
                              );
                            },
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
    );
  }
}
