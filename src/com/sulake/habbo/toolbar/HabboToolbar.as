package com.sulake.habbo.toolbar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.handshake.AuthenticationOKMessageEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarShowMenuEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import iid.IIDHabboWindowManager;
   
   public class HabboToolbar extends Component implements IHabboToolbar
   {
       
      
      private var _view:ToolbarView;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var _state:Boolean = false;
      
      private var var_276:IHabboCommunicationManager;
      
      private var _windowManager:IHabboWindowManager;
      
      public function HabboToolbar(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         super(param1,param2,param3);
         this._assetLibrary = param3;
         queueInterface(new IIDHabboCommunicationManager(),this.onCommunicationManagerReady);
      }
      
      public function get size() : int
      {
         if(this._view != null)
         {
            return this._view.barSize;
         }
         return 0;
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._windowManager = IHabboWindowManager(param2);
         this.var_276.addHabboConnectionMessageEvent(new AuthenticationOKMessageEvent(this.onAuthenticationOK));
      }
      
      private function onSetToolbarIconEvent(param1:HabboToolbarSetIconEvent) : void
      {
         var _loc2_:* = null;
         if(this._view != null && this._state)
         {
            if(param1.assetName != null)
            {
               _loc2_ = this.solveAssetBitmapData(param1.iconId,param1.assetName);
               this._view.setIconBitmap(param1.iconId,_loc2_);
            }
            else
            {
               this._view.setIcon(param1.iconId);
            }
         }
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_276 = IHabboCommunicationManager(param2);
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerReady);
      }
      
      private function onRemoveToolbarIconEvent(param1:HabboToolbarSetIconEvent) : void
      {
         if(this._view != null && this._state)
         {
            this._view.removeIcon(param1.iconId);
         }
      }
      
      private function solveAssetBitmapData(param1:String, param2:String = null) : BitmapData
      {
         if(param2 == null)
         {
            switch(param1)
            {
               case HabboToolbarIconEnum.CATALOGUE:
                  param2 = "catalogue_icon";
                  break;
               case HabboToolbarIconEnum.FRIENDLIST:
                  param2 = "friendlist_icon";
                  break;
               case HabboToolbarIconEnum.HAND:
                  param2 = "hand_icon";
                  break;
               case HabboToolbarIconEnum.HELP:
                  param2 = "help_icon";
                  break;
               case HabboToolbarIconEnum.INVENTORY:
                  param2 = "inventory_icon";
                  break;
               case HabboToolbarIconEnum.MEMENU:
                  param2 = "memenu_icon";
                  break;
               case HabboToolbarIconEnum.MESSENGER:
                  param2 = "messenger_icon";
                  break;
               case HabboToolbarIconEnum.NAVIGATOR:
                  param2 = "navigator_icon";
                  break;
               case HabboToolbarIconEnum.ROOMINFO:
                  param2 = "roominfo_icon";
                  break;
               case HabboToolbarIconEnum.SETTINGS:
                  param2 = "settings_icon";
                  break;
               case HabboToolbarIconEnum.ZOOM:
                  param2 = "zoomout_icon";
            }
         }
         var _loc3_:BitmapDataAsset = this._assetLibrary.getAssetByName(param2) as BitmapDataAsset;
         if(_loc3_ == null)
         {
            Logger.log("* Toolbar icon asset \'" + param2 + "\' not found!");
            return null;
         }
         var _loc4_:BitmapData = _loc3_.content as BitmapData;
         return _loc4_.clone();
      }
      
      private function onAuthenticationOK(param1:IMessageEvent) : void
      {
         this._view = new ToolbarView(this._windowManager,this._assetLibrary,events);
         if(this._view == null)
         {
            return;
         }
         events.addEventListener(HabboToolbarSetIconEvent.const_121,this.onSetToolbarIconEvent);
         events.addEventListener(HabboToolbarSetIconEvent.const_950,this.onSetToolbarIconBitmapEvent);
         events.addEventListener(HabboToolbarSetIconEvent.const_158,this.onRemoveToolbarIconEvent);
         events.addEventListener(HabboToolbarSetIconEvent.const_137,this.onSetToolbarIconStateEvent);
         events.addEventListener(HabboToolbarShowMenuEvent.const_50,this.onAnimateWindowEvent);
         events.addEventListener(HabboToolbarShowMenuEvent.const_446,this.onAnimateWindowEvent);
         events.addEventListener(HabboToolbarShowMenuEvent.const_784,this.onDisplayWindowEvent);
         events.addEventListener(HabboToolbarShowMenuEvent.const_971,this.onHideWindowEvent);
         this._state = true;
         events.dispatchEvent(new HabboToolbarEvent(HabboToolbarEvent.const_77));
      }
      
      public function get orientation() : String
      {
         if(this._view != null)
         {
            return this._view.orientation;
         }
         return "";
      }
      
      private function onHideWindowEvent(param1:HabboToolbarShowMenuEvent) : void
      {
         if(this._state && this._view != null)
         {
            this._view.hideWindow(param1.menuId,param1.window);
         }
      }
      
      private function onSetToolbarIconBitmapEvent(param1:HabboToolbarSetIconEvent) : void
      {
         if(this._view != null && this._state)
         {
            this._view.setIconBitmap(param1.iconId,param1.bitmapData);
         }
      }
      
      override public function dispose() : void
      {
         this._state = false;
         if(this.var_276)
         {
            this.var_276.release(new IIDHabboCommunicationManager());
            this.var_276 = null;
         }
         if(this._windowManager)
         {
            this._windowManager.release(new IIDHabboWindowManager());
            this._windowManager = null;
         }
         if(this._view != null)
         {
            this._view.dispose();
            this._view = null;
         }
         super.dispose();
      }
      
      private function onDisplayWindowEvent(param1:HabboToolbarShowMenuEvent) : void
      {
         if(this._state && this._view != null)
         {
            this._view.positionWindow(param1.menuId,param1.window);
         }
      }
      
      private function onAnimateWindowEvent(param1:HabboToolbarShowMenuEvent) : void
      {
         if(this._state && this._view != null)
         {
            if(param1.type == HabboToolbarShowMenuEvent.const_50)
            {
               if(param1.alignToIcon)
               {
                  this._view.animateWindowIn(param1.menuId,param1.window);
               }
               else
               {
                  this._view.animateWindowIn(param1.menuId,param1.window,new Point(param1.window.x,param1.window.y));
               }
            }
            else
            {
               this._view.animateWindowOut(param1.menuId,param1.window);
            }
         }
      }
      
      private function onSetToolbarIconStateEvent(param1:HabboToolbarSetIconEvent) : void
      {
         if(this._view != null && this._state)
         {
            this._view.setIconState(param1.iconId,param1.iconState);
         }
      }
   }
}
