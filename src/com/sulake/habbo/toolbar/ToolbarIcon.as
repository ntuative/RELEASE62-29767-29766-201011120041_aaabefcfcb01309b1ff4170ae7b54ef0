package com.sulake.habbo.toolbar
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IRegionWindow;
   import com.sulake.core.window.enum.WindowType;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.display.BitmapData;
   import flash.events.Event;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class ToolbarIcon
   {
       
      
      private var var_452:ToolbarIconGroup;
      
      private var var_1035:Boolean = false;
      
      private var var_1611:String;
      
      private var var_1089:Number;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_1283:String = "-1";
      
      private var _window:IBitmapWrapperWindow;
      
      private var _state:String = "-1";
      
      private var _region:IRegionWindow;
      
      private var _bitmapData:BitmapData;
      
      private var var_679:String;
      
      private var var_2101:int;
      
      private var var_825:Timer;
      
      private var var_1612:Array;
      
      private var var_1031:ToolbarIconBouncer;
      
      private var _windowManager:IHabboWindowManager;
      
      private var _events:IEventDispatcher;
      
      private var var_2580:Array;
      
      private var var_262:ToolbarBarMenuAnimator;
      
      private var var_559:ToolbarIconAnimator;
      
      private var var_680:Array;
      
      private var var_1034:Array;
      
      private var var_1033:String = "-1";
      
      private var var_2612:Boolean = true;
      
      private var var_1032:Array;
      
      private var var_1282:Timer;
      
      private var var_2261:int;
      
      private var _x:Number = 0;
      
      private var var_162:Number = 0;
      
      public function ToolbarIcon(param1:ToolbarIconGroup, param2:IHabboWindowManager, param3:IAssetLibrary, param4:String, param5:IEventDispatcher, param6:ToolbarBarMenuAnimator)
      {
         this.var_680 = new Array();
         this.var_1034 = new Array();
         this.var_2580 = new Array();
         this.var_1031 = new ToolbarIconBouncer(0.8,1);
         super();
         this.var_452 = param1;
         this._windowManager = param2;
         this._assetLibrary = param3;
         this.var_679 = param4;
         this._events = param5;
         this.var_262 = param6;
         this.var_1282 = new Timer(40,40);
         this.var_1282.addEventListener(TimerEvent.TIMER,this.updateBouncer);
         this._region = param2.createWindow("TOOLBAR_ICON_" + param4 + "_REGION","",WindowType.const_429,HabboWindowStyle.const_36,HabboWindowParam.const_38,new Rectangle(0,0,1,1),this.onMouseEvent) as IRegionWindow;
         this._region.background = true;
         this._region.mouseTreshold = 0;
         this._region.visible = false;
         this._window = IBitmapWrapperWindow(param2.createWindow("TOOLBAR_ICON_" + param4,"",HabboWindowType.const_215,HabboWindowStyle.const_36,HabboWindowParam.const_36,new Rectangle(0,0,1,1),null,0));
         this._region.addChild(this._window);
         this._window.addEventListener(WindowEvent.const_45,this.onWindowResized);
      }
      
      private function getStateObject(param1:String) : StateItem
      {
         return this.var_1612[this.var_1032.indexOf(param1)];
      }
      
      public function get windowOffsetFromIcon() : Number
      {
         return this.var_2261;
      }
      
      public function get iconId() : String
      {
         return this.var_679;
      }
      
      private function onWindowResized(param1:WindowEvent) : void
      {
         this.updateRegion();
      }
      
      public function changePosition(param1:Number) : void
      {
         this.var_1089 = param1;
         this.updateRegion();
      }
      
      public function setIcon(param1:Boolean = true) : void
      {
         this.exists = param1;
         this.setAnimator();
      }
      
      public function set state(param1:String) : void
      {
         this._state = param1;
         this.exists = true;
         this.setAnimator();
         this.setTooltip();
      }
      
      private function updateRegion() : void
      {
         if(this._region == null || this._window == null)
         {
            return;
         }
         this._region.width = this._window.width;
         this._region.height = this._window.height;
         var _loc1_:Boolean = this.var_452.orientation == "LEFT" || this.var_452.orientation == "RIGHT";
         if(_loc1_)
         {
            this._x = (this.var_452.toolbarUsableWidth - this._window.width) / 2;
            this.var_162 = this.var_1089 + (this.var_452.iconSize - this._window.height) / 2;
         }
         else
         {
            this._x = this.var_1089 + (this.var_452.iconSize - this._window.width) / 2;
            this.var_162 = (this.var_452.toolbarUsableWidth - this._window.height) / 2;
         }
         this._region.x = this._x;
         this._region.y = this.var_162;
      }
      
      public function dispose() : void
      {
         if(this._window != null)
         {
            this._window.dispose();
            this._window = null;
         }
         if(this._region != null)
         {
            this._region.dispose();
            this._region = null;
         }
         this.var_680 = null;
         this.var_1034 = null;
         this.exists = false;
         this._windowManager = null;
         this._events = null;
         this.var_262 = null;
         this.var_559 = null;
         this._bitmapData = null;
      }
      
      public function dockMenu(param1:String, param2:Array = null, param3:Boolean = false) : void
      {
         var _loc4_:* = null;
         if(this.var_680.indexOf(param1) < 0)
         {
            this.var_680.push(param1);
            _loc4_ = new MenuSettingsItem(param1,param2,param3);
            this.var_1034.push(_loc4_);
         }
      }
      
      private function onMouseEvent(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc4_:* = null;
         if(!this.var_1035)
         {
            return;
         }
         var _loc3_:StateItem = this.getCurrentStateObject();
         switch(param1.type)
         {
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_CLICK:
               if(this.var_262)
               {
                  this.var_262.repositionWindow(this.var_679,true);
               }
               if(this._events != null)
               {
                  _loc4_ = new HabboToolbarEvent(HabboToolbarEvent.const_48);
                  _loc4_.iconId = this.var_679;
                  _loc4_.iconName = this.var_1611;
                  this._events.dispatchEvent(_loc4_);
               }
               break;
            case WindowMouseEvent.WINDOW_EVENT_MOUSE_OVER:
               if(this.var_1032.length > 0)
               {
                  if(_loc3_.hasStateOver)
                  {
                     this.state = _loc3_.stateOver;
                  }
                  else
                  {
                     this.state = this.var_1283;
                  }
               }
               break;
            case WindowMouseEvent.const_26:
               if(this.var_1032.length > 0)
               {
                  if(_loc3_.hasDefaultState)
                  {
                     this.state = _loc3_.defaultState;
                  }
                  else
                  {
                     this.state = this.var_1033;
                  }
               }
         }
      }
      
      public function docksMenu(param1:String) : Boolean
      {
         return this.var_680.indexOf(param1) > -1;
      }
      
      public function menuLockedToIcon(param1:String) : Boolean
      {
         if(!this.docksMenu(param1))
         {
            return false;
         }
         var _loc2_:MenuSettingsItem = this.var_1034[this.var_680.indexOf(param1)];
         return _loc2_.lockToIcon;
      }
      
      public function set exists(param1:Boolean) : void
      {
         this.var_1035 = param1;
         if(this._region != null)
         {
            this._region.visible = this.var_1035;
         }
      }
      
      private function setTooltip() : void
      {
         if(this._region == null)
         {
            return;
         }
         var _loc1_:StateItem = this.getCurrentStateObject();
         if(_loc1_ != null && _loc1_.tooltip != null)
         {
            this._region.toolTipCaption = "${toolbar.icon.tooltip." + _loc1_.tooltip + "}";
         }
         else
         {
            this._region.toolTipCaption = "${toolbar.icon.tooltip." + this.var_1611.toLowerCase() + "}";
         }
         this._region.toolTipDelay = 100;
      }
      
      public function animateWindowIn(param1:String, param2:IWindowContainer, param3:Number, param4:String, param5:Point) : void
      {
         if(this.var_262 != null)
         {
            this.var_262.animateWindowIn(this,param1,param2,this.var_679,param3,param4,this.getMenuYieldList(param1));
         }
      }
      
      private function updateAnimator(param1:Event) : void
      {
         if(this.var_559 != null && this._window != null)
         {
            this.var_559.update(this._window);
            if(this.var_559.hasNextState())
            {
               this.state = this.var_559.nextState;
            }
         }
      }
      
      public function defineFromXML(param1:XML) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         this.var_1612 = new Array();
         this.var_1032 = new Array();
         this.var_1611 = param1.@id;
         this.var_2261 = int(param1.@window_offset_from_icon);
         this.var_2101 = int(param1.@window_margin);
         var _loc2_:XMLList = param1.elements("state");
         if(_loc2_.length() > 0)
         {
            if(param1.attribute("state_over").length() > 0)
            {
               this.var_1283 = param1.@state_over;
            }
            if(param1.attribute("state_default").length() > 0)
            {
               this.var_1033 = param1.@state_default;
            }
            _loc3_ = 0;
            while(_loc3_ < _loc2_.length())
            {
               _loc4_ = _loc2_[_loc3_];
               _loc5_ = new StateItem(_loc4_,param1.@id.toLowerCase());
               this.var_1032.push(_loc5_.id);
               this.var_1612.push(_loc5_);
               if(_loc3_ == 0)
               {
                  if(this.var_1283 == "-1")
                  {
                     this.var_1283 = _loc5_.id;
                  }
                  if(this.var_1033 == "-1")
                  {
                     this.var_1033 = _loc5_.id;
                  }
               }
               _loc3_++;
            }
         }
         this._state = this.var_1033;
      }
      
      public function setIconBitmapData(param1:BitmapData = null) : void
      {
         this.exists = true;
         this._bitmapData = param1;
         this.setAnimator();
      }
      
      public function hideWindow(param1:String, param2:IWindowContainer, param3:Number, param4:String) : void
      {
         if(this.var_262 != null)
         {
            this.var_262.hideWindow(param1,param2,this.var_679,param3);
         }
      }
      
      public function positionWindow(param1:String, param2:IWindowContainer, param3:Number, param4:String) : void
      {
         if(this.var_262 != null)
         {
            this.var_262.positionWindow(this,param1,param2,this.var_679,param3,this.getMenuYieldList(param1));
         }
      }
      
      public function animateWindowOut(param1:String, param2:IWindowContainer, param3:String) : void
      {
         if(this.var_262 != null)
         {
            this.var_262.animateWindowOut(this,param1,param2,param3);
         }
      }
      
      public function get y() : Number
      {
         return this.var_162;
      }
      
      public function get exists() : Boolean
      {
         return this.var_1035;
      }
      
      private function updateBouncer(param1:Event) : void
      {
         if(this.var_1031 != null && this._window != null)
         {
            this.var_1031.update();
            this._window.y = this.var_1031.location;
         }
      }
      
      private function setAnimator() : void
      {
         if(this.var_825 != null)
         {
            this.var_825.stop();
            this.var_825 = null;
         }
         var _loc1_:StateItem = this.getCurrentStateObject();
         if(_loc1_ != null && this.var_1035)
         {
            if(_loc1_.frames == null)
            {
               return;
            }
            this.var_559 = new ToolbarIconAnimator(_loc1_,this._assetLibrary,this._window,this._x,this.var_162,this._bitmapData);
            if(this.var_559.frameCount > 0)
            {
               this.var_825 = new Timer(_loc1_.timer);
               this.var_825.addEventListener(TimerEvent.TIMER,this.updateAnimator);
               this.var_825.start();
            }
            if(_loc1_.bounce)
            {
               this.var_1031.reset(-7);
               this.var_1282.reset();
               this.var_1282.start();
            }
         }
         else
         {
            this.var_559 = null;
            this._window.bitmap = null;
         }
      }
      
      public function get windowMargin() : Number
      {
         return this.var_2101 + this.var_452.windowMargin;
      }
      
      private function getCurrentStateObject() : StateItem
      {
         return this.getStateObject(this._state);
      }
      
      public function get window() : IWindow
      {
         return this._region;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      private function getMenuYieldList(param1:String) : Array
      {
         if(!this.docksMenu(param1))
         {
            return null;
         }
         var _loc2_:MenuSettingsItem = this.var_1034[this.var_680.indexOf(param1)];
         return _loc2_.yieldList;
      }
      
      public function get group() : ToolbarIconGroup
      {
         return this.var_452;
      }
   }
}
