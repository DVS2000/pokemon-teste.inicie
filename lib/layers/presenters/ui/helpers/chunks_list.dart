Iterable<List<T>> chunks<T>(List<T> lst, int n) sync* {
  final gen = List.generate(lst.length ~/ n + 1, (e) => e * n);
  for (int i in gen) {
    if (i < lst.length) {
      yield lst.sublist(i, i + n < lst.length ? i + n : lst.length);
    }
  }
}