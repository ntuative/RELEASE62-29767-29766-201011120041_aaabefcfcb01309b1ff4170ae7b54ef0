package com.sulake.room.object.visualization.utils
{
   import com.sulake.core.assets.IAssetLibrary;
   import flash.display.BitmapData;
   
   public interface IGraphicAssetCollection
   {
       
      
      function disposeAsset(param1:String) : void;
      
      function set assetLibrary(param1:IAssetLibrary) : void;
      
      function getAsset(param1:String) : IGraphicAsset;
      
      function define(param1:XML) : Boolean;
      
      function dispose() : void;
      
      function addAsset(param1:String, param2:BitmapData, param3:Boolean, param4:int = 0, param5:int = 0) : Boolean;
   }
}
