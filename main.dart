main(List<String> args) {
  var x = [{1, 2}, {'a', 'b'}];
  var y = <Set>[{1, 2}, {'a', 'b'}];
  var z = <Set>[{1, 2}, {1, 2}];
  var a = {1, 2};



  print(x.runtimeType);
  print(y.runtimeType);
  print(z.runtimeType);
  print(a.runtimeType);
}