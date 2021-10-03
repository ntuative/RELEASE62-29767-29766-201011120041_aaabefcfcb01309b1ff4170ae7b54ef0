package com.sulake.habbo.session.furniture
{
   public class FurnitureData implements IFurnitureData
   {
      
      public static const const_1709:String = "e";
      
      public static const const_1684:String = "i";
      
      public static const const_1714:String = "s";
       
      
      private var _name:String;
      
      private var var_2253:int;
      
      private var var_2156:int;
      
      private var _type:String;
      
      private var var_2254:int;
      
      private var _id:int;
      
      private var var_1443:String;
      
      private var var_2251:String;
      
      private var _revision:int;
      
      private var _title:String;
      
      private var var_1209:Array;
      
      private var var_2252:int;
      
      private var _offerId:int;
      
      private var var_2255:int;
      
      public function FurnitureData(param1:String, param2:int, param3:String, param4:int, param5:int, param6:int, param7:int, param8:int, param9:Array, param10:String, param11:String, param12:String, param13:int, param14:int)
      {
         super();
         this._type = param1;
         this._id = param2;
         this._name = param3;
         this.var_2254 = param4;
         this._revision = param5;
         this.var_2255 = param6;
         this.var_2253 = param7;
         this.var_2252 = param8;
         this.var_1209 = param9;
         this._title = param10;
         this.var_1443 = param11;
         this.var_2251 = param12;
         this.var_2156 = param13;
         this._offerId = param14;
      }
      
      public function get catalogPageId() : int
      {
         return this.var_2156;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get description() : String
      {
         return this.var_1443;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get colours() : Array
      {
         return this.var_1209;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get adUrl() : String
      {
         return this.var_2251;
      }
      
      public function get title() : String
      {
         return this._title;
      }
      
      public function get revision() : int
      {
         return this._revision;
      }
      
      public function get colourIndex() : int
      {
         return this.var_2254;
      }
      
      public function get tileSizeX() : int
      {
         return this.var_2255;
      }
      
      public function get tileSizeY() : int
      {
         return this.var_2253;
      }
      
      public function get tileSizeZ() : int
      {
         return this.var_2252;
      }
   }
}
