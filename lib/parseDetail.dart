import 'package:html/dom.dart';
import 'package:http/http.dart' as http;
import 'package:html/parser.dart';
import 'package:ihale_app/model/MostPopularDetail.dart';

main() {
  initDetail("https://www.wired.com/story/plaintext-qanon-has-infiltrated-the-hollywood-rumor-mill#intcid=_wired-most-popular-right-rail_5fe064ef-aae6-4db4-be1f-276b1a0baa99_popular4-1");
}

Future<MostDetail> initDetail([String url]) async {
  if (url != null) {
    StringBuffer buffer = StringBuffer();
    final response = await http.Client().get(Uri.parse(url));
    var document = parse(response.body);


    var det = document.querySelector("article");
    var p = det.getElementsByTagName("p");
    for (Element d in p) {
      buffer.write(d.text + " ");
    }


    var header = document.querySelector("h1");
    var headerTitle = document.querySelector("div.content-header__dek");
    print(headerTitle.text);
    print(header.text);

    return new MostDetail(url.toString(), header.text.toString(), headerTitle.text.toString(), buffer.toString());
  }
  print("Hata var");
}
