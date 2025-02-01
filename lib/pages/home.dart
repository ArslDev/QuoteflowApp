import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart'as http;

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  String? quote, authorName;
  bool bussniess=true,amazing=false,fitness=false,happiness=false,love=false;

  Future<void> fetchquote(String category)async{
    final response= await http.get(Uri.parse('https://api.api-ninjas.com/v1/quotes?'),
        headers: {
      'Content-Type':'application/json',
      'X-Api-Key' : 'pJCYZ8lThck/CMBgcTzP9g==QP69CnF615tXXMi8'
        });
    if(response.statusCode ==200)
      {
        List<dynamic> jsonData= jsonDecode(response.body);
        if(jsonData.isNotEmpty){
          Map< String, dynamic> quotedata=jsonData[0];
          quote= quotedata["quote"];
          authorName = quotedata["author"];
          setState(() {

          });
        }
      }
  }

  @override
  void initState() {
   fetchquote("business");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          children: [
            Image.asset('assets/wood.png', height: MediaQuery.of(context).size.height, width: MediaQuery.of(context).size.width, fit: BoxFit.cover,),
            Container(
              margin: EdgeInsets.only(top: 50.0),
                child: Column(
              children: [
                Center(child: Text('QuoteFlow', style: GoogleFonts.poppins(color: Colors.white,fontSize: 30.0, fontWeight: FontWeight.bold),)),
                SizedBox(height: 50.0,),
                Container(
                  height: 30.0,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    children: [
                      bussniess?Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        margin: EdgeInsets.only(left: 20.0),
                        decoration: BoxDecoration(
                          color: Colors.yellow,
                          borderRadius: BorderRadius.circular(20)
                        ),
                        child: Text('Busniess',style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 20.0),),
                      ): GestureDetector(
                        onTap: ()async{
                          bussniess=true;
                          amazing=false;
                          fitness=false;
                          happiness=false;
                          love=false;
                          await fetchquote("business");
                          setState(() {

                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          margin: EdgeInsets.only(left: 20.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20)
                          ),
                          child: Text('Busniess',style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 20.0),),
                        ),
                      ),
                      amazing?Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        margin: EdgeInsets.only(left: 20.0),
                        decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Text('Amazing',style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 20.0),),
                      ): GestureDetector(
                        onTap: ()async{
                          bussniess=false;
                          amazing=true;
                          fitness=false;
                          happiness=false;
                          love=false;
                        await  fetchquote("amazing");
                          setState(() {

                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          margin: EdgeInsets.only(left: 20.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Text('Amazing',style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 20.0),),
                        ),
                      ),
                      fitness?Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        margin: EdgeInsets.only(left: 20.0),
                        decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Text('Fitness',style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 20.0),),
                      ): GestureDetector(
                        onTap: ()async{
                          bussniess=false;
                          amazing=false;
                          fitness=true;
                          happiness=false;
                          love=false;
                         await fetchquote("fitness");
                          setState(() {

                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          margin: EdgeInsets.only(left: 20.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Text('Fitness',style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 20.0),),
                        ),
                      ),
                      happiness?Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        margin: EdgeInsets.only(left: 20.0),
                        decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Text('Happiness',style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 20.0),),
                      ): GestureDetector(
                        onTap: ()async{
                          bussniess=false;
                          amazing=false;
                          fitness=false;
                          happiness=true;
                          love=false;
                          await fetchquote("happiness");
                          setState(() {

                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          margin: EdgeInsets.only(left: 20.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Text('Happiness',style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 20.0),),
                        ),
                      ),
                      love?Container(
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        margin: EdgeInsets.only(left: 20.0),
                        decoration: BoxDecoration(
                            color: Colors.yellow,
                            borderRadius: BorderRadius.circular(20)
                        ),
                        child: Text('Love',style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 20.0),),
                      ): GestureDetector(
                        onTap: ()async {
                          bussniess=false;
                          amazing=false;
                          fitness=false;
                          happiness=false;
                          love=true;
                          await fetchquote("love");
                          setState(() {

                          });
                        },

                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          margin: EdgeInsets.only(left: 20.0),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(20)
                          ),
                          child: Text('Love',style: GoogleFonts.poppins(color: Colors.black,fontWeight: FontWeight.bold, fontSize: 20.0),),
                        ),
                      ),
                    ],

                  ),
                ),
                SizedBox(height: 50.0),
                Container(
                  padding: EdgeInsets.only(left: 20.0, right: 20.0),
                  margin: EdgeInsets.only(right: 20.0, left: 20.0),
                  height: MediaQuery.of(context).size.height/2,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                      color: Colors.black45
                  ),
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(quote ?? "Loading quote...",textAlign:TextAlign.center,style: GoogleFonts.indieFlower(color: Colors.white,fontWeight: FontWeight.w700, fontSize: 20.0),),
                     SizedBox(height: 60.0,),
                     Text(authorName != null ? "- $authorName" : "- Unknown",textAlign:TextAlign.center,style: GoogleFonts.poppins(color: Colors.white,fontWeight: FontWeight.w500, fontSize: 17.0),)

                   ],
                 )
                ),
              ],
            ))

          ],
        ),
      ),
    );
  }
}
