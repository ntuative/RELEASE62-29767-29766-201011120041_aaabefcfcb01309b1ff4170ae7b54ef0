package com.sulake.habbo.session
{
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.session.furniture.IFurniDataListener;
   import com.sulake.habbo.session.furniture.IFurnitureData;
   import com.sulake.habbo.session.product.IProductData;
   import com.sulake.habbo.session.product.IProductDataListener;
   import flash.display.BitmapData;
   import flash.events.IEventDispatcher;
   
   public interface ISessionDataManager extends IUnknown
   {
       
      
      function get gender() : String;
      
      function getProductData(param1:String) : IProductData;
      
      function ignoreUser(param1:String) : void;
      
      function get systemShutDown() : Boolean;
      
      function get userId() : int;
      
      function isIgnored(param1:String) : Boolean;
      
      function get realName() : String;
      
      function get petRespectLeft() : int;
      
      function showGroupBadgeInfo(param1:int) : void;
      
      function pickAllFurniture(param1:int, param2:int) : void;
      
      function getFloorItemData(param1:int) : IFurnitureData;
      
      function getGroupBadgeId(param1:int) : String;
      
      function unignoreUser(param1:String) : void;
      
      function hasUserRight(param1:String) : Boolean;
      
      function givePetRespect(param1:int) : void;
      
      function get systemOpen() : Boolean;
      
      function openHabboHomePage(param1:int) : void;
      
      function getWallItemDataByName(param1:String) : IFurnitureData;
      
      function get isAnyRoomController() : Boolean;
      
      function getGroupBadgeImage(param1:String) : BitmapData;
      
      function get figure() : String;
      
      function get events() : IEventDispatcher;
      
      function getFurniData(param1:IFurniDataListener) : Array;
      
      function get respectLeft() : int;
      
      function getBadgeImage(param1:String) : BitmapData;
      
      function loadProductData(param1:IProductDataListener = null) : Boolean;
      
      function getFloorItemDataByName(param1:String) : IFurnitureData;
      
      function get userName() : String;
      
      function getUserTags(param1:int) : Array;
      
      function giveRespect(param1:int) : void;
      
      function getWallItemData(param1:int) : IFurnitureData;
   }
}
