import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppLocalizations{
  final Locale? locale;

  AppLocalizations({this.locale});

  static AppLocalizations? of(BuildContext context){
    return Localizations.of<AppLocalizations>(context, AppLocalizations);
  }

  static const LocalizationsDelegate<AppLocalizations> delegate =_AppLocalizations();

  Map<String ,String>? _localizationString;

  Future<bool> load()async{

    String jsonString = await rootBundle.loadString('assets/lang/${locale!.languageCode}.json');
    Map<String,dynamic> jsonMap = json.decode(jsonString);
    _localizationString= jsonMap.map((key, value) {
      return MapEntry(key, value.toString());
    });
    return true;
  }

  String? translate(String key){
    return _localizationString![key];
  }

}


class _AppLocalizations extends LocalizationsDelegate<AppLocalizations>{

 const _AppLocalizations();

  @override
  bool isSupported(Locale locale) {
    // TODO: implement isSupported
    return ['en','ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalizations> load(Locale locale) async{
    // TODO: implement load
    AppLocalizations localizations =  AppLocalizations(locale: locale);
    await localizations.load();
    return localizations;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalizations> old) {
    // TODO: implement shouldReload
    return false;
  }


}