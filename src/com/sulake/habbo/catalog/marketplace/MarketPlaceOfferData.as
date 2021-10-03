package com.sulake.habbo.catalog.marketplace
{
   import flash.display.BitmapData;
   
   public class MarketPlaceOfferData
   {
       
      
      private var var_1952:int;
      
      private var var_1437:int;
      
      private var var_1950:int;
      
      private var var_1949:int = -1;
      
      private var var_335:int;
      
      private var var_1951:int;
      
      private var var_39:BitmapData;
      
      private var _offerId:int;
      
      private var var_1438:int;
      
      private var _furniId:int;
      
      private var var_1820:String;
      
      public function MarketPlaceOfferData(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int = -1)
      {
         super();
         this._offerId = param1;
         this._furniId = param2;
         this.var_1951 = param3;
         this.var_1820 = param4;
         this.var_1437 = param5;
         this.var_335 = param6;
         this.var_1950 = param7;
         this.var_1438 = param8;
      }
      
      public function get furniId() : int
      {
         return this._furniId;
      }
      
      public function get furniType() : int
      {
         return this.var_1951;
      }
      
      public function set imageCallback(param1:int) : void
      {
         this.var_1952 = param1;
      }
      
      public function get price() : int
      {
         return this.var_1437;
      }
      
      public function get stuffData() : String
      {
         return this.var_1820;
      }
      
      public function get imageCallback() : int
      {
         return this.var_1952;
      }
      
      public function get timeLeftMinutes() : int
      {
         return this.var_1949;
      }
      
      public function get offerCount() : int
      {
         return this.var_1438;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get image() : BitmapData
      {
         return this.var_39;
      }
      
      public function set timeLeftMinutes(param1:int) : void
      {
         this.var_1949 = param1;
      }
      
      public function dispose() : void
      {
         if(this.var_39)
         {
            this.var_39.dispose();
            this.var_39 = null;
         }
      }
      
      public function set price(param1:int) : void
      {
         this.var_1437 = param1;
      }
      
      public function set offerCount(param1:int) : void
      {
         this.var_1438 = param1;
      }
      
      public function get status() : int
      {
         return this.var_335;
      }
      
      public function get averagePrice() : int
      {
         return this.var_1950;
      }
      
      public function set offerId(param1:int) : void
      {
         this._offerId = param1;
      }
      
      public function set image(param1:BitmapData) : void
      {
         if(this.var_39 != null)
         {
            this.var_39.dispose();
         }
         this.var_39 = param1;
      }
   }
}
