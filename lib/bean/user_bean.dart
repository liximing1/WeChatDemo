class UserBean {
  String userName; //用户名
  String nickName; //昵称
  String passWord; //密码
  var userIcon;    //用户头像
  String phoneNumber;  //手机号码
  String chatNumber;   //微信号码

  UserBean({this.userName,this.nickName,this.passWord,this.userIcon,this.phoneNumber,this.chatNumber});

  String get UserName => userName;
  String get NickName => nickName;
  String get PassWord => passWord;
  get UserIcon => userIcon;
  get PhoneNumber => phoneNumber;
  get ChatNumber => chatNumber;



}