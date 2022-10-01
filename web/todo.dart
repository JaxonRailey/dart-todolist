import 'dart:html';
import 'dart:convert' show json;

class Todo {

    var input;
    var list;
    Map elems = {};
    Storage storage = window.localStorage;

    void show() {
        if (storage['elems'] == null) return;
        this.list.children.clear();
        this.elems = json.decode(storage['elems'].toString());
        this.elems.forEach((key, element) {
            this.item(key, element);
        });
    }

    void add(Event e) {
        final String now  = new DateTime.now().millisecondsSinceEpoch.toString();
        final String text = this.input.value.toString();

        this.item(now, text);

        this.elems[now]  = text;
        this.input.value = '';
        storage['elems'] = json.encode(this.elems);
    }

    void item(key, element) {
        var button = new ButtonElement();
        button.innerHtml = '<span></span>';
        button.setAttribute('data-id', key);
        button.onClick.listen((event) {
            this.elems.remove(key);
            storage['elems'] = json.encode(elems);
            show();
        });

        var li  = new LIElement();
        li.text = element;
        li.append(button);
        this.list.children.add(li);
    }
}