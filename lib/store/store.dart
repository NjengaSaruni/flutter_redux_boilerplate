import 'package:redux/redux.dart';

import 'package:iSave/reducers/app_reducer.dart';
import 'package:iSave/models/app_state.dart';
import 'package:iSave/middleware/middleware.dart';

Store<AppState> createStore() { 
    Store<AppState> store = new Store(
        appReducer,
        initialState: new AppState(),
        middleware: createMiddleware(),
    );
    persistor.load(store);

    return store;
}