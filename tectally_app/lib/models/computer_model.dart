// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

class AssetModel {
  var ast_id;
  var ast_name;
  var ast_tag;
  var ast_serial;
  var ast_category;
  var ast_purchase_date;
  var ast_price;
  var ast_supplier;
  var ast_warranty;
  var ast_licence;
  var ast_licence_date;
  var ast_licence_expiry;
  var ast_licence_no;
  var ast_asignee;
  var ast_department;
  var ast_issue_date;
  var ast_status;

  AssetModel({
    this.ast_id,
    this.ast_name,
    this.ast_tag,
    this.ast_serial,
    this.ast_category,
    this.ast_purchase_date,
    this.ast_price,
    this.ast_supplier,
    this.ast_warranty,
    this.ast_licence,
    this.ast_licence_date,
    this.ast_licence_expiry,
    this.ast_licence_no,
    this.ast_asignee,
    this.ast_department,
    this.ast_issue_date,
    this.ast_status,
  });

  factory AssetModel.fromJson(Map<String, dynamic> json) {
    return AssetModel(
      ast_id: json['ast_id'],
      ast_name: json['ast_name'],
      ast_tag: json['ast_tag'],
      ast_serial: json['ast_serial'],
      ast_category: json['ast_category'],
      ast_purchase_date: json['ast_purchase_date'],
      ast_price: json['ast_price'],
      ast_supplier: json['ast_supplier'],
      ast_warranty: json['ast_warranty'],
      ast_licence: json['ast_licence'],
      ast_licence_date: json['ast_licence_date'],
      ast_licence_expiry: json['ast_licence_expiry'],
      ast_licence_no: json['ast_licence_no'],
      ast_asignee: json['ast_asignee'],
      ast_department: json['ast_department'],
      ast_issue_date: json['ast_issue_date'],
      ast_status: json['ast_status'],
    );
  }
}
