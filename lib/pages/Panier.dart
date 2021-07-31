

import 'package:flutter/material.dart';
import 'package:testapp/pages/payment.dart';
import 'package:testapp/models/suppliment.dart';
import 'package:testapp/models/menu.dart';
import 'package:testapp/models/produit.dart';

class Listcartes{
     String image;
     String name;
     int number;
     double price;
     String restaut;
     String details;
     Listcartes(this.details,this.image,this.name,this.price,this.restaut,this.number);
  }


class Panier extends StatefulWidget {
     List<Menu>  listcarts=[];

   Panier(List<Menu> listcarts){
    this.listcarts=listcarts;

  }
    

  @override
  _PanierState createState() => _PanierState(listcarts);
}

class _PanierState extends State<Panier> {

  late List<Supplement> suppliments;
  late List<Produit> produits;

   _PanierState(List<Menu> listcarts){


     produits.add(prod1);
     produits.add(prod2);
     
     suppliments.add(supp1);
     suppliments.add(supp2);


     this.listcarts=listcarts;
    this.listcarts.add(cart2);
    this.listcarts.add(cart3);
    this.listcarts.add(cart4);
  }


  late Produit prod1= Produit(12.12, "Andalouse");
  late Produit prod2= Produit(12.12, "Biggie");

  late Supplement supp1= Supplement(produits,"Sauce",true);
  late Supplement supp2= Supplement(produits,"Autre",true);

  late Menu cart1 =new Menu("(sauce noire)", "images/logo.png", "large chiken tacos",  35.11, "kfc",2,suppliments);
  late Menu cart2=new Menu("(sauce noire)", "images/logo.png", "Chiken tacos", 35.11, "kfc",2,suppliments);
  late Menu cart3 =new Menu("(sauce noire)", "images/logo.png", "Nugget tacos", 35.11, "kfc",2,suppliments);
  late Menu cart4 =new Menu("(sauce noire)", "images/logo.png", "Minced meat tacos", 35.11, "kfc",2,suppliments);

  // all i'll have to deal with :
  late List<Menu>  listcarts;
     
  @override
  Widget build(BuildContext context) {
        double Sheight = MediaQuery.of(context).size.height;
       double Swidth = MediaQuery.of(context).size.width;
         print("the list length is : ${listcarts.length}");
    return Scaffold(
     
      body:Container(
      child: Container( margin:EdgeInsets.fromLTRB(0, 50, 0, 0) ,
        child: Column(
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [ 
            Container(width:Swidth/3,
              child: Row(
                children: [
                  MaterialButton(onPressed: (){
                  }, child: Icon(Icons.arrow_back,)),
               Text("Cart",style:TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.bold,fontSize:Swidth/18))  ,

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

            //the cards 
            Container(alignment: Alignment.center,
                  width:(6*MediaQuery.of(context).size.width/7),
                   height: ((Sheight/2)+(Sheight/6)+40), 
              child: ListView.builder(padding: EdgeInsets.all(10),
                itemCount: listcarts.length,
                itemBuilder: (context,i){
                  //the card shape
            return Container(alignment: Alignment.center,margin:EdgeInsets.only(bottom: 40),height: 145,width: (2*MediaQuery.of(context).size.width/4), decoration:  BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20),boxShadow:[BoxShadow(
              color:Color.fromRGBO(0, 0, 0, 0.4),spreadRadius: 2,blurRadius: 10,offset: Offset(1, 1)
            )]), child:Row( children: [
                Column(children: [Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),width:(2*MediaQuery.of(context).size.width/8),margin: EdgeInsets.all(10),child: Image(image: AssetImage("assets/images/position_cover.png"),height: 110,width: 110,fit: BoxFit.fill,))],),
                Column(mainAxisAlignment: MainAxisAlignment.center,children: [
                  Container(width:2*Swidth/5,height:30  ,child: Row(mainAxisSize: MainAxisSize.max,mainAxisAlignment: MainAxisAlignment.end,children:[
                    Container(child: IconButton(color: Colors.red,icon: Icon(Icons.cancel_outlined), onPressed: (){setState(() {
                      for(var j =i;j<listcarts.length-1;j++){
                         listcarts[j]=listcarts[j+1];
                      }
                      listcarts.removeAt(listcarts.length-1);
               print("the list length is after deleting : ${listcarts.length}");

                    }); }))
                  ]),), 
                  Container(
                    child: Row(children: [
                        Container(alignment:Alignment.centerLeft,child: Text("${listcarts[i].name}",style: TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.bold ))),
                        Container(margin: EdgeInsets.only(left:10),child: Text("${listcarts[i].details}",style: TextStyle(fontFamily: 'Roboto' , color: Colors.black.withOpacity(0.5),fontSize: Swidth/40)))
                        ],),
                   ),
                Container(width:Swidth/3,
                    child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,children: [
                        Container(margin: EdgeInsets.only(left:20,top:10,bottom:10),child: Text("${listcarts[i].price*listcarts[i].number} MAD",style: TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.bold ),)),
                        Container(margin:EdgeInsets.only() ,child: Text("${listcarts[i].restaut}",style: TextStyle(fontFamily: 'Roboto',fontWeight: FontWeight.bold )))
                        ],),
                  ),
                  Container(
                    child: Row(children: [
                      Container(margin: EdgeInsets.only(left:5,bottom: 2),width: 40,height:40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: Colors.blueGrey ) ,child: IconButton(color: Colors.blue,icon: Icon(Icons.add), onPressed: (){setState((){listcarts[i].number+=1; 
                               });})),
                      Container(margin: EdgeInsets.only(left:5,bottom: 2),width: 60,height:40,padding: EdgeInsets.only(left:25,top: 10),decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: Colors.blueGrey ) ,child:Text("${listcarts[i].number}",style: TextStyle(color: Colors.white,fontWeight:FontWeight.bold,fontFamily: 'Roboto'),)),
                      Container(margin: EdgeInsets.only(left:5,bottom: 2),width: 40,height:40,decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: Colors.blueGrey ) ,child: IconButton(color: Colors.blue,icon: Icon(Icons.remove), onPressed: (){setState((){listcarts[i].number-=1;});}))
                    ],),
                  )
                ],)
            ],));
              }),
            ),


            //down button
             Container(margin: EdgeInsets.only(top:10),
              height:70,
              padding: EdgeInsets.only(top:(30),right:0),width:(MediaQuery.of(context).size.width/2+MediaQuery.of(context).size.width/3),
              child:ElevatedButton(style:ElevatedButton.styleFrom(elevation:5,shadowColor: Colors.black ,primary: Colors.green,shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20))
              ),onPressed: (){
                    print("the list length is while navigating : ${listcarts.length}");

                   Navigator.of(context).push(MaterialPageRoute(builder: (context){
                     return Payment(listCart: listcarts); 
                   }));
               }, child: Container(width:double.infinity,
                 child: Row(mainAxisAlignment: MainAxisAlignment.center,children: [
                   Container(child: Icon(Icons.verified,) ,margin: EdgeInsets.only(right:20),),
                   Text("Validate",style: TextStyle(fontSize: 25,),)
                 ],mainAxisSize: MainAxisSize.min,),
               ))
            )
          ]
        ),
      )
      )
    );;
  }
}

