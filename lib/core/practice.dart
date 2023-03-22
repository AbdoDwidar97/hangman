/*Stream<int> increaseValue(int limit) async*
{
  for (int i = 1; i <= limit; i++) {
    yield i;
    await Future.delayed(const Duration(milliseconds: 200));
  }
}*/

abstract class BaseH5a
{
  String name = "";
  int id = 0;

  BaseH5a({required this.id, required this.name});
  BaseH5a clone();
  void printObject();
}

class H5a1 extends BaseH5a
{
  H5a1({
    name,
    id
  }) : super(name: name, id: id);

  @override
  BaseH5a clone()
  {
    return H5a1(name: name, id: id);
  }

  @override
  void printObject()
  {
    print("Name: $name, ID: $id");
  }

}

void main()
{
  /*Stream<int> myStream = increaseValue(100);
  myStream.listen((event) {
    print(event);
  });*/

  BaseH5a h = H5a1(name: "Ahmed", id: 122);
  h.printObject();

  H5a1 h2 = h.clone() as H5a1;
  h2.printObject();
}