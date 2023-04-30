// ignore_for_file: public_member_api_docs, sort_constructors_first
class Company {
  String companyName;
  String? companyImage;
  String userName;
  String userPassword;
  String companyLink;
  String companyTitle;
  int companyAccount;
  int companyPhoneNumber;
  int companyPhoneNumber2;
  Company({
    required this.companyName,
    this.companyImage,
    required this.userName,
    required this.userPassword,
    required this.companyLink,
    required this.companyTitle,
    required this.companyAccount,
    required this.companyPhoneNumber,
    required this.companyPhoneNumber2,
  });
}
