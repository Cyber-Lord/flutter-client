import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:invoiceninja/redux/app/app_state.dart';
import 'package:invoiceninja/redux/product/product_actions.dart';
import 'package:invoiceninja/redux/ui/list_ui_state.dart';
import 'package:redux/redux.dart';
import 'package:invoiceninja/utils/localization.dart';

class AppSearchButton extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    var localization = AppLocalization.of(context);
    var store = StoreProvider.of<AppState>(context);

    return StoreConnector<AppState, ListUIState>(
      converter: (Store<AppState> store) =>
          store.state.productListState(),
      //distinct: true,
      builder: (BuildContext context, listUIState) {
        return listUIState.search == null
            ? IconButton(
          icon: Icon(Icons.search),
          tooltip: localization.search,
          onPressed: () {
            store.dispatch(SearchProducts(''));
          },
        )
            : IconButton(
          icon: Icon(Icons.close),
          tooltip: localization.close,
          onPressed: () {
            store.dispatch(SearchProducts(null));
          },
        );
      },
    );
  }
}
