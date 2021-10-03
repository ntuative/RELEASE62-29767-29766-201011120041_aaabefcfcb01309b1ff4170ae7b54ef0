package com.sulake.habbo.catalog.club
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   import com.sulake.habbo.catalog.viewer.IProductContainer;
   import com.sulake.habbo.catalog.viewer.Offer;
   
   public class ClubBuyOfferData implements IPurchasableOffer
   {
       
      
      private var var_2330:int;
      
      private var var_2472:Boolean = false;
      
      private var var_2327:int;
      
      private var var_2328:int;
      
      private var var_2332:int;
      
      private var var_1442:String;
      
      private var var_1437:int;
      
      private var _offerId:int;
      
      private var var_2329:int;
      
      private var var_2326:Boolean;
      
      private var var_2331:Boolean;
      
      private var var_387:ICatalogPage;
      
      public function ClubBuyOfferData(param1:int, param2:String, param3:int, param4:Boolean, param5:Boolean, param6:int, param7:int, param8:int, param9:int, param10:int)
      {
         super();
         this._offerId = param1;
         this.var_1442 = param2;
         this.var_1437 = param3;
         this.var_2331 = param4;
         this.var_2326 = param5;
         this.var_2327 = param6;
         this.var_2332 = param7;
         this.var_2328 = param8;
         this.var_2330 = param9;
         this.var_2329 = param10;
      }
      
      public function get month() : int
      {
         return this.var_2330;
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_387;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get vip() : Boolean
      {
         return this.var_2326;
      }
      
      public function set page(param1:ICatalogPage) : void
      {
         this.var_387 = param1;
      }
      
      public function dispose() : void
      {
      }
      
      public function get priceInPixels() : int
      {
         return 0;
      }
      
      public function get priceType() : String
      {
         return Offer.const_359;
      }
      
      public function get upgrade() : Boolean
      {
         return this.var_2331;
      }
      
      public function get localizationId() : String
      {
         return this.var_1442;
      }
      
      public function get daysLeftAfterPurchase() : int
      {
         return this.var_2332;
      }
      
      public function get upgradeHcPeriodToVip() : Boolean
      {
         return this.var_2472;
      }
      
      public function get day() : int
      {
         return this.var_2329;
      }
      
      public function get year() : int
      {
         return this.var_2328;
      }
      
      public function get price() : int
      {
         return this.var_1437;
      }
      
      public function set upgradeHcPeriodToVip(param1:Boolean) : void
      {
         this.var_2472 = param1;
      }
      
      public function get periods() : int
      {
         return this.var_2327;
      }
      
      public function get productContainer() : IProductContainer
      {
         return null;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_1437;
      }
      
      public function get productCode() : String
      {
         return this.var_1442;
      }
   }
}
