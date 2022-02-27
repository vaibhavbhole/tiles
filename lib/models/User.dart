import 'package:flutter/cupertino.dart';

class User {
  int customerId = 29;
  String email = "tahir@yopmail.com";
  String contactNo = "+966991234567";
  String firstName = "tahir";
  String lastName = "hussain";
  String imagePath =
      "https://www.iamhja.com/wp-content/uploads/2020/03/whatsapp-2Bdp-2Bfor-2Bboys-2Bhd.jpg";
  String loyaltyProfileId = "dc9a665d-f1da-ea11-a814-000d3a23cc7b";
  double totalPointsEarned = 370.0;
  double totalPointsRedeemed = 0.0;
  double totalPointsAvailable = 370.0;
  double totalPointsExpiring = 0.0;
  String dob = "1900-01-01t00:00:00";

  String get name=>firstName+" "+lastName;

  User({
      required this.customerId,
      required this.email,
      required this.contactNo,
      required this.firstName,
      required this.lastName,
      required this.imagePath,
      required this.loyaltyProfileId,
      required this.totalPointsEarned,
      required this.totalPointsRedeemed,
      required this.totalPointsAvailable,
      required this.totalPointsExpiring,
      required this.dob});

  factory User.fromJson(Map<String, dynamic> json) => User(
        customerId: json["customer_id"]??0,
        email: json["email"]??"",
        contactNo: json["contact_no"]??"",
        firstName: json["first_name"]??"",
        lastName: json["last_name"]??"",
        imagePath: json["image_path"] == ""
            ? "https://www.iamhja.com/wp-content/uploads/2020/03/whatsapp-2Bdp-2Bfor-2Bboys-2Bhd.jpg"
            : json["image_path"],
        loyaltyProfileId: json["loyalty_profileid"]??"",
        totalPointsEarned: json["total_points_earned"]??0.0,
        totalPointsRedeemed: json["total_points_redeemed"]??0.0,
        totalPointsAvailable: json["total_points_available"]??0.0,
        totalPointsExpiring: json["total_points_expiring"]??0.0,
        dob: json["dob"]??"",
      );

  Map<String, dynamic> toJson() => {
        "customer_id": customerId,
        "email": email,
        "contact_no": contactNo,
        "first_name": firstName,
        "last_name": lastName,
        "image_path": imagePath,
        "loyalty_profileid": loyaltyProfileId,
        "total_points_earned": totalPointsEarned,
        "total_points_redeemed": totalPointsRedeemed,
        "total_points_available": totalPointsAvailable,
        "total_points_expiring": totalPointsExpiring,
        "dob": dob,
      };
}
