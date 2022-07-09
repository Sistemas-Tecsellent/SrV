import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:page_transition/page_transition.dart';
import '../flutter_flow_theme.dart';
import '../../backend/backend.dart';
import '../../auth/firebase_user_provider.dart';

import '../../index.dart';
import '../../main.dart';
import 'serialization_util.dart';

export 'package:go_router/go_router.dart';
export 'serialization_util.dart';

const kTransitionInfoKey = '__transition_info__';

class AppStateNotifier extends ChangeNotifier {
  SrConstruccionVendedoresFirebaseUser initialUser;
  SrConstruccionVendedoresFirebaseUser user;
  bool showSplashImage = true;
  String _redirectLocation;

  /// Determines whether the app will refresh and build again when a sign
  /// in or sign out happens. This is useful when the app is launched or
  /// on an unexpected logout. However, this must be turned off when we
  /// intend to sign in/out and then navigate or perform any actions after.
  /// Otherwise, this will trigger a refresh and interrupt the action(s).
  bool notifyOnAuthChange = true;

  bool get loading => user == null || showSplashImage;
  bool get loggedIn => user?.loggedIn ?? false;
  bool get initiallyLoggedIn => initialUser?.loggedIn ?? false;
  bool get shouldRedirect => loggedIn && _redirectLocation != null;

  String getRedirectLocation() => _redirectLocation;
  bool hasRedirect() => _redirectLocation != null;
  void setRedirectLocationIfUnset(String loc) => _redirectLocation ??= loc;
  void clearRedirectLocation() => _redirectLocation = null;

  /// Mark as not needing to notify on a sign in / out when we intend
  /// to perform subsequent actions (such as navigation) afterwards.
  void updateNotifyOnAuthChange(bool notify) => notifyOnAuthChange = notify;

  void update(SrConstruccionVendedoresFirebaseUser newUser) {
    initialUser ??= newUser;
    user = newUser;
    // Refresh the app on auth change unless explicitly marked otherwise.
    if (notifyOnAuthChange) {
      notifyListeners();
    }
    // Once again mark the notifier as needing to update on auth change
    // (in order to catch sign in / out events).
    updateNotifyOnAuthChange(true);
  }

  void stopShowingSplashImage() {
    showSplashImage = false;
    notifyListeners();
  }
}

GoRouter createRouter(AppStateNotifier appStateNotifier) => GoRouter(
      initialLocation: '/',
      debugLogDiagnostics: true,
      refreshListenable: appStateNotifier,
      errorBuilder: (context, _) =>
          appStateNotifier.loggedIn ? HomeWidget() : InicioDeSesionWidget(),
      routes: [
        FFRoute(
          name: '_initialize',
          path: '/',
          builder: (context, _) =>
              appStateNotifier.loggedIn ? HomeWidget() : InicioDeSesionWidget(),
          routes: [
            FFRoute(
              name: 'Home',
              path: 'home',
              requireAuth: true,
              builder: (context, params) => HomeWidget(),
            ),
            FFRoute(
              name: 'InicioDeSesion',
              path: 'login',
              builder: (context, params) => InicioDeSesionWidget(),
            ),
            FFRoute(
              name: 'searchWitCategory',
              path: 'buscar/categoria',
              requireAuth: true,
              builder: (context, params) => SearchWitCategoryWidget(
                category: params.getParam('category', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'Productos',
              path: 'mis-productos',
              requireAuth: true,
              builder: (context, params) => ProductosWidget(),
            ),
            FFRoute(
              name: 'Marcas',
              path: 'mis-marcas',
              requireAuth: true,
              builder: (context, params) => MarcasWidget(),
            ),
            FFRoute(
              name: 'Pedidos',
              path: 'mis-pedidos',
              requireAuth: true,
              builder: (context, params) => PedidosWidget(),
            ),
            FFRoute(
              name: 'ProductosDeMarca',
              path: 'marca/productos',
              requireAuth: true,
              builder: (context, params) => ProductosDeMarcaWidget(
                brand: params.getParam('brand', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'VariantInventory',
              path: 'producto/inventario/:productId',
              requireAuth: true,
              builder: (context, params) => VariantInventoryWidget(
                productTitle: params.getParam('productTitle', ParamType.String),
                variantId: params.getParam('variantId', ParamType.String),
                unit: params.getParam('unit', ParamType.String),
                initialInventory:
                    params.getParam('initialInventory', ParamType.int),
                publicPriceEnabled:
                    params.getParam('publicPriceEnabled', ParamType.bool),
                wholesalePriceEnabled:
                    params.getParam('wholesalePriceEnabled', ParamType.bool),
                megaWholesalePriceEnabled: params.getParam(
                    'megaWholesalePriceEnabled', ParamType.bool),
                discount1Enabled:
                    params.getParam('discount1Enabled', ParamType.bool),
                discount2Enabled:
                    params.getParam('discount2Enabled', ParamType.bool),
                discount3Enabled:
                    params.getParam('discount3Enabled', ParamType.bool),
                productId: params.getParam('productId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'NuevoPedidoEXPRESS',
              path: 'mis-pedidos/nuevo-pedido',
              requireAuth: true,
              builder: (context, params) => NuevoPedidoEXPRESSWidget(
                expressOrderId:
                    params.getParam('expressOrderId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'PedidoListoEXPRESS',
              path: 'mis-pedidos/pedido-listo',
              requireAuth: true,
              builder: (context, params) => PedidoListoEXPRESSWidget(
                orderId: params.getParam('orderId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'ProductPage',
              path: 'producto/:productId',
              requireAuth: true,
              builder: (context, params) => ProductPageWidget(
                productId: params.getParam('productId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'PorEntregarEXPRESS',
              path: 'mis-pedidos/por-entregar',
              requireAuth: true,
              builder: (context, params) => PorEntregarEXPRESSWidget(
                orderId: params.getParam('orderId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'Ventas',
              path: 'mis-ventas',
              requireAuth: true,
              builder: (context, params) => VentasWidget(),
            ),
            FFRoute(
              name: 'AnadirRepartidor',
              path: 'mis-repartidores/add-delivery',
              requireAuth: true,
              builder: (context, params) => AnadirRepartidorWidget(),
            ),
            FFRoute(
              name: 'IngresoDia',
              path: 'mis-ventas/cobradas-dia',
              requireAuth: true,
              builder: (context, params) => IngresoDiaWidget(
                month: params.getParam('month', ParamType.String),
                dayInNumber: params.getParam('dayInNumber', ParamType.int),
                year: params.getParam('year', ParamType.int),
              ),
            ),
            FFRoute(
              name: 'IngresoPedido',
              path: 'misventas/cobradas-dia/pedido',
              requireAuth: true,
              builder: (context, params) => IngresoPedidoWidget(),
            ),
            FFRoute(
              name: 'Repartidores',
              path: 'mis-repartidores',
              requireAuth: true,
              builder: (context, params) => RepartidoresWidget(),
            ),
            FFRoute(
              name: 'Perfil',
              path: 'mi-perfil',
              requireAuth: true,
              builder: (context, params) => PerfilWidget(),
            ),
            FFRoute(
              name: 'InfoTienda',
              path: 'mi-perfil/informacion-de-mi-tienda',
              requireAuth: true,
              builder: (context, params) => InfoTiendaWidget(),
            ),
            FFRoute(
              name: 'Onboarding',
              path: 'onboarding',
              requireAuth: true,
              builder: (context, params) => OnboardingWidget(),
            ),
            FFRoute(
              name: 'Registro',
              path: 'registro',
              builder: (context, params) => RegistroWidget(),
            ),
            FFRoute(
              name: 'registro2',
              path: 'registro/documentos',
              requireAuth: true,
              builder: (context, params) => Registro2Widget(),
            ),
            FFRoute(
              name: 'registro1',
              path: 'registro/datos-generales',
              requireAuth: true,
              builder: (context, params) => Registro1Widget(),
            ),
            FFRoute(
              name: 'registro3',
              path: 'registro/datos-bancarios',
              requireAuth: true,
              builder: (context, params) => Registro3Widget(),
            ),
            FFRoute(
              name: 'registro4',
              path: 'registro/metodo',
              requireAuth: true,
              builder: (context, params) => Registro4Widget(),
            ),
            FFRoute(
              name: 'HistorialPedidos',
              path: 'mis-pedidos/historial',
              requireAuth: true,
              builder: (context, params) => HistorialPedidosWidget(),
            ),
            FFRoute(
              name: 'IngresoDiaDevoluciones',
              path: 'ingresoDiaDevoluciones',
              requireAuth: true,
              builder: (context, params) => IngresoDiaDevolucionesWidget(),
            ),
            FFRoute(
              name: 'ValidandoCuenta',
              path: 'login/validando-cuenta',
              requireAuth: true,
              builder: (context, params) => ValidandoCuentaWidget(),
            ),
            FFRoute(
              name: 'EnterLocationWithMap',
              path: 'mi-perfil/ubicacion',
              requireAuth: true,
              builder: (context, params) => EnterLocationWithMapWidget(),
            ),
            FFRoute(
              name: 'PedidoSolicitudDevolucion',
              path: 'pedidoSolicitudDevolucion',
              requireAuth: true,
              builder: (context, params) => PedidoSolicitudDevolucionWidget(),
            ),
            FFRoute(
              name: 'PedidoSolicitudDevolucionAprobada',
              path: 'pedidoSolicitudDevolucionAprobada',
              requireAuth: true,
              builder: (context, params) =>
                  PedidoSolicitudDevolucionAprobadaWidget(),
            ),
            FFRoute(
              name: 'SolicitudesDevolucion',
              path: 'solicitudesDevolucion',
              requireAuth: true,
              builder: (context, params) => SolicitudesDevolucionWidget(),
            ),
            FFRoute(
              name: 'Notificaciones',
              path: 'notificaciones',
              requireAuth: true,
              builder: (context, params) => NotificacionesWidget(),
            ),
            FFRoute(
              name: 'TiendaAceptada',
              path: 'tienda-aprobada',
              requireAuth: true,
              builder: (context, params) => TiendaAceptadaWidget(),
            ),
            FFRoute(
              name: 'TiendaRechazada',
              path: 'tienda-rechazada',
              requireAuth: true,
              builder: (context, params) => TiendaRechazadaWidget(),
            ),
            FFRoute(
              name: 'Comprar',
              path: 'comprar',
              requireAuth: true,
              builder: (context, params) => ComprarWidget(),
            ),
            FFRoute(
              name: 'ProductPageComprar',
              path: 'comprar/productos/producto',
              requireAuth: true,
              builder: (context, params) => ProductPageComprarWidget(),
            ),
            FFRoute(
              name: 'ProductosComprar',
              path: 'comprar/productos',
              requireAuth: true,
              builder: (context, params) => ProductosComprarWidget(),
            ),
            FFRoute(
              name: 'Carrito',
              path: 'comprar/carrito',
              requireAuth: true,
              builder: (context, params) => CarritoWidget(),
            ),
            FFRoute(
              name: 'Checkout',
              path: 'comprar/checkout',
              requireAuth: true,
              builder: (context, params) => CheckoutWidget(),
            ),
            FFRoute(
              name: 'PedidoCheckout',
              path: 'checkout/resumen-de-pedido',
              requireAuth: true,
              builder: (context, params) => PedidoCheckoutWidget(),
            ),
            FFRoute(
              name: 'InfoTransferencia',
              path: 'infoTransferencia',
              requireAuth: true,
              builder: (context, params) => InfoTransferenciaWidget(),
            ),
            FFRoute(
              name: 'PedidoFinal',
              path: 'mis-compras/pedido',
              requireAuth: true,
              builder: (context, params) => PedidoFinalWidget(),
            ),
            FFRoute(
              name: 'chat',
              path: 'chat',
              requireAuth: true,
              asyncParams: {
                'chatUser': getDoc('sellers', SellersRecord.serializer),
              },
              builder: (context, params) => ChatWidget(
                chatUser: params.getParam('chatUser', ParamType.Document),
                chatRef: params.getParam(
                    'chatRef', ParamType.DocumentReference, 'chats'),
              ),
            ),
            FFRoute(
              name: 'MisCompras',
              path: 'mis-compras',
              requireAuth: true,
              builder: (context, params) => MisComprasWidget(),
            ),
            FFRoute(
              name: 'chats',
              path: 'chats',
              requireAuth: true,
              builder: (context, params) => ChatsWidget(),
            ),
            FFRoute(
              name: 'MarcaSingle',
              path: 'buzon-de-mensajes',
              requireAuth: true,
              builder: (context, params) => MarcaSingleWidget(
                brand: params.getParam('brand', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'ResumenSolicitudCotizacion',
              path: 'resumenSolicitudCotizacion',
              requireAuth: true,
              builder: (context, params) => ResumenSolicitudCotizacionWidget(),
            ),
            FFRoute(
              name: 'categoriaSingle',
              path: 'comprar/categoria',
              requireAuth: true,
              builder: (context, params) => CategoriaSingleWidget(),
            ),
            FFRoute(
              name: 'DatosBancarios',
              path: 'mi-perfil/mi-cuenta/datos-bancarios',
              requireAuth: true,
              builder: (context, params) => DatosBancariosWidget(),
            ),
            FFRoute(
              name: 'Cotizaciones',
              path: 'mi-perfil/mis-cotizaciones',
              requireAuth: true,
              builder: (context, params) => CotizacionesWidget(),
            ),
            FFRoute(
              name: 'MiCuenta',
              path: 'mi-perfil/mi-cuenta',
              requireAuth: true,
              builder: (context, params) => MiCuentaWidget(),
            ),
            FFRoute(
              name: 'InformacionFiscal',
              path: 'mi-perfil/mi-cuenta/informacion-fiscal',
              requireAuth: true,
              builder: (context, params) => InformacionFiscalWidget(),
            ),
            FFRoute(
              name: 'PorEntregarRecogerEnTiendaSELLER',
              path: 'mis-pedidos/por-entregar/recoger-en-tienda',
              requireAuth: true,
              builder: (context, params) =>
                  PorEntregarRecogerEnTiendaSELLERWidget(
                orderId: params.getParam('orderId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'NuevoPedidoRecogerEnTiendaSELLER',
              path: 'mis-pedidos/nuevo-pedido/recoger-en-tienda',
              requireAuth: true,
              builder: (context, params) =>
                  NuevoPedidoRecogerEnTiendaSELLERWidget(
                orderId: params.getParam('orderId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'PedidoListoRecogerEnTiendaSELLER',
              path: 'mis-pedidos/pedido-listo/recoger-en-tienda',
              requireAuth: true,
              builder: (context, params) =>
                  PedidoListoRecogerEnTiendaSELLERWidget(
                orderId: params.getParam('orderId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'NuevoPedidoSELLEREXPRESS',
              path: 'mis-pedidos/nuevo-pedido/seller',
              requireAuth: true,
              builder: (context, params) => NuevoPedidoSELLEREXPRESSWidget(
                orderId: params.getParam('orderId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'PedidoListoSELLERexpress',
              path: 'mis-pedidos/pedido-listo/seller',
              requireAuth: true,
              builder: (context, params) => PedidoListoSELLERexpressWidget(
                orderId: params.getParam('orderId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'PorEntregarSELLEREXPRESS',
              path: 'mis-pedidos/por-entregar/seller',
              requireAuth: true,
              builder: (context, params) => PorEntregarSELLEREXPRESSWidget(
                orderId: params.getParam('orderId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'NuevoPedido1-5DIAS',
              path: 'nuevoPedido15DIAS',
              requireAuth: true,
              builder: (context, params) => NuevoPedido15DIASWidget(
                normalOrderId:
                    params.getParam('normalOrderId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'PedidoListo1-5DIAS',
              path: 'mis-pedidos/pedido-listo-5-dias',
              requireAuth: true,
              builder: (context, params) => PedidoListo15DIASWidget(
                orderId: params.getParam('orderId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'PorEntregar1-5DIAS',
              path: 'mis-pedidos/por-entregar-5-dias',
              requireAuth: true,
              builder: (context, params) => PorEntregar15DIASWidget(
                orderId: params.getParam('orderId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'VentasCopy',
              path: 'ventasCopy',
              requireAuth: true,
              builder: (context, params) => VentasCopyWidget(),
            ),
            FFRoute(
              name: 'EditarPerfil',
              path: 'mi-cuenta/editar-perfil',
              requireAuth: true,
              builder: (context, params) => EditarPerfilWidget(),
            ),
            FFRoute(
              name: 'Ajustes',
              path: 'mi-perfil/ajustes',
              requireAuth: true,
              builder: (context, params) => AjustesWidget(),
            ),
            FFRoute(
              name: 'SobreSrConstruccion',
              path: 'mi-perfil/ajustes/srconstruccion',
              requireAuth: true,
              builder: (context, params) => SobreSrConstruccionWidget(),
            ),
            FFRoute(
              name: 'searcBrand',
              path: 'buscar/marca',
              requireAuth: true,
              builder: (context, params) => SearcBrandWidget(),
            ),
            FFRoute(
              name: 'NotificacionesAjustes',
              path: 'mi-perfil/ajustes/notificaciones',
              requireAuth: true,
              builder: (context, params) => NotificacionesAjustesWidget(),
            ),
            FFRoute(
              name: 'search',
              path: 'buscar',
              requireAuth: true,
              builder: (context, params) => SearchWidget(),
            ),
            FFRoute(
              name: 'PedidoListoSELLER5DIAS',
              path: 'mis-pedidos/pedido-listo/5-dias/seller',
              requireAuth: true,
              builder: (context, params) => PedidoListoSELLER5DIASWidget(
                orderId: params.getParam('orderId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'NuevoPedidoSELLER5DIAS',
              path: 'mis-pedidos/nuevo-pedido/5-dias/seller',
              requireAuth: true,
              builder: (context, params) => NuevoPedidoSELLER5DIASWidget(
                orderId: params.getParam('orderId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'PorEntregarSELLER5DIAS',
              path: 'mis-pedidos/por-entregar/5-dias/seller',
              requireAuth: true,
              builder: (context, params) => PorEntregarSELLER5DIASWidget(
                orderId: params.getParam('orderId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'IngresaCostoDeEnvio',
              path: 'mis-pedidos/ingresar-costo-de-envio',
              requireAuth: true,
              builder: (context, params) => IngresaCostoDeEnvioWidget(
                orderId: params.getParam('orderId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'IngresaCostoDeEnvioAdmin',
              path: 'mis-pedidos/ingresar-costo-de-envio-para-admin',
              requireAuth: true,
              builder: (context, params) => IngresaCostoDeEnvioAdminWidget(
                orderId: params.getParam('orderId', ParamType.String),
              ),
            ),
            FFRoute(
              name: 'ProductosPropios',
              path: 'mis-productos/productos-unicos',
              requireAuth: true,
              builder: (context, params) => ProductosPropiosWidget(
                brand: params.getParam('brand', ParamType.String),
              ),
            )
          ].map((r) => r.toRoute(appStateNotifier)).toList(),
        ).toRoute(appStateNotifier),
      ],
    );

extension NavParamExtensions on Map<String, String> {
  Map<String, String> get withoutNulls =>
      Map.fromEntries(entries.where((e) => e.value != null));
}

extension NavigationExtensions on BuildContext {
  void goNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : goNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );

  void pushNamedAuth(
    String name,
    bool mounted, {
    Map<String, String> params = const <String, String>{},
    Map<String, String> queryParams = const <String, String>{},
    Object extra,
    bool ignoreRedirect = false,
  }) =>
      !mounted || GoRouter.of(this).shouldRedirect(ignoreRedirect)
          ? null
          : pushNamed(
              name,
              params: params,
              queryParams: queryParams,
              extra: extra,
            );
}

extension GoRouterExtensions on GoRouter {
  AppStateNotifier get appState =>
      (routerDelegate.refreshListenable as AppStateNotifier);
  void prepareAuthEvent([bool ignoreRedirect = false]) =>
      appState.hasRedirect() && !ignoreRedirect
          ? null
          : appState.updateNotifyOnAuthChange(false);
  bool shouldRedirect(bool ignoreRedirect) =>
      !ignoreRedirect && appState.hasRedirect();
  void setRedirectLocationIfUnset(String location) =>
      (routerDelegate.refreshListenable as AppStateNotifier)
          .updateNotifyOnAuthChange(false);
}

extension _GoRouterStateExtensions on GoRouterState {
  Map<String, dynamic> get extraMap =>
      extra != null ? extra as Map<String, dynamic> : {};
  Map<String, dynamic> get allParams => <String, dynamic>{}
    ..addAll(params)
    ..addAll(queryParams)
    ..addAll(extraMap);
  TransitionInfo get transitionInfo => extraMap.containsKey(kTransitionInfoKey)
      ? extraMap[kTransitionInfoKey] as TransitionInfo
      : TransitionInfo.appDefault();
}

class FFParameters {
  FFParameters(this.state, [this.asyncParams = const {}]);

  final GoRouterState state;
  final Map<String, Future<dynamic> Function(String)> asyncParams;

  Map<String, dynamic> futureParamValues = {};

  bool get isEmpty => state.allParams.isEmpty;
  bool isAsyncParam(MapEntry<String, dynamic> param) =>
      asyncParams.containsKey(param.key) && param.value is String;
  bool get hasFutures => state.allParams.entries.any(isAsyncParam);
  Future<bool> completeFutures() => Future.wait(
        state.allParams.entries.where(isAsyncParam).map(
          (param) async {
            final doc = await asyncParams[param.key](param.value)
                .onError((_, __) => null);
            if (doc != null) {
              futureParamValues[param.key] = doc;
              return true;
            }
            return false;
          },
        ),
      ).onError((_, __) => [false]).then((v) => v.every((e) => e));

  dynamic getParam(
    String paramName,
    ParamType type, [
    String collectionName,
  ]) {
    if (futureParamValues.containsKey(paramName)) {
      return futureParamValues[paramName];
    }
    if (!state.allParams.containsKey(paramName)) {
      return null;
    }
    final param = state.allParams[paramName];
    // Got parameter from `extras`, so just directly return it.
    if (param is! String) {
      return param;
    }
    // Return serialized value.
    return deserializeParam(param, type, collectionName);
  }
}

class FFRoute {
  const FFRoute({
    @required this.name,
    @required this.path,
    @required this.builder,
    this.requireAuth = false,
    this.asyncParams = const {},
    this.routes = const [],
  });

  final String name;
  final String path;
  final bool requireAuth;
  final Map<String, Future<dynamic> Function(String)> asyncParams;
  final Widget Function(BuildContext, FFParameters) builder;
  final List<GoRoute> routes;

  GoRoute toRoute(AppStateNotifier appStateNotifier) => GoRoute(
        name: name,
        path: path,
        redirect: (state) {
          if (appStateNotifier.shouldRedirect) {
            final redirectLocation = appStateNotifier.getRedirectLocation();
            appStateNotifier.clearRedirectLocation();
            return redirectLocation;
          }

          if (requireAuth && !appStateNotifier.loggedIn) {
            appStateNotifier.setRedirectLocationIfUnset(state.location);
            return '/login';
          }
          return null;
        },
        pageBuilder: (context, state) {
          final ffParams = FFParameters(state, asyncParams);
          final page = ffParams.hasFutures
              ? FutureBuilder(
                  future: ffParams.completeFutures(),
                  builder: (context, _) => builder(context, ffParams),
                )
              : builder(context, ffParams);
          final child = appStateNotifier.loading
              ? Container(
                  color: Colors.transparent,
                  child: Builder(
                    builder: (context) => Image.asset(
                      'assets/images/Diseo_sin_ttulo.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                )
              : page;

          final transitionInfo = state.transitionInfo;
          return transitionInfo.hasTransition
              ? CustomTransitionPage(
                  key: state.pageKey,
                  child: child,
                  transitionDuration: transitionInfo.duration,
                  transitionsBuilder: PageTransition(
                    type: transitionInfo.transitionType,
                    duration: transitionInfo.duration,
                    reverseDuration: transitionInfo.duration,
                    alignment: transitionInfo.alignment,
                    child: child,
                  ).transitionsBuilder,
                )
              : MaterialPage(key: state.pageKey, child: child);
        },
        routes: routes,
      );
}

class TransitionInfo {
  const TransitionInfo({
    this.hasTransition,
    this.transitionType = PageTransitionType.fade,
    this.duration = const Duration(milliseconds: 300),
    this.alignment,
  });

  final bool hasTransition;
  final PageTransitionType transitionType;
  final Duration duration;
  final Alignment alignment;

  static TransitionInfo appDefault() => TransitionInfo(
        hasTransition: true,
        transitionType: PageTransitionType.fade,
        duration: Duration(milliseconds: 0),
      );
}
