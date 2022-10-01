import 'dart:html';
import 'todo.dart';

final input = querySelector('input') as InputElement;
final list  = querySelector('ul') as UListElement;

void main() {
    final todo = Todo();
    todo.input = input;
    todo.list  = list;
    todo.show();
    input.onChange.listen(todo.add);
}