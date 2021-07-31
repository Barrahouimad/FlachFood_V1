import 'package:flutter/material.dart';
import 'package:testapp/pages/Panier.dart';
import 'package:testapp/pages/payment.dart';
import 'package:testapp/models/suppliment.dart';
import 'package:testapp/models/menu.dart';
import 'package:testapp/models/produit.dart';

class Track extends StatefulWidget {
  Track({Key? key,required this.value,required this.listcarts}) : super(key: key);
  double value;
  List<Menu> listcarts;
  @override
  _TrackState createState() => _TrackState(value,listcarts);
}

class _TrackState extends State<Track> {

  _TrackState(double value,List<Menu> listCart){
    this.values=value;
    this.listCart=listCart;
  }
  late List<Menu> listCart;

  double values=1.0;
  @override
  Widget build(BuildContext context) {
           double Sheight = MediaQuery.of(context).size.height;
           double Swidth = MediaQuery.of(context).size.width;

    return Scaffold(
       body: Container(height:Sheight,width: double.infinity,margin: EdgeInsets.only(top:48),
         child: Column(mainAxisSize: MainAxisSize.max,
           children: [

           Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [ 
              Container(width:Swidth/2,
                child: Row(
                  children: [
                    MaterialButton(onPressed: (){
                        Navigator.of(context).push(MaterialPageRoute(builder: (context){
                     return   Payment(listCart: listCart);
                   }));
                    }, child: Icon(Icons.arrow_back,)),
                 Text("Track your order",style:TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.bold,fontSize:Swidth/27))  ,

                  ],
                ),
              ) ,
              //les deux top boutons
              Row(
                children: [
                  Container(width:(2*Swidth/10),
                    child: MaterialButton(shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topLeft: Radius.circular(20),bottomLeft:Radius.circular(20))), color: Colors.grey,onPressed: (){},elevation: 12,child: Row(children: [
                      Icon(Icons.local_grocery_store,size: (Swidth/20),color: Colors.white,),
                      Text("Cart",style: TextStyle(fontFamily: 'Roboto',color: Colors.white,fontSize: Swidth/31))
                    ],),),
                  ),
                   Container(width:(3*Swidth/13),
                    child: MaterialButton(shape: RoundedRectangleBorder(borderRadius: BorderRadius.only(topRight: Radius.circular(20),bottomRight: Radius.circular(20) )),color: Colors.red,onPressed: (){},child: Row(children: [
                Icon(Icons.person,size: (Swidth/20),color: Colors.white,),
                Text("Profile",style: TextStyle(fontFamily: 'Roboto',color: Colors.white,fontSize: Swidth/31),)
              ],),),
                  )
                ],
              ),
                 

              ],),


              Divider(color:Colors.black,thickness:2,endIndent: 15,indent: 15,),



            Container(margin: EdgeInsets.all(20),child:Text("We delivre right to your seat",style:TextStyle(fontSize: 25,fontWeight:FontWeight.w500,fontFamily: 'Roboto'))),

             Center(
              child:TweenAnimationBuilder(
                    tween: Tween(begin: 0.0, end: 1.0),
                    duration: Duration(seconds: 4),
                    builder: (context, value, child) {
                      // percentage to show in Center Text
                      int percentage = (values* 100).ceil();
                      return Container(
                        width: 2*Swidth/3,
                        height: Sheight/2,
                        child: Stack(
                          children: [
                            ShaderMask(
                              shaderCallback: (rect) {
                                return SweepGradient(
                                        startAngle: 0.0,
                                        endAngle: (values )*6,
                                        stops: [0.0,1.0],
                                         // value from Tween Animation Builder
                                        // 0.0 , 0.5 , 0.5 , 1.0
                                        center: Alignment.center,
                                        colors: [Colors.blue, Colors.transparent])
                                    .createShader(rect);
                              },
                              child: Container(
                                width: 2*Swidth/3,
                                 height: Sheight/2,
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle, color: Colors.white),
                              ),
                            ),
                            Center(
                              child: Container(
                                width: 2*Swidth/3- 60,
                                height: Sheight/2- 60,
                                decoration: BoxDecoration(
                                    color: Colors.white, shape: BoxShape.circle),
                                child: Center(
                                    child: Text(
                                  "$percentage %",
                                  style: TextStyle(
                                      fontSize: 25,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.bold),
                                )),
                              ),
                            )
                          ],
                        ),
                      );
                    })
      ),
          Container(child:Row(mainAxisAlignment: MainAxisAlignment.spaceAround,children: [
            Container(width:2*Swidth/8,height:Sheight/10,child: IconButton(icon: Icon(Icons.thumb_up,color: Colors.green,size: Swidth/8,),onPressed: (){},),decoration: BoxDecoration(shape:BoxShape.circle,color: Colors.grey ),),
            Container(width:2*Swidth/8,height:Sheight/10,child: IconButton(icon: Icon(Icons.thumb_down,color: Colors.red,size: Swidth/8),onPressed: (){},),decoration: BoxDecoration(shape:BoxShape.circle,color: Colors.grey ))
          ],))
          
          
          
           ],
         ),
       ),
    );
  }
}