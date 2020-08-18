class MostDetail {
  var _detailImageUrl;
  var _detailHeader;
  var _detailHeaderTitle;
  var _detailDetail;

  MostDetail(this._detailImageUrl, this._detailHeader, this._detailHeaderTitle,
      this._detailDetail);

  get detailImageUrl => _detailImageUrl;

  set detailImageUrl(value) {
    _detailImageUrl = value;
  }

  get detailHeader => _detailHeader;

  get detailDetail => _detailDetail;

  set detailDetail(value) {
    _detailDetail = value;
  }

  get detailHeaderTitle => _detailHeaderTitle;

  set detailHeaderTitle(value) {
    _detailHeaderTitle = value;
  }

  set detailHeader(value) {
    _detailHeader = value;
  }
}
