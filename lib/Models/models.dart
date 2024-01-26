class Recipimodels{
  late String applabel;
  late String appimgeUrl;
  late double appcalories;
  late String appUrl;


  Recipimodels({this.applabel="label", this.appimgeUrl="image", this.appcalories=0.000, this.appUrl="url"});
  factory Recipimodels.fromMap(Map recipe){
    return Recipimodels(
        applabel : recipe["label"],
        appcalories : recipe["calories"],
        appimgeUrl: recipe["image"],
        appUrl: recipe["url"]


    );
  }
}