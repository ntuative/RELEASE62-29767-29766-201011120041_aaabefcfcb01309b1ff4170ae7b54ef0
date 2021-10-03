package com.sulake.habbo.catalog.marketplace
{
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.localization.ICoreLocalizationManager;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.window.IHabboWindowManager;
   
   public interface IMarketPlace
   {
       
      
      function registerVisualization(param1:IMarketPlaceVisualization = null) : void;
      
      function requestItemStats(param1:int, param2:int) : void;
      
      function getNameLocalizationKey(param1:MarketPlaceOfferData) : String;
      
      function requestOffers(param1:int, param2:int, param3:String, param4:int) : void;
      
      function redeemSoldOffers() : void;
      
      function requestOwnItems() : void;
      
      function requestOffersByPrice(param1:int) : void;
      
      function get averagePricePeriod() : int;
      
      function onCancelResult(param1:IMessageEvent) : void;
      
      function refreshOffers() : void;
      
      function get creditsWaiting() : int;
      
      function onOffers(param1:IMessageEvent) : void;
      
      function set itemStats(param1:MarketplaceItemStats) : void;
      
      function get localization() : ICoreLocalizationManager;
      
      function set averagePricePeriod(param1:int) : void;
      
      function get itemStats() : MarketplaceItemStats;
      
      function get windowManager() : IHabboWindowManager;
      
      function onOwnOffers(param1:IMessageEvent) : void;
      
      function getDescriptionLocalizationKey(param1:MarketPlaceOfferData) : String;
      
      function onBuyResult(param1:IMessageEvent) : void;
      
      function requestOffersByName(param1:String) : void;
      
      function redeemExpiredOffer(param1:int) : void;
      
      function buyOffer(param1:int) : void;
      
      function latestOwnOffers() : Map;
      
      function latestOffers() : Map;
   }
}
