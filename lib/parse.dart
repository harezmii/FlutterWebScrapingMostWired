import 'package:html/dom.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';
import 'model/MostPopular.dart';

main() {
  init();
}

Future<List<Most>> init() async {
  List<Most> popular = new List<Most>();

  final response =
      await http.Client().get(Uri.parse("https://www.wired.com/most-popular/"));
  var document = parse(response.body);
  var elements = document.querySelectorAll("li.archive-item-component");

  var i = 0;
  if (elements.isNotEmpty) {
    for (Element element in elements) {
      var dateAndAuthor =
          element.querySelector("div.archive-item-component__byline");

      var header = element.querySelector("h2.archive-item-component__title");

      var imageLink = element.querySelector("img");
      var attributesImage = imageLink.attributes;
      var imageValue = attributesImage.values;
      print(imageValue.elementAt(0).toString());

      var split = dateAndAuthor.text.split("|");

      var detailLink = element.querySelector("a.archive-item-component__link");
      var attributes = detailLink.attributes;
      var iterable = attributes.values;

      popular.add(new Most(split[0], split[1], header.text,
          imageValue.elementAt(0).toString(), iterable.elementAt(1)));

      // print(split[1]);
      i += 1;
      if (i == 10) {
        break;
      }
    }
  }

  return popular;

}
