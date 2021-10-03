package com.sulake.habbo.help.help
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.ICoreWindowManager;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.utils.Dictionary;
   
   public class HelpViewController implements IHelpViewController
   {
       
      
      private var _container:IWindowContainer;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var _disposed:Boolean = true;
      
      private var var_46:HelpUI;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_1925:Boolean = false;
      
      public function HelpViewController(param1:HelpUI, param2:IHabboWindowManager, param3:IAssetLibrary)
      {
         super();
         this.var_46 = param1;
         this._windowManager = param2;
         this._assetLibrary = param3;
      }
      
      public function get container() : IWindowContainer
      {
         return this._container;
      }
      
      public function windowProcedure(param1:WindowEvent, param2:IWindow) : void
      {
         if(param1.type != WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK)
         {
            return;
         }
         this.var_46.windowProcedure(param1,param2);
      }
      
      public function update(param1:* = null) : void
      {
      }
      
      public function set container(param1:IWindowContainer) : void
      {
         this._container = param1;
      }
      
      public function render() : void
      {
         this._disposed = false;
      }
      
      public function set disposed(param1:Boolean) : void
      {
         this._disposed = param1;
      }
      
      public function set roomSessionActive(param1:Boolean) : void
      {
         this.var_1925 = param1;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return this._windowManager;
      }
      
      public function buildXmlWindow(param1:String) : IWindow
      {
         var _loc2_:XmlAsset = XmlAsset(this._assetLibrary.getAssetByName(param1 + "_xml"));
         if(_loc2_ == null || this._windowManager == null)
         {
            return null;
         }
         var _loc3_:ICoreWindowManager = ICoreWindowManager(this._windowManager);
         return _loc3_.buildFromXML(XML(_loc2_.content));
      }
      
      public function get roomSessionActive() : Boolean
      {
         return this.var_1925;
      }
      
      public function getText(param1:String) : String
      {
         if(this.var_46 == null)
         {
            return null;
         }
         return this.var_46.getText(param1);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function dispose() : void
      {
         if(this._container != null)
         {
            this._container.dispose();
            this._container = null;
         }
         this._disposed = true;
      }
      
      public function get assetLibrary() : IAssetLibrary
      {
         return this._assetLibrary;
      }
      
      public function get main() : HelpUI
      {
         return this.var_46;
      }
      
      public function getWindowContainer() : IWindowContainer
      {
         return this._container;
      }
      
      public function getConfigurationKey(param1:String, param2:String = null, param3:Dictionary = null) : String
      {
         if(this.var_46 == null)
         {
            return null;
         }
         return this.var_46.getConfigurationKey(param1,param2,param3);
      }
   }
}
