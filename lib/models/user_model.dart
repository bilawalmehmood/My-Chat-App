// ignore_for_file: public_member_api_docs, sort_constructors_first

class UserModel {
  final String uid;
  final String userName;
  final String nameToSearch;
  final String email;
  final String profileUrl;
  final bool isOnline;
  final List<String> groupId;
  UserModel({
    required this.uid,
    required this.userName,
    required this.nameToSearch,
    required this.email,
    required this.profileUrl,
    required this.isOnline,
    required this.groupId,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'uid': uid,
      'userName': userName,
      'nameToSearch': nameToSearch,
      'email': email,
      'profileUrl': profileUrl,
      'isOnline': isOnline,
      'groupId': groupId,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      uid: map['uid'] as String,
      userName: map['userName'] as String,
      nameToSearch: map['nameToSearch'] as String,
      email: map['email'] as String,
      profileUrl: map['profileUrl'] as String,
      isOnline: map['isOnline'] as bool,
      groupId: List<String>.from(
        (map['groupId'] as List<String>),
      ),
    );
  }

  UserModel copyWith({
    String? uid,
    String? userName,
    String? nameToSearch,
    String? email,
    String? profileUrl,
    bool? isOnline,
    List<String>? groupId,
  }) {
    return UserModel(
      uid: uid ?? this.uid,
      userName: userName ?? this.userName,
      nameToSearch: nameToSearch ?? this.nameToSearch,
      email: email ?? this.email,
      profileUrl: profileUrl ?? this.profileUrl,
      isOnline: isOnline ?? this.isOnline,
      groupId: groupId ?? this.groupId,
    );
  }
}
