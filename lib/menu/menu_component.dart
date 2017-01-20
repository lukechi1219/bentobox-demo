// Copyright (c) 2017, Luke. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'dart:html';
import 'dart:convert';

import 'package:angular2/core.dart';
import 'package:angular2/src/common/directives.dart';
import 'package:angular2_components/angular2_components.dart';

@Component(
  selector: 'menu-component',
  styleUrls: const ['menu_component.css'],
  templateUrl: 'menu_component.html',
  directives: const [
    materialDirectives,
    MaterialCheckboxComponent,
    MaterialExpansionPanel,
    MaterialExpansionPanelSet,
    MaterialRadioComponent,
    MaterialRadioGroupComponent,
    NgFor
  ],
  providers: const [materialProviders],
)
class MenuComponent implements OnInit {

  final initialCashOptions = [0, 10, 100, 1000];

  final dailyDisposableOptions = [0, 2, 4, 10];

  final interestRateOptions = [1, 3, 5, 10];

  final yearsOptions = [1, 2, 3, 5, 10];

  List searchResults = [];

  int initialCash;

  int dailyDisposable;

  bool isInvesting = true;

  int interestRate;

  int years;

  var lottery;

  var strategy;

  @override
  ngOnInit() {
//    resetWallet();
//    resetBetting();
//    resetOther();
  }

  void order(String idStr, String resNoStr) {
    //
	print('order: $idStr $resNoStr');
  }

  void cancel(String idStr, String resNoStr) {
    //
	print('cancel: $idStr $resNoStr');
  }

  void update(String idStr, String resNoStr) {
    //
	print('update: $idStr $resNoStr');
  }

  void query(String idStr, String resNoStr) {
    //
	print('query: $idStr $resNoStr');
  }

  void search(String dateStr) {

    Map map = {'date': dateStr};

    var url = "https://bentobox.goodideas-campus.com/search";

    HttpRequest.postFormData(url, map).then((HttpRequest request) {

      if (request.readyState == HttpRequest.DONE &&
          (request.status == 200 || request.status == 0)) {

        Map parsedMap = JSON.decode(request.responseText);

        searchResults = parsedMap['result'];
      }
    });
  }

}