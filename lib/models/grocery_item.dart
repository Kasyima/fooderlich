//! Setup of the model for the information u want to sv abt the items.

import 'package:flutter/painting.dart';

enum Importance {
  low,
  medium,
  high,
}

class GroceryItem {
  final String id;
  final String name;
  final Importance importance;
  final Color color;
  final int quantity;
  final DateTime date;
  bool isComplete;

  GroceryItem(
    this.id,
    this.name,
    this.importance,
    this.color,
    this.quantity,
    this.date,
    this.isComplete,
  );

//! copyWith copies and creates a completely new instance of GroceryItem.
//! This will be useful later, when you manage the state of the items.
  GroceryItem copyWith({
    String? id,
    String? name,
    Importance? importance,
    Color? color,
    int? quantity,
    DateTime? date,
    bool? isComplete,
  }) {
    return GroceryItem(
      id ?? this.id,
      name ?? this.name,
      importance ?? this.importance,
      color ?? this.color,
      quantity ?? this.quantity,
      date ?? this.date,
      isComplete ?? this.isComplete,
    );
  }
}
