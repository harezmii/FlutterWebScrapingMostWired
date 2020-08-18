class Most {
  var _date;
  var _author;
  var _header;
  var _imageUrl;
  var _detailLink;

  Most(
      this._date, this._author, this._header, this._imageUrl, this._detailLink);

  get date => _date;

  set date(value) {
    _date = value;
  }

  get author => _author;

  set author(value) {
    _author = value;
  }

  get header => _header;

  set header(value) {
    _header = value;
  }

  get imageUrl => _imageUrl;

  set imageUrl(value) {
    _imageUrl = value;
  }

  get detailLink => _detailLink;

  set detailLink(value) {
    _detailLink = value;
  }
}
