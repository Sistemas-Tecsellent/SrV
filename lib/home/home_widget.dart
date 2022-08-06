import '../auth/auth_util.dart';
import '../backend/api_requests/api_calls.dart';
import '../backend/backend.dart';
import '../components/menu_home_widget.dart';
import '../components/product_card_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../custom_code/widgets/index.dart' as custom_widgets;
import 'dart:async';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> with TickerProviderStateMixin {
  ApiCallResponse hasCompletedResponse;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  Completer<List<StoresRecord>> _firestoreRequestCompleter;
  final animationsMap = {
    'containerOnPageLoadAnimation1': AnimationInfo(
      curve: Curves.bounceOut,
      trigger: AnimationTrigger.onPageLoad,
      duration: 1300,
      delay: 360,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0.245,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation2': AnimationInfo(
      curve: Curves.bounceOut,
      trigger: AnimationTrigger.onPageLoad,
      duration: 1300,
      delay: 360,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0.245,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
    'containerOnPageLoadAnimation3': AnimationInfo(
      curve: Curves.bounceOut,
      trigger: AnimationTrigger.onPageLoad,
      duration: 1300,
      delay: 360,
      hideBeforeAnimating: false,
      fadeIn: true,
      initialState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 0.245,
      ),
      finalState: AnimationState(
        offset: Offset(0, 0),
        scale: 1,
        opacity: 1,
      ),
    ),
  };

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      await Future.delayed(const Duration(milliseconds: 1000));
      hasCompletedResponse = await HasCompletedRegistrationCall.call(
        sellerId: currentUserUid,
        storeId: valueOrDefault(currentUserDocument?.storeId, ''),
      );
      if (HasCompletedRegistrationCall.complete(
        (hasCompletedResponse?.jsonBody ?? ''),
      )) {
        if (!valueOrDefault<bool>(currentUserDocument?.isApproved, false)) {
          context.goNamed('ValidandoCuenta');
        }
      } else {
        context.goNamed('registro1');
      }
    });

    startPageLoadAnimations(
      animationsMap.values
          .where((anim) => anim.trigger == AnimationTrigger.onPageLoad),
      this,
    );
  }

  @override
  Widget build(BuildContext context) {
    return AuthUserStreamWidget(
      child: FutureBuilder<ApiCallResponse>(
        future: StoreHasProductsCall.call(
          storeId: valueOrDefault(currentUserDocument?.storeId, ''),
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
          final homeStoreHasProductsResponse = snapshot.data;
          return Scaffold(
            key: scaffoldKey,
            appBar: valueOrDefault<bool>(currentUserDocument?.isApproved, false)
                ? PreferredSize(
                    preferredSize: Size.fromHeight(275),
                    child: AppBar(
                      backgroundColor:
                          FlutterFlowTheme.of(context).primaryColor,
                      automaticallyImplyLeading: false,
                      flexibleSpace: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 235,
                            child: Stack(
                              children: [
                                if (responsiveVisibility(
                                  context: context,
                                  phone: false,
                                ))
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 295,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEEEEEE),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: CachedNetworkImageProvider(
                                          'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/Seller%20App%20Assets%2FBanner%20Principal%20Desktop.png?alt=media&token=7bc96fb9-84ae-460c-8c32-431da52c2263',
                                        ),
                                      ),
                                    ),
                                  ),
                                if (responsiveVisibility(
                                  context: context,
                                  tablet: false,
                                  tabletLandscape: false,
                                  desktop: false,
                                ))
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    height: 295,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFEEEEEE),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: CachedNetworkImageProvider(
                                          'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/Seller%20App%20Assets%2FBanner%20Principal%20Mobile.png?alt=media&token=61abbb35-05fa-4fef-8c42-cd72334e803f',
                                        ),
                                      ),
                                    ),
                                  ),
                                Align(
                                  alignment: AlignmentDirectional(0, 0),
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            constraints: BoxConstraints(
                                              maxWidth: 1300,
                                            ),
                                            decoration: BoxDecoration(),
                                            child: Align(
                                              alignment:
                                                  AlignmentDirectional(0, 0.7),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(20, 0, 20, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
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
                                                                  .fromSTEB(0,
                                                                      0, 10, 0),
                                                          child: Text(
                                                            'Hola',
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                  fontSize: 22,
                                                                ),
                                                          ),
                                                        ),
                                                        Text(
                                                          currentUserDisplayName
                                                              .maybeHandleOverflow(
                                                                  maxChars: 12),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 22,
                                                              ),
                                                        ),
                                                      ],
                                                    ),
                                                    InkWell(
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          'Perfil',
                                                          extra: <String,
                                                              dynamic>{
                                                            kTransitionInfoKey:
                                                                TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .fade,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      0),
                                                            ),
                                                          },
                                                        );
                                                      },
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: [
                                                          Container(
                                                            width: 80,
                                                            height: 70,
                                                            child: Stack(
                                                              alignment:
                                                                  AlignmentDirectional(
                                                                      1, -1),
                                                              children: [
                                                                Align(
                                                                  alignment:
                                                                      AlignmentDirectional(
                                                                          0, 1),
                                                                  child:
                                                                      Container(
                                                                    width: 65,
                                                                    height: 65,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xFFEEEEEE),
                                                                      boxShadow: [
                                                                        BoxShadow(
                                                                          blurRadius:
                                                                              5,
                                                                          color:
                                                                              Color(0x12000000),
                                                                          spreadRadius:
                                                                              3,
                                                                        )
                                                                      ],
                                                                      shape: BoxShape
                                                                          .circle,
                                                                    ),
                                                                    child:
                                                                        Align(
                                                                      alignment:
                                                                          AlignmentDirectional(
                                                                              0,
                                                                              0),
                                                                      child:
                                                                          InkWell(
                                                                        onTap:
                                                                            () async {
                                                                          context
                                                                              .pushNamed('Perfil');
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          width:
                                                                              60,
                                                                          height:
                                                                              60,
                                                                          clipBehavior:
                                                                              Clip.antiAlias,
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            shape:
                                                                                BoxShape.circle,
                                                                          ),
                                                                          child:
                                                                              Image.network(
                                                                            valueOrDefault<String>(
                                                                              currentUserPhoto,
                                                                              'https://firebasestorage.googleapis.com/v0/b/srconstruccion-d4663.appspot.com/o/assets%2FAsset.png?alt=media&token=85f6129c-7ee9-4db8-87ae-2e1adc4e010a',
                                                                            ),
                                                                            fit:
                                                                                BoxFit.cover,
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ),
                                                              ],
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
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    25, 20, 0, 0),
                                            child: Text(
                                              'Ventas de la semana',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .bodyText1
                                                  .override(
                                                    fontFamily: 'Montserrat',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .secondaryText,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                            ),
                                          ),
                                          Container(
                                            width: MediaQuery.of(context)
                                                .size
                                                .width,
                                            constraints: BoxConstraints(
                                              maxWidth: 1320,
                                            ),
                                            decoration: BoxDecoration(),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(25, 5, 25, 0),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    children: [
                                                      Text(
                                                        '\$',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText1
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .secondaryText,
                                                                ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    5, 0, 0, 0),
                                                        child: Text(
                                                          valueOrDefault<
                                                              String>(
                                                            formatNumber(
                                                              valueOrDefault(
                                                                  currentUserDocument
                                                                      ?.weeklyEarning,
                                                                  0.0),
                                                              formatType:
                                                                  FormatType
                                                                      .decimal,
                                                              decimalType:
                                                                  DecimalType
                                                                      .periodDecimal,
                                                            ),
                                                            '0',
                                                          ).maybeHandleOverflow(
                                                              maxChars: 8),
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                                fontSize: 28,
                                                              ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                  Align(
                                                    alignment:
                                                        AlignmentDirectional(
                                                            0, 0),
                                                    child: FFButtonWidget(
                                                      onPressed: () {
                                                        print(
                                                            'Button pressed ...');
                                                      },
                                                      text: 'Ir a comprar',
                                                      options: FFButtonOptions(
                                                        width: 120,
                                                        height: 30,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .alternate,
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle2
                                                                .override(
                                                                  fontFamily:
                                                                      'Montserrat',
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 14,
                                                                ),
                                                        elevation: 2,
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25),
                                                      ),
                                                      showLoadingIndicator:
                                                          false,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      if (responsiveVisibility(
                                        context: context,
                                        phone: false,
                                      ))
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 60,
                                          constraints: BoxConstraints(
                                            maxWidth: 1300,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Color(0x00FDC054),
                                          ),
                                          child: MenuHomeWidget(),
                                        ),
                                      if (responsiveVisibility(
                                        context: context,
                                        tablet: false,
                                        tabletLandscape: false,
                                        desktop: false,
                                      ))
                                        Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          height: 60,
                                          constraints: BoxConstraints(
                                            maxWidth: 1300,
                                          ),
                                          decoration: BoxDecoration(
                                            color: Color(0x00FDC054),
                                          ),
                                          child: SingleChildScrollView(
                                            scrollDirection: Axis.horizontal,
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(15, 0, 20, 0),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'Home',
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    0),
                                                          ),
                                                        },
                                                      );
                                                    },
                                                    child: Text(
                                                      'Inicio',
                                                      style: FlutterFlowTheme
                                                              .of(context)
                                                          .bodyText1
                                                          .override(
                                                            fontFamily:
                                                                'Montserrat',
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.w500,
                                                          ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 20, 0),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'Pedidos',
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    0),
                                                          ),
                                                        },
                                                      );
                                                    },
                                                    child: Text(
                                                      'Mis Pedidos',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 20, 0),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'Marcas',
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    0),
                                                          ),
                                                        },
                                                      );
                                                    },
                                                    child: Text(
                                                      'Mis Marcas',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 20, 0),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'Productos',
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    0),
                                                          ),
                                                        },
                                                      );
                                                    },
                                                    child: Text(
                                                      'Mis Productos',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 20, 0),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'Repartidores',
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    0),
                                                          ),
                                                        },
                                                      );
                                                    },
                                                    child: Text(
                                                      'Mis Repartidores',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 20, 0),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'Ventas',
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    0),
                                                          ),
                                                        },
                                                      );
                                                    },
                                                    child: Text(
                                                      'Mis Ventas',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                              ),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 20, 0),
                                                  child: InkWell(
                                                    onTap: () async {
                                                      context.pushNamed(
                                                        'Perfil',
                                                        extra: <String,
                                                            dynamic>{
                                                          kTransitionInfoKey:
                                                              TransitionInfo(
                                                            hasTransition: true,
                                                            transitionType:
                                                                PageTransitionType
                                                                    .fade,
                                                            duration: Duration(
                                                                milliseconds:
                                                                    0),
                                                          ),
                                                        },
                                                      );
                                                    },
                                                    child: Text(
                                                      'Mi Perfil',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1
                                                              .override(
                                                                fontFamily:
                                                                    'Montserrat',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
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
                                        ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      actions: [],
                      elevation: 0,
                    ),
                  )
                : null,
            backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
            floatingActionButton: FloatingActionButton(
              onPressed: () async {
                context.pushNamed('chats');
              },
              backgroundColor: Colors.white,
              elevation: 8,
              child: Icon(
                Icons.chat_outlined,
                color: Color(0xFF1EEBBD),
                size: 24,
              ),
            ),
            body: SafeArea(
              child: GestureDetector(
                onTap: () => FocusScope.of(context).unfocus(),
                child: FutureBuilder<List<StoresRecord>>(
                  future: (_firestoreRequestCompleter ??=
                          Completer<List<StoresRecord>>()
                            ..complete(queryStoresRecordOnce(
                              queryBuilder: (storesRecord) =>
                                  storesRecord.where('id',
                                      isEqualTo: valueOrDefault(
                                                  currentUserDocument?.storeId,
                                                  '') !=
                                              ''
                                          ? valueOrDefault(
                                              currentUserDocument?.storeId, '')
                                          : null),
                              singleRecord: true,
                            )))
                      .future,
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
                    return RefreshIndicator(
                      onRefresh: () async {
                        setState(() => _firestoreRequestCompleter = null);
                        await waitForFirestoreRequestCompleter();
                      },
                      child: SingleChildScrollView(
                        physics: const AlwaysScrollableScrollPhysics(),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        0, 30, 0, 20),
                                    child: SingleChildScrollView(
                                      primary: false,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.max,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          StreamBuilder<
                                              List<OrdersForStoresRecord>>(
                                            stream: queryOrdersForStoresRecord(
                                              queryBuilder:
                                                  (ordersForStoresRecord) =>
                                                      ordersForStoresRecord
                                                          .where('seller',
                                                              isEqualTo:
                                                                  currentUserUid)
                                                          .where('status',
                                                              isEqualTo:
                                                                  'pendingAcceptance'),
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
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                    ),
                                                  ),
                                                );
                                              }
                                              List<OrdersForStoresRecord>
                                                  columnOrdersForStoresRecordList =
                                                  snapshot.data;
                                              // Return an empty Container when the document does not exist.
                                              if (snapshot.data.isEmpty) {
                                                return Container();
                                              }
                                              final columnOrdersForStoresRecord =
                                                  columnOrdersForStoresRecordList
                                                          .isNotEmpty
                                                      ? columnOrdersForStoresRecordList
                                                          .first
                                                      : null;
                                              return Column(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                20, 0, 20, 0),
                                                    child: InkWell(
                                                      onTap: () async {
                                                        context.pushNamed(
                                                          'Pedidos',
                                                          extra: <String,
                                                              dynamic>{
                                                            kTransitionInfoKey:
                                                                TransitionInfo(
                                                              hasTransition:
                                                                  true,
                                                              transitionType:
                                                                  PageTransitionType
                                                                      .fade,
                                                              duration: Duration(
                                                                  milliseconds:
                                                                      0),
                                                            ),
                                                          },
                                                        );
                                                      },
                                                      child: Container(
                                                        width: MediaQuery.of(
                                                                context)
                                                            .size
                                                            .width,
                                                        height: 60,
                                                        constraints:
                                                            BoxConstraints(
                                                          maxWidth: 400,
                                                        ),
                                                        decoration:
                                                            BoxDecoration(
                                                          color:
                                                              Color(0xFFFD9954),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(5),
                                                        ),
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0, 0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(10,
                                                                      0, 10, 0),
                                                          child: Row(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Row(
                                                                mainAxisSize:
                                                                    MainAxisSize
                                                                        .max,
                                                                children: [
                                                                  Column(
                                                                    mainAxisSize:
                                                                        MainAxisSize
                                                                            .max,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .spaceEvenly,
                                                                    children: [
                                                                      Container(
                                                                        width:
                                                                            30,
                                                                        height:
                                                                            30,
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              FlutterFlowTheme.of(context).secondaryBackground,
                                                                          shape:
                                                                              BoxShape.circle,
                                                                        ),
                                                                        alignment: AlignmentDirectional(
                                                                            0,
                                                                            0),
                                                                        child:
                                                                            Text(
                                                                          '1',
                                                                          style:
                                                                              FlutterFlowTheme.of(context).bodyText1,
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                    child: Text(
                                                                      '¡Nuevo pedido por aceptar!',
                                                                      style: FlutterFlowTheme.of(
                                                                              context)
                                                                          .bodyText1
                                                                          .override(
                                                                            fontFamily:
                                                                                'Montserrat',
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            fontWeight:
                                                                                FontWeight.w500,
                                                                          ),
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                              Icon(
                                                                Icons
                                                                    .keyboard_arrow_right,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryBackground,
                                                                size: 24,
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ).animated([
                                                      animationsMap[
                                                          'containerOnPageLoadAnimation1']
                                                    ]),
                                                  ),
                                                  Container(
                                                    width: 0,
                                                    height: 0,
                                                    child: custom_widgets
                                                        .NotificationSound(
                                                      width: 0,
                                                      height: 0,
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 0),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 0, 0),
                                                child: StreamBuilder<
                                                    List<
                                                        PricingRequestsRecord>>(
                                                  stream:
                                                      queryPricingRequestsRecord(
                                                    queryBuilder:
                                                        (pricingRequestsRecord) =>
                                                            pricingRequestsRecord
                                                                .where(
                                                                    'assignedTo',
                                                                    isEqualTo:
                                                                        currentUserUid),
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
                                                    List<PricingRequestsRecord>
                                                        rowPricingRequestsRecordList =
                                                        snapshot.data;
                                                    return SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                            rowPricingRequestsRecordList
                                                                .length,
                                                            (rowIndex) {
                                                          final rowPricingRequestsRecord =
                                                              rowPricingRequestsRecordList[
                                                                  rowIndex];
                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    context
                                                                        .pushNamed(
                                                                      'IngresaCostoDeEnvio',
                                                                      queryParams:
                                                                          {
                                                                        'orderId': serializeParam(
                                                                            rowPricingRequestsRecord.id,
                                                                            ParamType.String),
                                                                      }.withoutNulls,
                                                                      extra: <
                                                                          String,
                                                                          dynamic>{
                                                                        kTransitionInfoKey:
                                                                            TransitionInfo(
                                                                          hasTransition:
                                                                              true,
                                                                          transitionType:
                                                                              PageTransitionType.fade,
                                                                          duration:
                                                                              Duration(milliseconds: 0),
                                                                        ),
                                                                      },
                                                                    );
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.55,
                                                                    height: 60,
                                                                    constraints:
                                                                        BoxConstraints(
                                                                      maxWidth:
                                                                          400,
                                                                    ),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xFF1EEBBD),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                    ),
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              10,
                                                                              0,
                                                                              10,
                                                                              0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                children: [
                                                                                  Container(
                                                                                    width: 30,
                                                                                    height: 30,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    alignment: AlignmentDirectional(0, 0),
                                                                                    child: Text(
                                                                                      '1',
                                                                                      style: FlutterFlowTheme.of(context).bodyText1,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                                child: Text(
                                                                                  '¡Añade costo\nde Envío!',
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Icon(
                                                                            Icons.keyboard_arrow_right,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            size:
                                                                                24,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ).animated([
                                                                  animationsMap[
                                                                      'containerOnPageLoadAnimation2']
                                                                ]),
                                                              ),
                                                              Container(
                                                                width: 0,
                                                                height: 0,
                                                                child: custom_widgets
                                                                    .NotificationSound(
                                                                  width: 0,
                                                                  height: 0,
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        }),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 10, 0, 0),
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: BoxDecoration(),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(10, 0, 0, 0),
                                                child: StreamBuilder<
                                                    List<
                                                        AdminPricingRequestsForStoresRecord>>(
                                                  stream:
                                                      queryAdminPricingRequestsForStoresRecord(
                                                    queryBuilder: (adminPricingRequestsForStoresRecord) =>
                                                        adminPricingRequestsForStoresRecord
                                                            .where('seller',
                                                                isEqualTo:
                                                                    currentUserUid)
                                                            .where('status',
                                                                isEqualTo:
                                                                    'pendingAcceptance'),
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
                                                    List<AdminPricingRequestsForStoresRecord>
                                                        rowAdminPricingRequestsForStoresRecordList =
                                                        snapshot.data;
                                                    return SingleChildScrollView(
                                                      scrollDirection:
                                                          Axis.horizontal,
                                                      child: Row(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        children: List.generate(
                                                            rowAdminPricingRequestsForStoresRecordList
                                                                .length,
                                                            (rowIndex) {
                                                          final rowAdminPricingRequestsForStoresRecord =
                                                              rowAdminPricingRequestsForStoresRecordList[
                                                                  rowIndex];
                                                          return Column(
                                                            mainAxisSize:
                                                                MainAxisSize
                                                                    .max,
                                                            children: [
                                                              Padding(
                                                                padding:
                                                                    EdgeInsetsDirectional
                                                                        .fromSTEB(
                                                                            10,
                                                                            0,
                                                                            0,
                                                                            0),
                                                                child: InkWell(
                                                                  onTap:
                                                                      () async {
                                                                    context
                                                                        .pushNamed(
                                                                      'IngresaCostoDeEnvioAdmin',
                                                                      queryParams:
                                                                          {
                                                                        'orderId': serializeParam(
                                                                            rowAdminPricingRequestsForStoresRecord.id,
                                                                            ParamType.String),
                                                                      }.withoutNulls,
                                                                      extra: <
                                                                          String,
                                                                          dynamic>{
                                                                        kTransitionInfoKey:
                                                                            TransitionInfo(
                                                                          hasTransition:
                                                                              true,
                                                                          transitionType:
                                                                              PageTransitionType.fade,
                                                                          duration:
                                                                              Duration(milliseconds: 0),
                                                                        ),
                                                                      },
                                                                    );
                                                                  },
                                                                  child:
                                                                      Container(
                                                                    width: MediaQuery.of(context)
                                                                            .size
                                                                            .width *
                                                                        0.55,
                                                                    height: 60,
                                                                    constraints:
                                                                        BoxConstraints(
                                                                      maxWidth:
                                                                          400,
                                                                    ),
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Color(
                                                                          0xFF1EEBBD),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              5),
                                                                    ),
                                                                    alignment:
                                                                        AlignmentDirectional(
                                                                            0,
                                                                            0),
                                                                    child:
                                                                        Padding(
                                                                      padding: EdgeInsetsDirectional
                                                                          .fromSTEB(
                                                                              10,
                                                                              0,
                                                                              10,
                                                                              0),
                                                                      child:
                                                                          Row(
                                                                        mainAxisSize:
                                                                            MainAxisSize.max,
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.spaceBetween,
                                                                        children: [
                                                                          Row(
                                                                            mainAxisSize:
                                                                                MainAxisSize.max,
                                                                            children: [
                                                                              Column(
                                                                                mainAxisSize: MainAxisSize.max,
                                                                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                children: [
                                                                                  Container(
                                                                                    width: 30,
                                                                                    height: 30,
                                                                                    decoration: BoxDecoration(
                                                                                      color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      shape: BoxShape.circle,
                                                                                    ),
                                                                                    alignment: AlignmentDirectional(0, 0),
                                                                                    child: Text(
                                                                                      '1',
                                                                                      style: FlutterFlowTheme.of(context).bodyText1,
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              Padding(
                                                                                padding: EdgeInsetsDirectional.fromSTEB(10, 0, 0, 0),
                                                                                child: Text(
                                                                                  '¡Añade costo\nde Envío!',
                                                                                  style: FlutterFlowTheme.of(context).bodyText1.override(
                                                                                        fontFamily: 'Montserrat',
                                                                                        color: FlutterFlowTheme.of(context).secondaryBackground,
                                                                                      ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                          Icon(
                                                                            Icons.keyboard_arrow_right,
                                                                            color:
                                                                                FlutterFlowTheme.of(context).secondaryBackground,
                                                                            size:
                                                                                24,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                  ),
                                                                ).animated([
                                                                  animationsMap[
                                                                      'containerOnPageLoadAnimation3']
                                                                ]),
                                                              ),
                                                              Container(
                                                                width: 0,
                                                                height: 0,
                                                                child: custom_widgets
                                                                    .NotificationSound(
                                                                  width: 0,
                                                                  height: 0,
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        }),
                                                      ),
                                                    );
                                                  },
                                                ),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 50, 0, 15),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(15, 0, 0, 0),
                                                  child: Text(
                                                    'Vendidos Recientemente',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.black,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (!StoreHasProductsCall.response(
                                            homeStoreHasProductsResponse
                                                .jsonBody,
                                          ))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(20, 0, 0, 20),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 30,
                                                    borderWidth: 1,
                                                    buttonSize: 80,
                                                    icon: Icon(
                                                      Icons.add_circle_sharp,
                                                      color: Color(0xFFFDC054),
                                                      size: 50,
                                                    ),
                                                    onPressed: () {
                                                      print(
                                                          'IconButton pressed ...');
                                                    },
                                                  ),
                                                  Text(
                                                    'Carga tu primer producto\ny comienza a vender',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1, 0),
                                            child: FutureBuilder<
                                                List<ProductsRecord>>(
                                              future: queryProductsRecordOnce(
                                                queryBuilder: (productsRecord) =>
                                                    productsRecord.where('id',
                                                        whereIn: columnStoresRecord
                                                                    .recentlySold
                                                                    .toList() !=
                                                                ''
                                                            ? columnStoresRecord
                                                                .recentlySold
                                                                .toList()
                                                            : null),
                                                limit: 11,
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
                                                    rowProductsRecordList =
                                                    snapshot.data;
                                                return SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: List.generate(
                                                        rowProductsRecordList
                                                            .length,
                                                        (rowIndex) {
                                                      final rowProductsRecord =
                                                          rowProductsRecordList[
                                                              rowIndex];
                                                      return ProductCardWidget(
                                                        productId:
                                                            rowProductsRecord
                                                                .id,
                                                        location:
                                                            columnStoresRecord
                                                                .location,
                                                        productRef:
                                                            rowProductsRecord
                                                                .reference,
                                                        productDoc:
                                                            rowProductsRecord,
                                                      );
                                                    }),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 25, 0, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(15, 0, 0, 0),
                                                  child: Text(
                                                    'Añadidos Recientemente',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.black,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(0, 0, 5, 0),
                                                  child: FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 30,
                                                    borderWidth: 1,
                                                    buttonSize: 60,
                                                    icon: Icon(
                                                      Icons.add,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .primaryColor,
                                                      size: 30,
                                                    ),
                                                    onPressed: () async {
                                                      context.pushNamed(
                                                          'Productos');
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (!StoreHasProductsCall.response(
                                            homeStoreHasProductsResponse
                                                .jsonBody,
                                          ))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(20, 0, 0, 20),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 30,
                                                    borderWidth: 1,
                                                    buttonSize: 80,
                                                    icon: Icon(
                                                      Icons.add_circle_sharp,
                                                      color: Color(0xFFFDC054),
                                                      size: 50,
                                                    ),
                                                    onPressed: () {
                                                      print(
                                                          'IconButton pressed ...');
                                                    },
                                                  ),
                                                  Text(
                                                    'Carga tu primer producto\ny comienza a vender',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1, 0),
                                            child: FutureBuilder<
                                                List<ProductsRecord>>(
                                              future: queryProductsRecordOnce(
                                                queryBuilder: (productsRecord) =>
                                                    productsRecord.where('id',
                                                        whereIn: columnStoresRecord
                                                                    .recentlyAddedProducts
                                                                    .toList() !=
                                                                ''
                                                            ? columnStoresRecord
                                                                .recentlyAddedProducts
                                                                .toList()
                                                            : null),
                                                limit: 11,
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
                                                    rowProductsRecordList =
                                                    snapshot.data;
                                                return SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: List.generate(
                                                        rowProductsRecordList
                                                            .length,
                                                        (rowIndex) {
                                                      final rowProductsRecord =
                                                          rowProductsRecordList[
                                                              rowIndex];
                                                      return ProductCardWidget(
                                                        productId:
                                                            rowProductsRecord
                                                                .id,
                                                        location:
                                                            columnStoresRecord
                                                                .location,
                                                        productRef:
                                                            rowProductsRecord
                                                                .reference,
                                                        productDoc:
                                                            rowProductsRecord,
                                                      );
                                                    }),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 50, 0, 15),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(15, 0, 0, 0),
                                                  child: Text(
                                                    'Más Vendidos',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.black,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (!StoreHasProductsCall.response(
                                            homeStoreHasProductsResponse
                                                .jsonBody,
                                          ))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(20, 0, 0, 20),
                                              child: Row(
                                                mainAxisSize: MainAxisSize.max,
                                                children: [
                                                  FlutterFlowIconButton(
                                                    borderColor:
                                                        Colors.transparent,
                                                    borderRadius: 30,
                                                    borderWidth: 1,
                                                    buttonSize: 80,
                                                    icon: Icon(
                                                      Icons.add_circle_sharp,
                                                      color: Color(0xFFFDC054),
                                                      size: 50,
                                                    ),
                                                    onPressed: () {
                                                      print(
                                                          'IconButton pressed ...');
                                                    },
                                                  ),
                                                  Text(
                                                    'Carga tu primer producto\ny comienza a vender',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1, 0),
                                            child: FutureBuilder<
                                                List<ProductsRecord>>(
                                              future: queryProductsRecordOnce(
                                                queryBuilder:
                                                    (productsRecord) =>
                                                        productsRecord.where(
                                                            'id',
                                                            isEqualTo:
                                                                'kjkhjh'),
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
                                                    rowProductsRecordList =
                                                    snapshot.data;
                                                return SingleChildScrollView(
                                                  scrollDirection:
                                                      Axis.horizontal,
                                                  child: Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    children: List.generate(
                                                        rowProductsRecordList
                                                            .length,
                                                        (rowIndex) {
                                                      final rowProductsRecord =
                                                          rowProductsRecordList[
                                                              rowIndex];
                                                      return ProductCardWidget(
                                                        productId:
                                                            rowProductsRecord
                                                                .id,
                                                        location:
                                                            columnStoresRecord
                                                                .location,
                                                        productRef:
                                                            rowProductsRecord
                                                                .reference,
                                                        productDoc:
                                                            rowProductsRecord,
                                                      );
                                                    }),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    0, 50, 0, 15),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(15, 0, 0, 0),
                                                  child: Text(
                                                    'Marcas Top',
                                                    style: FlutterFlowTheme.of(
                                                            context)
                                                        .bodyText1
                                                        .override(
                                                          fontFamily:
                                                              'Montserrat',
                                                          color: Colors.black,
                                                          fontSize: 18,
                                                          fontWeight:
                                                              FontWeight.w500,
                                                        ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          if (!StoreHasProductsCall.response(
                                            homeStoreHasProductsResponse
                                                .jsonBody,
                                          ))
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(20, 0, 0, 20),
                                              child: InkWell(
                                                onTap: () async {
                                                  context
                                                      .pushNamed('searcBrand');
                                                },
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    FlutterFlowIconButton(
                                                      borderColor:
                                                          Colors.transparent,
                                                      borderRadius: 30,
                                                      borderWidth: 1,
                                                      buttonSize: 80,
                                                      icon: Icon(
                                                        Icons.add_circle_sharp,
                                                        color:
                                                            Color(0xFFFDC054),
                                                        size: 50,
                                                      ),
                                                      onPressed: () {
                                                        print(
                                                            'IconButton pressed ...');
                                                      },
                                                    ),
                                                    Text(
                                                      'Añade una marca \ny comienza a vender',
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
                                                  ],
                                                ),
                                              ),
                                            ),
                                          Align(
                                            alignment:
                                                AlignmentDirectional(-1, 0),
                                            child: Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(10, 0, 0, 0),
                                              child: FutureBuilder<
                                                  List<BrandsRecord>>(
                                                future: queryBrandsRecordOnce(
                                                  queryBuilder:
                                                      (brandsRecord) =>
                                                          brandsRecord.where(
                                                              'isTop',
                                                              isEqualTo: true),
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
                                                  List<BrandsRecord>
                                                      rowBrandsRecordList =
                                                      snapshot.data;
                                                  return SingleChildScrollView(
                                                    scrollDirection:
                                                        Axis.horizontal,
                                                    child: Row(
                                                      mainAxisSize:
                                                          MainAxisSize.max,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      children: List.generate(
                                                          rowBrandsRecordList
                                                              .length,
                                                          (rowIndex) {
                                                        final rowBrandsRecord =
                                                            rowBrandsRecordList[
                                                                rowIndex];
                                                        return Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 10, 0),
                                                          child: Container(
                                                            width: 120,
                                                            height: 120,
                                                            clipBehavior:
                                                                Clip.antiAlias,
                                                            decoration:
                                                                BoxDecoration(
                                                              shape: BoxShape
                                                                  .circle,
                                                            ),
                                                            child:
                                                                Image.network(
                                                              valueOrDefault<
                                                                  String>(
                                                                rowBrandsRecord
                                                                    .logo,
                                                                'https://cdn.shopify.com/s/files/1/0590/5045/9343/files/MARCA.png?v=1655401403',
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      }),
                                                    ),
                                                  );
                                                },
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
                    );
                  },
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Future waitForFirestoreRequestCompleter({
    double minWait = 0,
    double maxWait = double.infinity,
  }) async {
    final stopwatch = Stopwatch()..start();
    while (true) {
      await Future.delayed(Duration(milliseconds: 50));
      final timeElapsed = stopwatch.elapsedMilliseconds;
      final requestComplete = _firestoreRequestCompleter?.isCompleted ?? false;
      if (timeElapsed > maxWait || (requestComplete && timeElapsed > minWait)) {
        break;
      }
    }
  }
}
