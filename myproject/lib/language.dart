import 'package:flutter/material.dart';
import 'package:translator/translator.dart';
class homepage extends StatefulWidget {
  const homepage({super.key});

  @override
  State<homepage> createState() => _homepageState();
}

class _homepageState extends State<homepage> {

  var lang = ['Hindi', 'English', 'Arabic'];
  var originlang = "From";
  var destinationlang = "To";
  var output = " ";
  TextEditingController langController = TextEditingController();

  void translate(String src, String dest, String input) async{
    GoogleTranslator translator = new GoogleTranslator();
    var translation = await translator.translate(input, from: src, to: dest);
    setState(() {
      output = translation.text.toString();
    });

  }

  String getLang(String lang){
    if (lang == "English"){
      return "en";
    }
    else if (lang == "Hindi"){
      return "hi";
    }
    else if(lang == "Arabic"){
      return "ar";
    }
    return "";
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text("Translator"),),
              backgroundColor: Colors.lightBlueAccent,
      body:
      Center(
        child: SingleChildScrollView(
          child: Column(
            children: [

              Row(
                
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right: 150.0),
                    child: DropdownButton(
                      hint: Text(originlang,style: TextStyle(color: Colors.white, fontSize: 30),),
                    items: lang.map((String dropDownStringItem){
                      return DropdownMenuItem(child : Text(dropDownStringItem, style: TextStyle(color: Colors.black),),
                        value: dropDownStringItem,);
                        }).toList(),
                      onChanged: (String? value){
                        setState(() {
                          originlang = value!;
                        });
                      },

                    ),
                  ),



              DropdownButton(
                hint: Text(destinationlang,style: TextStyle(color: Colors.white, fontSize: 30),),
                items: lang.map((String dropDownStringItem){
                  return DropdownMenuItem(
                    child : Text(dropDownStringItem, style: TextStyle(color: Colors.black),),
                    value: dropDownStringItem,);
                }).toList(),
                onChanged: (String? value){
                  setState(() {
                    destinationlang = value!;
                  });
                },

              ),
                ],

              ),
              SizedBox(height: 40,),
              Padding(padding: EdgeInsets.all(8),
                child: TextFormField(
                  decoration: InputDecoration(
                    labelText: ("Please enter your text .."),
                    labelStyle: TextStyle(fontSize: 25),
                  ),

                  controller: langController,
                  validator: (value){
                    if(value == null || value.isEmpty){
                      return "Please enter text to translate";
                    }
                    return null;
                  },

                ),),

              SizedBox(height: 40,),
              Padding(padding: EdgeInsets.all(8),
                child: ElevatedButton(onPressed: (){
                  translate(getLang(originlang),getLang(destinationlang),langController.text.toString());
                },
                  child: Text("Translate", style: TextStyle(fontSize: 20, color: Colors.black),), ),),

              SizedBox(height: 40,),
              Text(
                "\n$output",
                style : TextStyle(
                  color : Colors.black,

                  fontSize: 40),
                )





            ],
          ),
        ),
      )
    );
  }
}
