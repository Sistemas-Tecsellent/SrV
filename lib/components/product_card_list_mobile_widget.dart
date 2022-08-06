import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductCardListMobileWidget extends StatefulWidget {
  const ProductCardListMobileWidget({
    Key key,
    this.productId,
    this.prodRef,
    this.prodDoc,
    this.storeLocation,
    this.status,
  }) : super(key: key);

  final String productId;
  final DocumentReference prodRef;
  final ProductsRecord prodDoc;
  final String storeLocation;
  final String status;

  @override
  _ProductCardListMobileWidgetState createState() =>
      _ProductCardListMobileWidgetState();
}

class _ProductCardListMobileWidgetState
    extends State<ProductCardListMobileWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.9,
      constraints: BoxConstraints(
        maxWidth: 400,
      ),
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Color(0x14000000),
            offset: Offset(0, 0),
          )
        ],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  widget.prodDoc.mainImage,
                  width: 80,
                  height: 80,
                  fit: BoxFit.contain,
                ),
              ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(10, 10, 10, 10),
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 140,
                          decoration: BoxDecoration(
                            color: Colors.white,
                          ),
                          child: Text(
                            widget.prodDoc.title
                                .maybeHandleOverflow(maxChars: 35),
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Montserrat',
                                      color: Colors.black,
                                      fontSize: 12,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                        ),
                        Stack(
                          children: [
                            if (widget.status == 'available')
                              Icon(
                                Icons.check_circle_rounded,
                                color: Color(0xFF59E149),
                                size: 24,
                              ),
                            if (widget.status == 'listed')
                              Icon(
                                Icons.check_circle_rounded,
                                color: Color(0xFFAEAEAE),
                                size: 24,
                              ),
                            if (widget.status == 'unlisted')
                              Icon(
                                Icons.add_circle_sharp,
                                color: Color(0xFFAEAEAE),
                                size: 24,
                              ),
                          ],
                        ),
                      ],
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
                              widget.prodDoc.brand,
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
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
                              widget.prodDoc.sku,
                              style: FlutterFlowTheme.of(context)
                                  .bodyText1
                                  .override(
                                    fontFamily: 'Montserrat',
                                    color: Color(0xFF909090),
                                    fontSize: 10,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsetsDirectional.fromSTEB(0, 5, 0, 0),
                      child: FutureBuilder<ApiCallResponse>(
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
                                child: CircularProgressIndicator(
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                ),
                              ),
                            );
                          }
                          final columnGetApplicableVariantsResponse =
                              snapshot.data;
                          return Builder(
                            builder: (context) {
                              final variants1 =
                                  GetApplicableVariantsCall.variants(
                                columnGetApplicableVariantsResponse.jsonBody,
                              ).toList();
                              return Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: List.generate(variants1.length,
                                    (variants1Index) {
                                  final variants1Item =
                                      variants1[variants1Index];
                                  return Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 0, 0, 2),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
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
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  2, 0, 0, 0),
                                          child: AuthUserStreamWidget(
                                            child:
                                                FutureBuilder<ApiCallResponse>(
                                              future:
                                                  GetTotalVariantInventoryByStoreCall
                                                      .call(
                                                productId: widget.productId,
                                                variantId: getJsonField(
                                                  variants1Item,
                                                  r'''$.id''',
                                                ).toString(),
                                                store: valueOrDefault(
                                                    currentUserDocument
                                                        ?.storeId,
                                                    ''),
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
                                                final textGetTotalVariantInventoryByStoreResponse =
                                                    snapshot.data;
                                                return Text(
                                                  GetTotalVariantInventoryByStoreCall
                                                          .inventory(
                                                    textGetTotalVariantInventoryByStoreResponse
                                                        .jsonBody,
                                                  )
                                                      .toString()
                                                      .maybeHandleOverflow(
                                                          maxChars: 18),
                                                  style: FlutterFlowTheme.of(
                                                          context)
                                                      .bodyText1
                                                      .override(
                                                        fontFamily:
                                                            'Montserrat',
                                                        color: Colors.black,
                                                        fontSize: 9,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                      ),
                                                );
                                              },
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  2, 0, 0, 0),
                                          child: Text(
                                            getJsonField(
                                              variants1Item,
                                              r'''$.unit''',
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
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
