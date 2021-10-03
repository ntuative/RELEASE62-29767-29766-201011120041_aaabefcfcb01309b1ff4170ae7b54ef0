package com.sulake.core.runtime
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.utils.LibraryLoader;
   import flash.display.DisplayObjectContainer;
   import flash.events.IEventDispatcher;
   import flash.net.URLRequest;
   import flash.system.ApplicationDomain;
   import flash.system.LoaderContext;
   
   public interface IContext extends IUnknown
   {
       
      
      function get displayObjectContainer() : DisplayObjectContainer;
      
      function get assets() : IAssetLibrary;
      
      function detachComponent(param1:Component) : void;
      
      function loadFromFile(param1:URLRequest, param2:LoaderContext) : LibraryLoader;
      
      function toXMLString(param1:uint = 0) : String;
      
      function prepareAssetLibrary(param1:XML, param2:Class) : Boolean;
      
      function prepareComponent(param1:Class, param2:uint = 0, param3:ApplicationDomain = null) : IUnknown;
      
      function attachComponent(param1:Component, param2:Array) : void;
      
      function get events() : IEventDispatcher;
      
      function registerUpdateReceiver(param1:IUpdateReceiver, param2:uint) : void;
      
      function removeUpdateReceiver(param1:IUpdateReceiver) : void;
   }
}
