/**********************
Author: JM RETA
Project: Biopotencial Amplifier Case
Laboratorio de Prototipado Electrónico y 3D - FIUNER
02-2017

**********************/
//use <libs/nuts_and_bolts_v1.95.scad>;

$fn= 100;

/*Sphere  dimensions*/
X = 120;
Y = 75;
Z = 50;

sph_X = 100;
sph_Y = 80;
sph_Z = 60;
/*Dimension*/

X_i = 125;
Y_i = 85;//75
Z_i = 45;

/*Lateral Parameters*/

R_edges_v = 30; /*round radius for vertical edges*/
R_edges_h = 30; /*round radius for horizontal edges*/
thickness = 3;
/***Internal Hole***/

Xih = 120;
Yih = Y_i+R_edges_v;
Zih = 30;

/*******Grip Pattern*******/

G_DEEP = 0.3;
G_LONG = 80;
G_THICK = 1;
G_PITCH = 0.3;

/**************************/





/*Front panel*/
Xf = 120;
Yf = thickness-1;
Zf = 27;
R_border = 5;

border_thickness = 2.5;


/******Cuts**********/
Z_sph_cut =45;
Top_Part_Cut = R_edges_h/2-Z_i/2-3;
Bottom_Part_Cut = -R_edges_h/2-Z_i/2+3;
CUT = 1;
DRAW = 0;

/******Nuts Cuts*/
X_Border_Hole = 4.5;
Y_Border_Hole = 0;
Body_Nut_Heigth = 18;

/******Models***********/

sphere_top = 1;
boards_simulate = 0;
nuts_bolts=1;

GRIP_AND_CUTS = 1;

/*************************/
if(boards_simulate==1)
{
    color([0.3,0.8,0.5])
    {
        rotate([0,0,180])
        {
            translate([0,0,-9]) import("board.stl");
            translate([0,33,3])import("daugther_board.stl");
        }
    }
}

module grip_cylindrical (x_size, y_size, deep, pitch)
{
 
    //for ( i = [0 : pitch : (y_size-deep)/pitch] )
    for ( i = [0 : pitch : y_size] )
    {
        rotate( [90, 0, 0])
        {
            translate([0, 2*deep*20*i, 0]) minkowski()
            {
                cylinder(r = deep,h=x_size);
            resize(newsize=[deep,3*deep,10*deep])sphere(r=deep);
            }
        }
    }
}

module lateral(xl,yl,zl,r_edge_v,r_edge_h)
{
       minkowski()
       {
            cube([xl,yl,zl/2],center = true);
            resize(newsize=[r_edge_v,r_edge_h,14]) sphere(r_edge_v);
        }
}
module lateral_border(xl,yl,z,r_edge_v,r_edge_h)
{
difference()
{
lateral(xl,yl,z,r_edge_v,r_edge_h);
scale([0.95,0.95,0.95]) 
{
 lateral(xl,yl,z,r_edge_v,r_edge_h);
}
/*solids for substraction*/

 translate([0,0,Z_i/2])cube([2*X,2*Y,Z_i],center=true);
 translate([0,0,-Z_i/2-border_thickness])cube([2*X,2*Y,Z_i],center=true);
 }

/******/
 }
 module top_part()
 {
union()
{
        difference()
  //intersection()   
        {  
          union()
          {
//                hull()
//              {  
              lateral(X_i, Y_i, Z_i,R_edges_v,R_edges_h);
                if(sphere_top==1)
                {
                  difference()
                    {
                        resize(newsize=[sph_X,sph_Y,sph_Z]) sphere(r=20);
                /*sphere cut*/
                        translate ([0,0,Z_sph_cut])cube([X,Y,Z], center = true);  
                    }
 //               }
            }
            }
                //translate([0,0,0])
                translate([0,0,Top_Part_Cut ])cube([2*X_i,2*Y_i,Z_i],center=true);  
                front_part(CUT);
                back_part(CUT);
        }
    }
}
module body_part()
{
    difference()
    {
        intersection()
        {
            difference()
            {
               lateral(X_i, Y_i, Z_i,R_edges_v,R_edges_h);
               translate([0,0,-Top_Part_Cut+1.7])          lateral_border(X_i, Y_i, Z_i,R_edges_v,R_edges_h);
               translate([0,0,Bottom_Part_Cut/2+7.6])lateral_border(X_i, Y_i, Z_i,R_edges_v,R_edges_h);
               translate([0,0,-1]) cube([Xih,Yih+20,Zih],center=true);
//               #translate([0,0,-1]) cube([X_i, Y_i+R_edges_v, Z_i],center=true);
            }
      translate([0,0,Top_Part_Cut])cube([2*X_i,2*Y_i,Z_i],center=true);
        }
        translate([0,0,Bottom_Part_Cut])cube([2*X_i,2*Y_i,Z_i],center=true); 
        
    translate ([-X_i/2-X_Border_Hole, -Y_i/2-Y_Border_Hole, -20]) cylinder(r=3,Body_Nut_Heigth,$fn=6);
    translate ([-X_i/2-X_Border_Hole, Y_i/2-Y_Border_Hole, -20]) cylinder(r=3,Body_Nut_Heigth,$fn=6);
    translate ([X_i/2-X_Border_Hole+8, -Y_i/2-Y_Border_Hole, -20]) cylinder(r=3,Body_Nut_Heigth,$fn=6);
    translate ([X_i/2-X_Border_Hole+8, Y_i/2-Y_Border_Hole, -20]) cylinder(r=3,Body_Nut_Heigth,$fn=6);
        
    if(GRIP_AND_CUTS == 1)
    {
            front_part(CUT);
            back_part(CUT);
           translate([-X_i/2-15,G_LONG/2,-5.5])grip_cylindrical (G_LONG, G_THICK, G_DEEP, G_PITCH);
            translate([X_i/2+15,G_LONG/2,-5.5])grip_cylindrical (G_LONG, G_THICK, G_DEEP, G_PITCH);
    }
   }
}
module bottom_part()
{
    X_Board_Hole1 = 57;
    Y_Board_Hole1 = 35;
    
    X_Board_Hole2 = -38;
    Y_Board_Hole2 = 35;
    
    X_Board_Hole3 = -50;
    Y_Board_Hole3 = -14;
    
    X_Board_Hole4 = 50;
    Y_Board_Hole4 = -14;
    
    Z_Board_Hole = -16;
    
    Board_Nut_Heigth = 3.5;
    
 difference()
    {
union()
    {
        intersection()
        {
                lateral(X_i, Y_i, Z_i,R_edges_v,R_edges_h);
            translate([0,0,Bottom_Part_Cut-1])cube([2*X_i,2*Y_i,Z_i],center=true);
        }    
    }
    /****Front and Back panels cuts************/
    
    front_part(CUT);
    back_part(CUT);
    
    
    /****Cuts screws side by side***/
      translate([0,0,-Z_i+8])top_part();
    translate ([-X_i/2-X_Border_Hole, -Y_i/2-Y_Border_Hole, -20]) cylinder(r=1.5,Body_Nut_Heigth);
    translate ([-X_i/2-X_Border_Hole, Y_i/2-Y_Border_Hole, -20]) cylinder(r=1.5,Body_Nut_Heigth);
    translate ([X_i/2-X_Border_Hole+8, -Y_i/2-Y_Border_Hole, -20]) cylinder(r=1.5,Body_Nut_Heigth);
    translate ([X_i/2-X_Border_Hole+8, Y_i/2-Y_Border_Hole, -20]) cylinder(r=1.5,Body_Nut_Heigth);
    
    /***Cuts screws heads**/
    translate([0,0,-Z_i+8])top_part();
    translate ([-X_i/2-X_Border_Hole, -Y_i/2-Y_Border_Hole, -20]) cylinder(r=3,h=Body_Nut_Heigth/3.5);
    translate ([-X_i/2-X_Border_Hole, Y_i/2-Y_Border_Hole, -20]) cylinder(r=3,h=Body_Nut_Heigth/3.5);
    translate ([X_i/2-X_Border_Hole+8, -Y_i/2-Y_Border_Hole, -20]) cylinder(r=3,h=Body_Nut_Heigth/3.5);
    translate ([X_i/2-X_Border_Hole+8, Y_i/2-Y_Border_Hole, -20]) cylinder(r=3,h=Body_Nut_Heigth/3.5);

        /*****Board Nuts Cuts******/

     translate ([X_Board_Hole1, Y_Board_Hole1, Z_Board_Hole]) cylinder(r=3,Board_Nut_Heigth,$fn=6);
     translate ([X_Board_Hole2, Y_Board_Hole2, Z_Board_Hole]) cylinder(r=3,Board_Nut_Heigth,$fn=6);
     translate ([X_Board_Hole3, Y_Board_Hole3, Z_Board_Hole]) cylinder(r=3,Board_Nut_Heigth,$fn=6);
     translate ([X_Board_Hole4, Y_Board_Hole4, Z_Board_Hole]) cylinder(r=3,Board_Nut_Heigth,$fn=6);
    }
}

module front_part(for_cut)
{  
    X_Hole1 = 44.8;
    X_Hole2 = 57;
    Y_Hole1 = 5.5;
     Y_Hole2 = -6.5;
    Z_Hole1 = 50;
    Z_Hole2 = 50;
    
    X_cover_led = 55;
    Y_cover_led = -3.5;
    Z_cover_led = 47.5;
    
   if(for_cut ==1)
         {
           translate ([0,-(Yih/2-Yf-R_border/2-1.7),0])
             minkowski(){
            cube([Xf,Yf-1.5,Zf-R_border+2],center = true);
            rotate([90,0,0])cylinder(r=R_border/2,Yf+1);
            }
         }else
         {
           difference(){
               union(){
           translate ([0,-(Yih/2-Yf-R_border/2-2),0])
           minkowski(){
           cube([Xf,Yf-1.9,Zf-R_border+1],center = true);
           rotate([90,0,0])cylinder(r=R_border/2,Yf+1);
         }
                    /*led cover*/    
           difference()
           {
                rotate([90,0,0]) translate([X_cover_led,Y_cover_led,Z_cover_led]) cylinder(r=5,h=4);
                rotate([90,0,0]) translate([X_cover_led,  Y_cover_led,Z_cover_led]) cylinder(r=2.6,h=5);
           }
       }
       
       #rotate([90,0,0]) translate([X_cover_led,  Y_cover_led,Z_cover_led-1]) cylinder(r=3.5,h=5);
       
           difference(){
           rotate([90,0,0]) translate([X_cover_led,Y_cover_led,Z_cover_led+5.5]) cylinder(r=3.5,h=4);
           rotate([90,0,0]) translate([X_cover_led,  Y_cover_led,Z_cover_led+5.5]) cylinder(r=2.7,h=4);
           }
           
        for(i=[0:7]) {
        rotate([90,0,0]) translate([-X_Hole1+i*10.16,-Y_Hole1,Z_Hole1]) cylinder(r=3.8,h=6);
        }
        rotate([90,0,0]) translate([-X_Hole1+8*10+4.8,-Y_Hole1,Z_Hole1]) cylinder(r=3.8,h=6);     
        for(j=[0:7]) {
      rotate([90,0,0]) translate([-X_Hole1+j*10.16,-Y_Hole2,Z_Hole2]) cylinder(r=3.8,h=6);
        }
      rotate([90,0,0]) translate([-X_Hole1+8*10+4.8,-Y_Hole2,Z_Hole1]) cylinder(r=3.8,h=6);
      /*led cover*/        
        }
     }
}

module back_part(for_cut)
{
    X_USB = 49.5;
    Y_USB = 52;
    Z_USB = -3;
    X_Hole1 = -21;
    X_Hole2 = -50;
    Y_Hole1 = -1.35;
    Y_Hole2 = -1.4;
    X_Hole3 = 3;
    Y_Hole3 = -1.35;
    X_Hole4 = 27.5;
    Y_Hole4 = -1.35;
    Z_Hole = -58;
    CONN_RADIUS=7.25;
    CONN_EDGE_1 = 13.2;
    CONN_EDGE_2 = 6;
    
 if(for_cut ==1)
 {    
            translate ([0,Yih/2-Yf-2,0])minkowski()
            {
                cube([Xf,Yf-0.5,Zf-R_border+2],center = true);
                rotate([90,0,0])cylinder(r=R_border/2,Yf);
            }
 }else
            {
           difference()
                {
                translate ([0,Yih/2-Yf-2.5,0])minkowski()
            {
                cube([Xf,Yf-1,Zf-R_border-3.5],center = true);
                rotate([90,0,0])cylinder(r=R_border/2,Yf);
            }
            translate([X_USB,Y_USB,Z_USB]) cube([14,5,12],center = true);
            
            #union()
            {
                rotate([90,0,0]) translate([X_Hole1,Y_Hole1,Z_Hole+6]) cube([CONN_EDGE_1, CONN_EDGE_2, 12], center = true);
            difference()
            {
                rotate([90,0,0]) translate([X_Hole1,Y_Hole1,Z_Hole]) cylinder(r=CONN_RADIUS,h=12);
                rotate([90,0,0]) translate([X_Hole1,Y_Hole1,Z_Hole+5]) cube([CONN_EDGE_1+5, CONN_EDGE_2, 15], center = true);
            }
        }
            rotate([90,0,0]) translate([X_Hole2,  Y_Hole2,Z_Hole]) cylinder(r=CONN_RADIUS,h=10);
            rotate([90,0,0]) translate([X_Hole3,  Y_Hole3,Z_Hole]) cylinder(r=CONN_RADIUS,h=10);
            rotate([90,0,0]) translate([X_Hole4,  Y_Hole4,Z_Hole]) cylinder(r=CONN_RADIUS,h=10);
                
                }
            }
}

//top_part();
//body_part();
//translate([0,0,1])bottom_part();
//color([0.50,0.80,0.50]) front_part(CUT);
//color([0.90,0.80,0.80]) front_part(DRAW);

//color([0.50,0.50,0.80])back_part(CUT);
color([0.90,0.80,0.80])back_part(DRAW);
