import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux_persist_flutter/redux_persist_flutter.dart';

import 'package:iSave/presentation/platform_adaptive.dart';
import 'package:iSave/screens/loading_screen.dart';
import 'package:iSave/screens/login_screen.dart';
import 'package:iSave/screens/main_screen.dart';
import 'package:iSave/store/store.dart';
import 'package:iSave/middleware/middleware.dart';
import 'package:iSave/models/app_state.dart';

void main() => runApp(new ReduxApp());

class ReduxApp extends StatelessWidget {
    final store = createStore();

    ReduxApp();

    @override
    Widget build(BuildContext context) {
        return new PersistorGate(
            persistor: persistor,
            loading: new LoadingScreen(),
            builder: (context) => new StoreProvider<AppState>(
                store: store,
                child: new MaterialApp(
                    title: 'iSave',
                    theme: defaultTargetPlatform == TargetPlatform.iOS
                        ? kIOSTheme
                        : kDefaultTheme,
                routes: <String, WidgetBuilder>{
                    '/': (BuildContext context) => new StoreConnector<AppState, dynamic>( 
                        converter: (store) => store.state.auth.isAuthenticated, 
                        builder: (BuildContext context, isAuthenticated) => isAuthenticated ? new MainScreen() : new LoginScreen()
                    ),
                    '/login': (BuildContext context) => new LoginScreen(),
                    '/main': (BuildContext context) => new MainScreen()
                }
                )
            ),
        );
    }

}