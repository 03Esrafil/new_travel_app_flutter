import 'dart:convert';

import 'package:http/http.dart';

import '../Models/models.dart';




class dataServices {
  bool isLoading = true;
  List<Recipimodels> recipe= <Recipimodels>[];
  getRecipe()async{
    String url ="https://api.edamam.com/search?q=apple&app_id=4809ad3c&app_key=55b288c098f32c8fda1f29d9e3b84e5e";
    Response responce= await get(Uri.parse(url));
    try{
      if(responce.statusCode==200){
        Map data=jsonDecode(responce.body);
          data["hits"].forEach((element) {
          Recipimodels recipimodels = Recipimodels();
          recipimodels = Recipimodels.fromMap(element["recipe"]);
          recipe.add(recipimodels);
        });
        return recipe;
      }
      else{
            return <Recipimodels>[];
      }



    }catch(e){
      print(e);
      return <Recipimodels>[];
    }



      // recipe.forEach((element) {
      //   print(element.appimgeUrl);
      // });
    }
  }


