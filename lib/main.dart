import 'package:book_logger/app.dart';
import 'package:book_logger/services/database_service.dart';
import 'package:flutter/material.dart';

void main() {
  final databaseService = DatabaseService();
  runApp(BookLoggerApp(
    databaseService: databaseService,
  ));
}
