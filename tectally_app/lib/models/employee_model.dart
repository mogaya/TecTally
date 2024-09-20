// ignore_for_file: non_constant_identifier_names, prefer_typing_uninitialized_variables

class EmployeeModel {
  var emp_id;
  var emp_name;
  var emp_dpt;
  var emp_role;
  var emp_email;
  var emp_phone;

  EmployeeModel({
    this.emp_dpt,
    this.emp_email,
    this.emp_id,
    this.emp_name,
    this.emp_phone,
    this.emp_role,
  });

  factory EmployeeModel.fromJson(Map<String, dynamic> json) {
    return EmployeeModel(
      emp_dpt: json['emp_dpt'],
      emp_email: json['emp_email'],
      emp_name: json['emp_name'],
      emp_phone: json['emp_phone'],
      emp_id: json['emp_id'],
      emp_role: json['emp_role'],
    );
  }
}
