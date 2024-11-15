/// id : 1
/// name : "Ibrahim Al-Akdar"
/// url : "https://backup.qurango.net/radio/ibrahim_alakdar"
/// recent_date : "2019-02-02 13:40:34"

class RadioModel {
  RadioModel({
      this.id, 
      this.name, 
      this.url, 
      this.recentDate,});

  RadioModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    url = json['url'];
    recentDate = json['recent_date'];
  }
  int? id;
  String? name;
  String? url;
  String? recentDate;



}