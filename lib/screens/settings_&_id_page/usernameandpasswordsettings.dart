import 'package:flutter/material.dart';
class UsernameAndPassword extends StatefulWidget {
  @override

  UsernameAndPasswordState createState() =>UsernameAndPasswordState();
}

 bool isObscurePassword=true;
class UsernameAndPasswordState extends State<UsernameAndPassword> {
  bool isObscurePassword=true;
  @override

  Widget build(BuildContext context) 
  {
    return Scaffold(
      appBar: AppBar(
        title:Text("Username and Password"),
      ),
      // might add icon settings later.
      body:Container(
          padding:EdgeInsets.only(left:15,top:20,right:15),
          child:GestureDetector(
            onTap:()
            {
              FocusScope.of(context).unfocus(); // the whole context of build will be focus
            },
            child: ListView(
              children: [
                SizedBox(height:30,),
                buildTextField("Old Username", "", false),
                buildTextField("New Username", "", false),
                buildTextField("Old Password", "********", true),
                buildTextField("New Password", "********", true),
                SizedBox(height:30),
                Row(
                  mainAxisAlignment:MainAxisAlignment.spaceBetween,
                  children: [
                    OutlinedButton(
                      onPressed:(){},
                      child:Text("CANCEL",
                      style:TextStyle(fontSize:15,letterSpacing:2,color:Colors.black)),
                      style:OutlinedButton.styleFrom(
                        padding:EdgeInsets.symmetric(horizontal:50),
                        shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(20))
                      ),
                    ),
                    ElevatedButton(
                    onPressed:(){}, 
                    child: Text("SAVE",style:TextStyle(
                      fontSize:15,
                      letterSpacing:2,
                      color:Colors.white
                    )),
                    style: ElevatedButton.styleFrom(
                      primary:Colors.lightBlue,
                      padding:EdgeInsets.symmetric(horizontal:50),
                      shape:RoundedRectangleBorder(borderRadius:BorderRadius.circular(20))
                    ),
                    ),
                    
                  ],
                )
              ],
            ),
          )
      ),
    );
  }
}

Widget buildTextField(String labelText,String placeholder, bool isPasswordTextField)
{
  return Padding(
    padding:EdgeInsets.only(bottom:30),
    child:TextField(
      obscureText:isPasswordTextField ? isObscurePassword:false,
      decoration: InputDecoration(
/*
          suffixIcon:GestureDetector(onTap:(){
            setState((){
              isObscurePassword=!isObscurePassword;
            });
          },
          child:Icon(isObscurePassword ? 
          Icons.visibility :
          Icons.visibility_off)),
          */
        suffixIcon:isPasswordTextField ?
        IconButton(
          icon:Icon(Icons.remove_red_eye,color:Colors.grey),
          onPressed:(){
            /*
            setState((){
              isObscurePassword=!isObscurePassword;
            });
            */
            
          }
        ):null,
        
        contentPadding:EdgeInsets.only(bottom:5),
        labelText:labelText,
        floatingLabelBehavior:FloatingLabelBehavior.always,
        hintText:placeholder,
        hintStyle: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.bold,
          color:Colors.grey
        )
      ),
    ),
  );
}






/*Center(
                  child:Stack(
                    children: [
                      Container(
                        width:130,
                        height:130,
                        decoration:BoxDecoration(
                          border:Border.all(width:4,color:Colors.white),
                          boxShadow:[
                            BoxShadow(
                              spreadRadius:2,
                              blurRadius:10,
                              color:Colors.black.withOpacity(0.1)
                            )
                          ]
                        ),
                      )
                    ],
                  )
                ),*/