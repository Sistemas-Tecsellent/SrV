import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCardWidget extends StatefulWidget {
  const ProductCardWidget({
    Key key,
    this.productId,
    this.productRef,
    this.productDoc,
    this.location,
  }) : super(key: key);

  final String productId;
  final DocumentReference productRef;
  final ProductsRecord productDoc;
  final String location;

  @override
  _ProductCardWidgetState createState() => _ProductCardWidgetState();
}

class _ProductCardWidgetState extends State<ProductCardWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsDirectional.fromSTEB(15, 0, 0, 0),
      child: InkWell(
        onTap: () async {
          context.pushNamed(
            'ProductPage',
            params: {
              'productId': serializeParam(widget.productId, ParamType.String),
            }.withoutNulls,
            queryParams: {
              'storeLocation':
                  serializeParam(widget.location, ParamType.String),
            }.withoutNulls,
          );
        },
        child: Container(
          width: 160,
          height: 260,
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                blurRadius: 5,
                color: Color(0x0D000000),
              )
            ],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    if (widget.productDoc.soldBy.toList().contains(
                        valueOrDefault(currentUserDocument?.storeId, '')))
                      AuthUserStreamWidget(
                        child: Icon(
                          Icons.check_circle_rounded,
                          color: Color(0xFF2FE74D),
                          size: 24,
                        ),
                      ),
                  ],
                ),
                Align(
                  alignment: AlignmentDirectional(0, 0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      widget.productDoc.mainImage,
                      width: 130,
                      height: 100,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
                Container(
                  width: 140,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: Text(
                    widget.productDoc.title.maybeHandleOverflow(maxChars: 35),
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Montserrat',
                          color: Colors.black,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.1, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-0.45, -0.05),
                        child: Text(
                          widget.productDoc.brand,
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Montserrat',
                                color:
                                    FlutterFlowTheme.of(context).primaryColor,
                                fontSize: 11,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                      ),
                    ],
                  ),
                ),
                Align(
                  alignment: AlignmentDirectional(0.1, 0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Align(
                        alignment: AlignmentDirectional(-0.45, -0.05),
                        child: Text(
                          widget.productDoc.sku,
                          style:
                              FlutterFlowTheme.of(context).bodyText1.override(
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
                FutureBuilder<ApiCallResponse>(
                  future: GetApplicableVariantsCall.call(
                    productId: widget.productId,
                    userLocation: widget.location,
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
                    final columnGetApplicableVariantsResponse = snapshot.data;
                    return Builder(
                      builder: (context) {
                        final variants = GetApplicableVariantsCall.variants(
                          columnGetApplicableVariantsResponse.jsonBody,
                        ).toList();
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children:
                              List.generate(variants.length, (variantsIndex) {
                            final variantsItem = variants[variantsIndex];
                            return Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 0, 0, 2),
                              child: Row(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        2, 0, 0, 0),
                                    child: Text(
                                      'Stock:',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Montserrat',
                                            color: Colors.black,
                                            fontSize: 9,
                                            fontWeight: FontWeight.normal,
                                          ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        2, 0, 0, 0),
                                    child: AuthUserStreamWidget(
                                      child: FutureBuilder<ApiCallResponse>(
                                        future:
                                            GetTotalVariantInventoryByStoreCall
                                                .call(
                                          productId: widget.productId,
                                          variantId: getJsonField(
                                            variantsItem,
                                            r'''$.id''',
                                          ).toString(),
                                          store: valueOrDefault(
                                              currentUserDocument?.storeId, ''),
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
                                          final textGetTotalVariantInventoryByStoreResponse =
                                              snapshot.data;
                                          return Text(
                                            GetTotalVariantInventoryByStoreCall
                                                .inventory(
                                              textGetTotalVariantInventoryByStoreResponse
                                                  .jsonBody,
                                            ).toString().maybeHandleOverflow(
                                                maxChars: 18),
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1
                                                .override(
                                                  fontFamily: 'Montserrat',
                                                  color: Colors.black,
                                                  fontSize: 9,
                                                  fontWeight: FontWeight.normal,
                                                ),
                                          );
                                        },
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        2, 0, 0, 0),
                                    child: Text(
                                      getJsonField(
                                        variantsItem,
                                        r'''$.unit''',
                                      )
                                          .toString()
                                          .maybeHandleOverflow(maxChars: 18),
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
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
      ),
    );
  }
}
