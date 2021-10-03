package com.sulake.habbo.communication.messages.incoming.marketplace
{
   public class MarketPlaceOffer
   {
       
      
      private var var_1437:int;
      
      private var var_1950:int;
      
      private var var_1949:int = -1;
      
      private var var_335:int;
      
      private var var_1951:int;
      
      private var _offerId:int;
      
      private var var_1438:int;
      
      private var _furniId:int;
      
      private var var_1820:String;
      
      public function MarketPlaceOffer(param1:int, param2:int, param3:int, param4:String, param5:int, param6:int, param7:int, param8:int, param9:int = -1)
      {
         super();
         this._offerId = param1;
         this._furniId = param2;
         this.var_1951 = param3;
         this.var_1820 = param4;
         this.var_1437 = param5;
         this.var_335 = param6;
         this.var_1949 = param7;
         this.var_1950 = param8;
         this.var_1438 = param9;
      }
      
      public function get status() : int
      {
         return this.var_335;
      }
      
      public function get price() : int
      {
         return this.var_1437;
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
      
      public function get furniType() : int
      {
         return this.var_1951;
      }
      
      public function get averagePrice() : int
      {
         return this.var_1950;
      }
      
      public function get furniId() : int
      {
         return this._furniId;
      }
      
      public function get stuffData() : String
      {
         return this.var_1820;
      }
   }
}
