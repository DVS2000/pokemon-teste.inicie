import 'package:flutter/material.dart';
import 'package:pokemon_teste/layers/core/inject/inject.dart';

import 'layers/presenters/ui/pages/app_page.dart';

void main() {

  // Injecção de Dependências
  Inject.init();
  
  runApp(const AppPage());
}