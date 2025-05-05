1. Zależności: hive, riverpod, gorouter, buildrunner
2. Drzewo katalogów: hive, src, utils, features, home, presentation, db, provider
3. Pliki home_screen.dart, routes.dart, constants.
4. W pliku main.dart zamiana na routes, dodanie ProviderScope, WidgetsFlutterBinding.
5. Szkic home_screen.dart
6. Przygotuj plik dla stanu aplikacji - w tym przypadku stanem jest counter, zmieniający się po
   nasiśnięciu FAB. W tym celu stwórz plik counter_provider.dart (zacznij pisać riv:
   riverpodGeneratorNotifierProvider)
   `dart run build_runner build --delete-conflicting-outputs`
7. Uzupełnij home_screen.dart o counter z provider i o funkcję increment w FAB.

## Baza danych

1. Aby stan licznika był zapisywany w pamięci lokalnej do katalogu 'db' dodaj plik
   counter_model.dart.
2. Stwórz plik db_helper.dart z klasą dla metod zapisywania i pobierania danych z bazy danych. Dodaj
   provider dla klasy helpera.
3. Do katalogu Hive dodaj hive_adapters.dart by wygenerować adaptery. Uwaga: hive_adapters.dart musi
   się znajdować w lib/hive!!!
   `dart run build_runner build --delete-conflicting-outputs`
4. Do main.dart dodaj metody Hive (inicjalizacja, rejestracja adapterów, otwarcie Boxu). Uwaga!!! w
   main.dart musi być prawidłowy import (import 'package:hive_ce_flutter/adapters.dart';) inaczej
   będzie problem z rejestracją adapterów (metoda initFlutter nie będzie działać).
5. Teraz w home_screen.dart `import 'package:hive_ce_flutter/hive_flutter.dart';` - bez tego box nie
   będzie miał metody 'listenable()'.
6. Użyj 'ValueListenableBuilder' by uzyskać dostęp do boxa.

## Usunięcie komentarzy

Wyszukaj i zastąp: command+R
Regex dla komentarzy: \/\/.*  #.*