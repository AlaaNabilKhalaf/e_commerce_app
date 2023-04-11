class UserModel{
  String? name;
  String? email;
  String? phone;
  String? image;
  String? token;
   UserModel(
       this.name,
       this.email,
       this.phone,
       this.image,
       this.token);

   // named constractor
   UserModel.fromJson(
       {required Map<String, dynamic> date}
       ){
     //Refactoring
     name = date['name'];
     email = date['email'];
     phone = date['phone'];
     image = date['image'];
     token = date['token'];


   }

   // to map
Map<String, dynamic> toMap(){
     return {
       'name' : name,
       'phone' : phone,
       'email' : email,
       'image' : image,
       'token' : token,
     };
}




}