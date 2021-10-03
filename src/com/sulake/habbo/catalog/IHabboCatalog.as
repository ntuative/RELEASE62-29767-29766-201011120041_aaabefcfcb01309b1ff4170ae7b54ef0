package com.sulake.habbo.catalog
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.catalog.marketplace.IMarketPlace;
   import com.sulake.habbo.catalog.purse.IPurse;
   import com.sulake.habbo.catalog.recycler.IRecycler;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.display.BitmapData;
   import flash.events.IEventDispatcher;
   
   public interface IHabboCatalog extends IUnknown
   {
       
      
      function redeemSoldMarketPlaceOffers() : void;
      
      function loadCatalogPage(param1:int, param2:int) : void;
      
      function get assets() : IAssetLibrary;
      
      function getMarketPlace() : IMarketPlace;
      
      function getFurnitureData(param1:int, param2:String) : IFurnitureData;
      
      function getRecyclerStatus() : void;
      
      function setupInventoryForRecycler(param1:Boolean) : void;
      
      function getProductData(param1:String) : IProductData;
      
      function get tradingActive() : Boolean;
      
      function openCatalogPageById(param1:int, param2:int) : void;
      
      function getPublicMarketPlaceOffers(param1:int, param2:int, param3:String, param4:int) : void;
      
      function sendRecycleItems(param1:Array) : void;
      
      function openInventoryCategory(param1:String) : void;
      
      function get localization() : ICoreLocalizationManager;
      
      function getPixelEffectIcon(param1:int) : BitmapData;
      
      function get windowManager() : IHabboWindowManager;
      
      function get privateRoomSessionActive() : Boolean;
      
      function get events() : IEventDispatcher;
      
      function openCatalogPage(param1:String, param2:Boolean = false) : void;
      
      function buyMarketPlaceOffer(param1:int) : void;
      
      function showNotEnoughCreditsAlert(param1:String) : void;
      
      function getPurse() : IPurse;
      
      function requestInventoryFurniToRecycler() : int;
      
      function get connection() : IConnection;
      
      function openCatalog() : void;
      
      function redeemVoucher(param1:String) : void;
      
      function getHabboClubOffers() : void;
      
      function getSubscriptionProductIcon(param1:int) : BitmapData;
      
      function get configuration() : IHabboConfigurationManager;
      
      function getMarketplaceItemStats(param1:int, param2:int) : void;
      
      function getOwnMarketPlaceOffers() : void;
      
      function redeemExpiredMarketPlaceOffer(param1:int) : void;
      
      function returnInventoryFurniFromRecycler(param1:int) : Boolean;
      
      function getRecycler() : IRecycler;
      
      function getRecyclerPrizes() : void;
   }
}
