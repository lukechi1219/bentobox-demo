// Copyright (c) 2017, Luke. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:angular2/core.dart';
import 'package:angular2_components/angular2_components.dart';

import 'package:bentobox_demo/hello_dialog/hello_dialog.dart';
import 'package:bentobox_demo/menu/menu_component.dart';

@Component(
  selector: 'my-app',
  styleUrls: const ['app_component.css'],
  templateUrl: 'app_component.html',
  directives: const [
    materialDirectives,
    HelloDialog,
    MenuComponent
  ],
  providers: const [materialProviders],
)
class AppComponent {
  // Nothing here yet. All logic is in HelloDialog.
}
