Stream<int> increaseValue(int limit) async*
{
  for (int i = 1; i <= limit; i++) {
    yield i;
    await Future.delayed(const Duration(milliseconds: 200));
  }
}

void main()
{
  Stream<int> myStream = increaseValue(100);
  myStream.listen((event) {
    print(event);
  });
}