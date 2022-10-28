extension ListExtension<T> on List<T>? {
  int? get itemCount => this?.length ?? 0;
}
