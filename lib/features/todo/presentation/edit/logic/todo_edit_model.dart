import 'package:flutter/foundation.dart';

class TodoEditModel {
  final String? title;
  final String? description;
  final int? categoryId;
  final String? errorMessage;

  const TodoEditModel({
    this.title,
    this.description,
    this.categoryId,
    this.errorMessage,
  });

  bool get canSave =>
      title?.isNotEmpty == true &&
      description?.isNotEmpty == true &&
      categoryId != null;

  TodoEditModel copyWith({
    ValueGetter<String?>? title,
    ValueGetter<String?>? description,
    ValueGetter<int?>? categoryId,
    ValueGetter<String?>? errorMessage,
  }) {
    return TodoEditModel(
      title: title != null ? title() : this.title,
      errorMessage: errorMessage != null ? errorMessage() : this.errorMessage,
      description: description != null ? description() : this.description,
      categoryId: categoryId != null ? categoryId() : this.categoryId,
    );
  }
}
