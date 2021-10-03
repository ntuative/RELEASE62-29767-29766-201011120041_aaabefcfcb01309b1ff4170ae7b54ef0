package com.sulake.habbo.communication.messages.incoming.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class CatalogPageMessageOfferData
   {
       
      
      private var var_966:Array;
      
      private var var_958:int;
      
      private var var_1446:String;
      
      private var _offerId:int;
      
      private var var_959:int;
      
      public function CatalogPageMessageOfferData(param1:IMessageDataWrapper)
      {
         super();
         this._offerId = param1.readInteger();
         this.var_1446 = param1.readString();
         this.var_958 = param1.readInteger();
         this.var_959 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this.var_966 = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_966.push(new CatalogPageMessageProductData(param1));
            _loc3_++;
         }
      }
      
      public function get products() : Array
      {
         return this.var_966;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_958;
      }
      
      public function get localizationId() : String
      {
         return this.var_1446;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get priceInPixels() : int
      {
         return this.var_959;
      }
   }
}
