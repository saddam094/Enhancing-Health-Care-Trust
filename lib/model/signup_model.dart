/*
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
class ProfileImage {
  String? name;
  String? base64;

  ProfileImage({this.name, this.base64});

  ProfileImage.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    base64 = json['base64'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['name'] = name;
    data['base64'] = base64;
    return data;
  }
}

class RegisterModel {
  String? email;
  String? name;
  String? dob;
  String? phone;
  String? password;
  ProfileImage? profileImage;

  RegisterModel({this.email, this.name, this.dob, this.phone, this.password, this.profileImage});

  RegisterModel.fromJson(Map<String, dynamic> json) {
    email = json['email'];
    name = json['name'];
    dob = json['dob'];
    phone = json['phone'];
    password = json['password'];
    profileImage = json['profileImage'] != null ? ProfileImage?.fromJson(json['profileImage']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['email'] = email;
    data['name'] = name;
    data['dob'] = dob;
    data['phone'] = phone;
    data['password'] = password;
    data['profileImage'] = profileImage!.toJson();
    return data;
  }
}

