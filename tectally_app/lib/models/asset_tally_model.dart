class AssetTallyModel {
  var Computer;
  var Mobile;
  var Networking;
  var Printer;
  var Peripheral;
  var Storage;
  var Others;

  AssetTallyModel({
    this.Computer,
    this.Mobile,
    this.Networking,
    this.Printer,
    this.Peripheral,
    this.Storage,
    this.Others,
  });

  factory AssetTallyModel.fromJson(Map<String, dynamic> json) {
    return AssetTallyModel(
      Computer: json['Computer'],
      Mobile: json['Mobile'],
      Networking: json['Networking'],
      Printer: json['Printer'],
      Peripheral: json['Peripheral'],
      Storage: json['Storage'],
      Others: json['Others'],
    );
  }
}
