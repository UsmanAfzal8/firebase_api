// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class AppUser {
  String name;
  String email;
  String userName;
  String uid;
  String imageUrl;
  AppUser({
    required this.name,
    required this.email,
    required this.userName,
    required this.uid,
    required this.imageUrl,
  });
  
  



 

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
     'fields': {
          'user_id': {'stringValue': uid},
          'user_name': {'stringValue': userName},
          'name': {'stringValue': name},
          'email': {'stringValue': email},
          'image_url': {'stringValue': imageUrl},
        }
    };
  }

  factory AppUser.fromMap(Map<String, dynamic> map) {
    return AppUser(
      name: map['name'] ['stringValue'] as String,
      email: map['email'] ['stringValue'] as String,
      userName: map['user_name']['stringValue'] as String,
      uid: map['user_id'] ['stringValue'] as String,
      imageUrl: map['image_url']['stringValue'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory AppUser.fromJson(String source) => AppUser.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'AppUser(name: $name, email: $email, userName: $userName, uid: $uid, imageUrl: $imageUrl)';
  }

  @override
  bool operator ==(covariant AppUser other) {
    if (identical(this, other)) return true;
  
    return 
      other.name == name &&
      other.email == email &&
      other.userName == userName &&
      other.uid == uid &&
      other.imageUrl == imageUrl;
  }

  @override
  int get hashCode {
    return name.hashCode ^
      email.hashCode ^
      userName.hashCode ^
      uid.hashCode ^
      imageUrl.hashCode;
  }
}
