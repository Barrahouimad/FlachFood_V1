import 'package:flutter/material.dart';
import 'package:testapp/pages/Panier.dart';
import 'package:testapp/pages/track_folder.dart';
import 'package:testapp/models/suppliment.dart';
import 'package:testapp/models/menu.dart';
import 'package:testapp/models/produit.dart';

class Payment extends StatelessWidget {
        const Payment({Key? key, required this.listCart}) : super(key: key);
        final List<Menu> listCart;
      

  @override
  Widget build(BuildContext context) {
      double somme=0;
    for(var i=0;i<listCart.length;i++){
       somme+=listCart[i].price;
    }
           double Sheight = MediaQuery.of(context).size.height;
           double Swidth = MediaQuery.of(context).size.width;

    return Container(
      child: Scaffold(body:Container(height:Sheight,width: double.infinity,margin: EdgeInsets.only(top:48),
       child:Column(
          children: [
               Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [ 
            Container(width:Swidth/2,
              child: Row(
                children: [
                  MaterialButton(onPressed: (){

                  Navigator.of(context).push(MaterialPageRoute(builder: (context){
                     return   Panier(listCart) ; 
                   }));}

                  
                  , child: Icon(Icons.arrow_back,)),
               Text("Payment",style:TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.bold,fontSize:Swidth/20))  ,

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


               //second

               Container(
                 child:Row(children:[
                   Container(margin:EdgeInsets.only(left: 27,top: 3,bottom: 3,right: 5),child: Text("Your order",style: TextStyle(fontSize: 31,decoration:TextDecoration.underline ,fontFamily: 'Roboto',fontWeight: FontWeight.w500),)),
                   Text(": From ${listCart[0].restaut} ",style: TextStyle(fontSize: 20,fontFamily: 'Raleway',fontWeight: FontWeight.w500))
                 ])
               ),
             Container( height: (3*MediaQuery.of(context).size.height/5),width: (3*MediaQuery.of(context).size.width/5),
                 child:ListView.builder(itemCount: listCart.length,itemBuilder: (context,i){
                   return Container(child: Row(
                     children: [
                       Expanded(flex:2,child: Text("* ${listCart[i].number}x",style: TextStyle(fontSize: 17,fontFamily: 'Roboto',fontWeight: FontWeight.bold),)),
                       Expanded(flex:3,child: Text("${listCart[i].name}",style: TextStyle(fontSize: 17,fontFamily: 'Roboto',fontWeight: FontWeight.w400),)),
                       Expanded(flex:3,child: Container(alignment: Alignment.centerRight,child: Text("${listCart[i].price} MAD",style: TextStyle(color: Colors.green,fontSize: 15),))),
                     ],
                   ),);
                 },
                 
                 )
               ),
                Divider(color:Colors.black,thickness:2,endIndent: 15,indent: 15,),
                Container(alignment:Alignment.center,margin:EdgeInsets.only(right:15),child:Row(mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Total: ",style:TextStyle(fontWeight:FontWeight.bold,fontSize: 15 )),
                    Text("${somme} ",style:TextStyle(fontWeight:FontWeight.bold,fontSize: 15 ,color: Colors.green)),
                    
                  ],
                )),
                Divider(color:Colors.black,thickness:2,endIndent: 15,indent: 15,),
                Container(margin: EdgeInsets.symmetric(vertical: 10),child:Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,children: [
                  MaterialButton(minWidth: 150,color: Colors.white,elevation: 10,shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)) ,onPressed: (){   Navigator.of(context).push(MaterialPageRoute(builder: (context){
                     return Track(value: 0.5,listcarts: listCart,); 
                   }));},child: Row(children:[
                    Icon(Icons.payments),
                    Text("By cash")
                  ]),),
                    MaterialButton(minWidth: 150,shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),onPressed: (){ },elevation: 10,child: Row(mainAxisAlignment:MainAxisAlignment.spaceBetween ,children:[
                    Icon(Icons.credit_card,color: Colors.white,),
                    Text("By card",style:TextStyle(color: Colors.white))
                  ]),color: Colors.green,)
                ],))

          ],
        ))   
      ,),
    );
  }
}