package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class ClubOfferData
   {
       
      
      private var var_2330:int;
      
      private var var_1437:int;
      
      private var var_2327:int;
      
      private var _offerId:int;
      
      private var var_2328:int;
      
      private var var_2329:int;
      
      private var var_2326:Boolean;
      
      private var var_2332:int;
      
      private var var_2331:Boolean;
      
      private var var_1442:String;
      
      public function ClubOfferData(param1:IMessageDataWrapper)
      {
         super();
         this._offerId = param1.readInteger();
         this.var_1442 = param1.readString();
         this.var_1437 = param1.readInteger();
         this.var_2331 = param1.readBoolean();
         this.var_2326 = param1.readBoolean();
         this.var_2327 = param1.readInteger();
         this.var_2332 = param1.readInteger();
         this.var_2328 = param1.readInteger();
         this.var_2330 = param1.readInteger();
         this.var_2329 = param1.readInteger();
      }
      
      public function get year() : int
      {
         return this.var_2328;
      }
      
      public function get month() : int
      {
         return this.var_2330;
      }
      
      public function get price() : int
      {
         return this.var_1437;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get periods() : int
      {
         return this.var_2327;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return this.var_2332;
      }
      
      public function get upgrade() : Boolean
      {
         return this.var_2331;
      }
      
      public function get day() : int
      {
         return this.var_2329;
      }
      
      public function get vip() : Boolean
      {
         return this.var_2326;
      }
      
      public function get productCode() : String
      {
         return this.var_1442;
      }
   }
}
