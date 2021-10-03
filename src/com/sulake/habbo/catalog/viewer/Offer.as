package com.sulake.habbo.catalog.viewer
{
   import com.sulake.habbo.catalog.IPurchasableOffer;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageOfferData;
   import com.sulake.habbo.communication.messages.incoming.catalog.CatalogPageMessageProductData;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   
   public class Offer implements IPurchasableOffer
   {
      
      public static const const_1069:String = "price_type_none";
      
      public static const const_505:String = "pricing_model_multi";
      
      public static const const_359:String = "price_type_credits";
      
      public static const const_470:String = "price_type_credits_and_pixels";
      
      public static const const_398:String = "pricing_model_bundle";
      
      public static const const_400:String = "pricing_model_single";
      
      public static const const_789:String = "price_type_credits_or_credits_and_pixels";
      
      public static const const_1354:String = "pricing_model_unknown";
      
      public static const const_503:String = "price_type_pixels";
       
      
      private var var_1962:int;
      
      private var var_958:int;
      
      private var _offerId:int;
      
      private var var_959:int;
      
      private var var_619:String;
      
      private var var_957:String;
      
      private var var_387:ICatalogPage;
      
      private var var_620:IProductContainer;
      
      private var var_1446:String;
      
      public function Offer(param1:CatalogPageMessageOfferData, param2:ICatalogPage)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         super();
         this._offerId = param1.offerId;
         this.var_1446 = param1.localizationId;
         this.var_958 = param1.priceInCredits;
         this.var_959 = param1.priceInPixels;
         this.var_387 = param2;
         var _loc3_:Array = new Array();
         for each(_loc4_ in param1.products)
         {
            _loc5_ = param2.viewer.catalog.getProductData(param1.localizationId);
            _loc6_ = param2.viewer.catalog.getFurnitureData(_loc4_.furniClassId,_loc4_.productType);
            _loc7_ = new Product(_loc4_,_loc5_,_loc6_);
            _loc3_.push(_loc7_);
         }
         this.analyzePricingModel(_loc3_);
         this.analyzePriceType();
         this.createProductContainer(_loc3_);
      }
      
      public function get pricingModel() : String
      {
         return this.var_619;
      }
      
      public function get page() : ICatalogPage
      {
         return this.var_387;
      }
      
      public function set previewCallbackId(param1:int) : void
      {
         this.var_1962 = param1;
      }
      
      public function get productContainer() : IProductContainer
      {
         return this.var_620;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get priceInPixels() : int
      {
         return this.var_959;
      }
      
      public function dispose() : void
      {
         this._offerId = 0;
         this.var_1446 = "";
         this.var_958 = 0;
         this.var_959 = 0;
         this.var_387 = null;
         if(this.var_620 != null)
         {
            this.var_620.dispose();
            this.var_620 = null;
         }
      }
      
      public function get previewCallbackId() : int
      {
         return this.var_1962;
      }
      
      public function get priceInCredits() : int
      {
         return this.var_958;
      }
      
      private function analyzePricingModel(param1:Array) : void
      {
         var _loc2_:* = null;
         if(param1.length == 1)
         {
            _loc2_ = param1[0];
            if(_loc2_.productCount == 1)
            {
               this.var_619 = const_400;
            }
            else
            {
               this.var_619 = const_505;
            }
         }
         else if(param1.length > 1)
         {
            this.var_619 = const_398;
         }
         else
         {
            this.var_619 = const_1354;
         }
      }
      
      public function get priceType() : String
      {
         return this.var_957;
      }
      
      private function createProductContainer(param1:Array) : void
      {
         switch(this.var_619)
         {
            case const_400:
               this.var_620 = new SingleProductContainer(this,param1);
               break;
            case const_505:
               this.var_620 = new MultiProductContainer(this,param1);
               break;
            case const_398:
               this.var_620 = new BundleProductContainer(this,param1);
               break;
            default:
               Logger.log("[Offer] Unknown pricing model" + this.var_619);
         }
      }
      
      public function get localizationId() : String
      {
         return this.var_1446;
      }
      
      private function analyzePriceType() : void
      {
         if(this.var_958 > 0 && this.var_959 > 0)
         {
            this.var_957 = const_470;
         }
         else if(this.var_958 > 0)
         {
            this.var_957 = const_359;
         }
         else if(this.var_959 > 0)
         {
            this.var_957 = const_503;
         }
         else
         {
            this.var_957 = const_1069;
         }
      }
   }
}
