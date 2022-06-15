class UserMode{
  String user_id=' ';
  String user_name=' ';
  String email=' ';
  String password=' ';
  String phone=' ';

  UserMode(this.user_id,this.email,this.user_name,this.password,this.phone);

  Map<String, dynamic> toMap(){
    var map =<String,dynamic>{
      'user_id': user_id,
      'user_name': user_name,
      'email': email,
      'phone': phone,
      'password': password
    };
    return map;
  }
  UserMode.fromMap(Map<String,dynamic> map){
    user_id =map['user_id'];
    user_name =map['user_name'];
    email =map['email'];
    phone =map['phone'];
    password =map['password'];
  }
}