// Copyright 2018-present the Flutter authors. All Rights Reserved.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
// http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

import 'package:flutter/material.dart';

import './utils/colors.dart';
import 'backdrop.dart';
import 'home.dart';
import 'login.dart';
import 'menu/category_menu_page.dart';
import 'model/product.dart';
import 'supplemental/cut_corners_border.dart';
// New code
// New code


// TODO: Convert ShrineApp to stateful widget (104)
class ShrineApp extends StatefulWidget {
  @override
  _ShrineAppState createState() => _ShrineAppState();
}
class _ShrineAppState extends State<ShrineApp> {

  Category _currentCategory = Category.all;
  void _onCategoryTap(Category category) {
    setState(() {
      _currentCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      home: Backdrop(
        // TODO: Make currentCategory field take _currentCategory (104)
        currentCategory: _currentCategory,
        // TODO: Pass _currentCategory for frontLayer (104)
        frontLayer: HomePage2(category: _currentCategory),
        // TODO: Change backLayer field value to CategoryMenuPage (104)
        backLayer: CategoryMenuPage(
          currentCategory: _currentCategory,
          onCategoryTap: _onCategoryTap,
        ),
        frontTitle: Text('SHRINE'),
        backTitle: Text('MENU'),
      ),
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
      theme: _kShrineTheme,
    );
  }
  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }
    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => LoginPage(),
      fullscreenDialog: true,
    );
  }

}





// TODO: Build a Shrine Theme (103) 切换主题
final ThemeData _kShrineTheme = _buildShrineTheme();

ThemeData _buildShrineTheme() {
  final ThemeData base = ThemeData.light();
  return base.copyWith(
    accentColor: kShrineBrown900,
    primaryColor: kShrinePink100,
    buttonTheme: base.buttonTheme.copyWith(
      buttonColor: kShrinePink100,
      textTheme: ButtonTextTheme.normal,
    ),
    scaffoldBackgroundColor: kShrineBackgroundWhite,
    cardColor: kShrineBackgroundWhite,
    textSelectionColor: kShrinePink100,
    errorColor: kShrineErrorRed,
    // TODO: Add the text themes (103) 自定义字体
    textTheme: _buildShrineTextTheme(base.textTheme),
    primaryTextTheme: _buildShrineTextTheme(base.primaryTextTheme),
    accentTextTheme: _buildShrineTextTheme(base.accentTextTheme),
    // TODO: Add the icon themes (103) 自定义主图标
    primaryIconTheme: base.iconTheme.copyWith(
        color: kShrineBrown900
    ),
    // TODO: Decorate the inputs (103) 更改文本输入框的主题
//    inputDecorationTheme: InputDecorationTheme(
//      border: OutlineInputBorder(),
//    ),
    inputDecorationTheme: InputDecorationTheme(
      border: CutCornersBorder(), // Replace code，文本框切角样式
    ),
  );
}
// TODO: Build a Shrine Text Theme (103)
TextTheme _buildShrineTextTheme(TextTheme base) {
  return base.copyWith(
    headline: base.headline.copyWith(
      fontWeight: FontWeight.w500,
    ),
    title: base.title.copyWith(
        fontSize: 18.0
    ),
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
  ).apply(
    fontFamily: 'Rubik',
    displayColor: kShrineBrown900,
    bodyColor: kShrineBrown900,
  );
}

//第二套主题配色
ThemeData _buildShrineTheme2() {
  final ThemeData base = ThemeData.dark();
  return base.copyWith(
    accentColor: kShrineAltDarkGrey,
    primaryColor: kShrineAltDarkGrey,
    buttonColor: kShrineAltYellow,
    scaffoldBackgroundColor: kShrineAltDarkGrey,
    cardColor: kShrineAltDarkGrey,
    textSelectionColor: kShrinePink100,
    errorColor: kShrineErrorRed,
    textTheme: _buildShrineTextTheme2(base.textTheme),
    primaryTextTheme: (base.primaryTextTheme),
    accentTextTheme: _buildShrineTextTheme2(base.accentTextTheme),
    primaryIconTheme: base.iconTheme.copyWith(
        color: kShrineAltYellow
    ),
    inputDecorationTheme: InputDecorationTheme(
      border: CutCornersBorder(),
    ),
  );
}
TextTheme _buildShrineTextTheme2(TextTheme base) {
  return base.copyWith(
    headline: base.headline.copyWith(
      fontWeight: FontWeight.w500,
    ),
    title: base.title.copyWith(
        fontSize: 18.0
    ),
    caption: base.caption.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14.0,
    ),
  ).apply(
    fontFamily: 'Rubik',
    displayColor: kShrineSurfaceWhite,
    bodyColor: kShrineSurfaceWhite,
  );
}