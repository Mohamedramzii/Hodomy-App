class Facebook_User_Model {
  String? name;
  String? email;
  String? id;
  FacebookPhotoModel? facebookPhotoModel;
  Facebook_User_Model({
    this.name,
    this.email,
    this.id,
    this.facebookPhotoModel,
  });

  factory Facebook_User_Model.fromJson(Map<String,dynamic> json){
   return Facebook_User_Model(
      name: json['name'],
      email: json['email'],
      id: json['id'],
      facebookPhotoModel: FacebookPhotoModel.fromJson(json['picture']['data'])
    );
  }
}

class FacebookPhotoModel {
  String? url;
  int? height;
  int? width;
  FacebookPhotoModel({
    this.url,
    this.height,
    this.width,
  });

   factory FacebookPhotoModel.fromJson(Map<String,dynamic> json){
   
    return FacebookPhotoModel(
      url: json['url'],
      height: json['height'],
      width: json['width'] 
    );
  }
}
