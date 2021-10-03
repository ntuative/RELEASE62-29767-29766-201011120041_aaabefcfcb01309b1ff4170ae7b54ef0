package com.sulake.habbo.catalog
{
   import com.sulake.habbo.catalog.viewer.ICatalogPage;
   import com.sulake.habbo.catalog.viewer.IProductContainer;
   
   public interface IPurchasableOffer
   {
       
      
      function get productContainer() : IProductContainer;
      
      function get priceType() : String;
      
      function get localizationId() : String;
      
      function get offerId() : int;
      
      function get priceInPixels() : int;
      
      function get priceInCredits() : int;
      
      function get page() : ICatalogPage;
   }
}
