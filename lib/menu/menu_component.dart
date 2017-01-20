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
    MaterialExpansionPanel,
    MaterialExpansionPanelSet,
    MaterialRadioComponent,
    MaterialRadioGroupComponent,
    MaterialCheckboxComponent,
    NgFor
  ],
  providers: const [materialProviders],
)
class MenuComponent implements OnInit {

//  String apiRoot = 'http://bentobox.goodideas-campus.com';
  String apiRoot = 'https://bentobox.goodideas-campus.com';

  List searchResults = [];

  String cancelResult = [];

  String queryResult = [];

  @override
  ngOnInit() {

    resetSearch();

//    resetBetting();
//    resetOther();
  }

  void resetSearch() {
    searchResults = [];
  }

  void resetCancel() {
    cancelResult = [];
  }

  void resetQuery() {
    queryResult = [];
  }

  void order(String idStr, String resNoStr) {
    //
	print('order: $idStr $resNoStr');

    Map map = {'id': idStr, 'resNo': resNoStr};

    String url = apiRoot + '/order';

    HttpRequest.postFormData(url, map).then((HttpRequest request) {

      if (request.readyState == HttpRequest.DONE &&
          (request.status == 200 || request.status == 0)) {

        Map parsedMap = JSON.decode(request.responseText);

		print(parsedMap);
      }
    });
  }

  void cancel(String idStr, String resNoStr) {
    //
	print('cancel: $idStr $resNoStr');

    Map map = {'id': idStr, 'resNo': resNoStr};

    String url = apiRoot + '/cancel';

    HttpRequest.postFormData(url, map).then((HttpRequest request) {

      if (request.readyState == HttpRequest.DONE &&
          (request.status == 200 || request.status == 0)) {

        Map parsedMap = JSON.decode(request.responseText);

		cancelResult = [parsedMap];
      }
    });
  }

  void update(String idStr, String resNoStr) {
    //
	print('update: $idStr $resNoStr');

    Map map = {'id': idStr, 'resNo': resNoStr};

    String url = apiRoot + '/update';

    HttpRequest.postFormData(url, map).then((HttpRequest request) {

      if (request.readyState == HttpRequest.DONE &&
          (request.status == 200 || request.status == 0)) {

        Map parsedMap = JSON.decode(request.responseText);

		print(parsedMap);
      }
    });
  }

  void query(String idStr, String resNoStr) {
    //
	print('query: $idStr $resNoStr');

    Map map = {'id': idStr, 'resNo': resNoStr};

    String url = apiRoot + '/query';

    HttpRequest.postFormData(url, map).then((HttpRequest request) {

      if (request.readyState == HttpRequest.DONE &&
          (request.status == 200 || request.status == 0)) {

        Map parsedMap = JSON.decode(request.responseText);

		queryResult = [parsedMap];
      }
    });
  }

  void search(String dateStr) {

    Map map = {'date': dateStr};

    String url = apiRoot + '/search';

    HttpRequest.postFormData(url, map).then((HttpRequest request) {

      if (request.readyState == HttpRequest.DONE &&
          (request.status == 200 || request.status == 0)) {

        Map parsedMap = JSON.decode(request.responseText);

        searchResults = parsedMap['result'];
      }
    });
  }

}