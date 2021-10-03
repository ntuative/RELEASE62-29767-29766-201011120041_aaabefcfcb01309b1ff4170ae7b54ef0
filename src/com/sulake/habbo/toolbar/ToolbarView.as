package com.sulake.habbo.toolbar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.assets.IAsset;
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.assets.XmlAsset;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.components.IBitmapWrapperWindow;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.display.BitmapData;
   import flash.events.IEventDispatcher;
   import flash.events.MouseEvent;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class ToolbarView
   {
       
      
      private var var_1285:Boolean = false;
      
      private var _window:IWindowContainer;
      
      private var var_453:String = "LEFT";
      
      private var var_198:IWindowContainer;
      
      private var var_561:Array;
      
      private var var_1614:Number = 15;
      
      private var _events:IEventDispatcher;
      
      private var var_262:ToolbarBarMenuAnimator;
      
      private var var_1615:Number = 5;
      
      private var var_232:Array;
      
      private var var_117:Number = 50;
      
      private var var_1284:Number = 0;
      
      private var var_2581:Array;
      
      private var _toolbarMarginTop:Number = 1;
      
      private var var_1036:Boolean = true;
      
      public function ToolbarView(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IEventDispatcher)
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc10_:* = null;
         this.var_2581 = new Array();
         this.var_232 = new Array();
         this.var_561 = new Array();
         super();
         this._events = param3;
         _loc4_ = param2.getAssetByName("toolbar_window_xml");
         _loc5_ = XmlAsset(_loc4_);
         if(_loc5_ == null)
         {
            return;
         }
         this._window = param1.buildFromXML(_loc5_.content as XML,2) as IWindowContainer;
         if(this._window == null)
         {
            throw new Error("Failed to construct window from XML!");
         }
         var _loc6_:IBitmapWrapperWindow = this._window.findChildByName("bg") as IBitmapWrapperWindow;
         if(_loc6_ != null)
         {
            _loc10_ = param2.getAssetByName("toolbar_bg") as BitmapDataAsset;
            _loc6_.bitmap = _loc10_.content as BitmapData;
         }
         this._window.tags.push("habbo_toolbar");
         this.var_117 = this._window.width;
         this.var_198 = param1.createWindow("extrabar_container_window","",HabboWindowType.const_57,HabboWindowStyle.const_1016,0 | 0,new Rectangle(0,0,1,1),null,0,0) as IWindowContainer;
         this._window.tags.push("habbo_extrabar");
         _loc4_ = param2.getAssetByName("toolbar_xml");
         _loc5_ = XmlAsset(_loc4_);
         if(_loc5_ == null)
         {
            return;
         }
         var _loc7_:XML = XML(_loc5_.content);
         this.var_1036 = String(_loc7_.relocate_by_drag.@state) == "true";
         if(this.var_1036)
         {
            this._window.addEventListener(WindowMouseEvent.const_39,this.onToolbarMouseDown);
            this._window.context.getDesktopWindow().getDisplayObject().stage.addEventListener(MouseEvent.MOUSE_MOVE,this.onStageMouseMove);
            this._window.context.getDesktopWindow().getDisplayObject().stage.addEventListener(MouseEvent.MOUSE_UP,this.onStageMouseUp);
         }
         this._window.context.getDesktopWindow().addEventListener(WindowEvent.const_45,this.onRoomViewResized);
         this._toolbarMarginTop = _loc7_.toolbar.@margin_top;
         this.var_1284 = _loc7_.toolbar.@margin_bottom;
         this.var_1614 = _loc7_.toolbar.@min_group_margin;
         this.var_1615 = _loc7_.toolbar.@margin_to_extrabar;
         this.var_262 = new ToolbarBarMenuAnimator(param1,this);
         var _loc8_:XMLList = XMLList(_loc7_.toolbar).children();
         var _loc9_:XMLList = XMLList(_loc7_.extras).children();
         this.createGroupsFromXmlList(_loc8_,this.var_232,param1,param2,this._window,this.var_262);
         this.createGroupsFromXmlList(_loc9_,this.var_561,param1,param2,this.var_198,this.var_262);
         this.alignWindows();
      }
      
      private function onRoomViewResized(param1:WindowEvent) : void
      {
         this.alignWindows();
      }
      
      public function setIconBitmap(param1:String, param2:BitmapData) : void
      {
         var _loc3_:ToolbarIconGroup = this.getGroupForIcon(param1);
         if(_loc3_ != null)
         {
            _loc3_.setContent(param1,param2);
            this.alignWindows();
         }
      }
      
      public function removeIcon(param1:String) : void
      {
         var _loc2_:ToolbarIconGroup = this.getGroupForIcon(param1);
         if(_loc2_ != null)
         {
            _loc2_.removeContent(param1);
            this.alignWindows();
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         while(this.var_232.length > 0)
         {
            _loc1_ = this.var_232.shift();
            _loc1_.dispose();
            _loc1_ = null;
         }
         while(this.var_561.length > 0)
         {
            _loc1_ = this.var_561.shift();
            _loc1_.dispose();
            _loc1_ = null;
         }
         if(this._window != null)
         {
            this._window.dispose();
            this._window = null;
         }
         if(this.var_198 != null)
         {
            this.var_198.dispose();
            this.var_198 = null;
         }
      }
      
      public function getIconByMenuId(param1:String) : ToolbarIcon
      {
         var _loc2_:ToolbarIconGroup = this.getGroupForIcon(param1);
         if(_loc2_ != null)
         {
            return _loc2_.getIconByMenuId(param1);
         }
         return null;
      }
      
      private function onToolbarMouseDown(param1:WindowEvent) : void
      {
         if(this.var_1036)
         {
            this.var_1285 = true;
         }
      }
      
      public function get barSize() : Number
      {
         return this.var_117;
      }
      
      public function animateWindowIn(param1:String, param2:IWindowContainer, param3:Point = null) : void
      {
         var _loc4_:ToolbarIcon = this.getIconByMenuId(param1);
         if(_loc4_ != null)
         {
            _loc4_.animateWindowIn(param1,param2,this.var_117,this.var_453,param3);
         }
      }
      
      private function alignWindows() : void
      {
         var _loc2_:int = 0;
         var _loc3_:* = null;
         var _loc4_:Number = NaN;
         if(this._window == null || this.var_198 == null)
         {
            return;
         }
         var _loc1_:IDesktopWindow = this._window.context.getDesktopWindow();
         if(_loc1_ == null)
         {
            return;
         }
         this._window.visible = true;
         switch(this.orientation)
         {
            case "LEFT":
               this._window.width = this.var_117;
               this._window.height = _loc1_.height;
               this._window.x = 0;
               this._window.y = 0;
               this.var_198.x = this.var_117 + this.var_1615;
               this.var_198.y = 0;
               _loc4_ = this._window.height;
               break;
            case "RIGHT":
               this._window.width = this.var_117;
               this._window.height = _loc1_.height;
               this._window.x = _loc1_.width - this.var_117;
               this._window.y = 0;
               this.var_198.x = 0;
               this.var_198.y = 0;
               _loc4_ = this._window.height;
               break;
            case "TOP":
               this._window.width = _loc1_.width;
               this._window.height = this.var_117;
               this._window.x = 0;
               this._window.y = 0;
               this.var_198.x = 0;
               this.var_198.y = this.var_117 + this.var_1615;
               _loc4_ = this._window.width;
               break;
            case "BOTTOM":
               this._window.width = _loc1_.width;
               this._window.height = this.var_117;
               this._window.x = 0;
               this._window.y = _loc1_.height - this.var_117;
               this.var_198.x = 0;
               this.var_198.y = 0;
               _loc4_ = this._window.width;
         }
         _loc4_ -= this.var_1284;
         _loc4_ -= this._toolbarMarginTop;
         var _loc5_:IWindow = this._window.findChildByName("bg");
         if(_loc5_ != null)
         {
            _loc5_.rectangle = this._window.rectangle;
         }
         var _loc6_:* = 0;
         _loc2_ = 0;
         while(_loc2_ < this.var_232.length)
         {
            _loc3_ = this.var_232[_loc2_];
            _loc6_ += _loc3_.iconCount * _loc3_.defaultIconSize;
            _loc2_++;
         }
         var _loc7_:* = 0;
         var _loc8_:Number = this._toolbarMarginTop;
         var _loc9_:* = 1;
         if(_loc6_ > _loc4_)
         {
            _loc9_ = Number(_loc4_ / _loc6_);
         }
         else
         {
            _loc9_ = Number(Math.max(1,_loc4_ / (_loc6_ / 0.7)));
            if(this.var_232.length > 1)
            {
               if(this.orientation == "LEFT" || this.orientation == "RIGHT")
               {
                  _loc7_ = Number(Math.max(this.var_1614,(this._window.height - _loc6_ * _loc9_ - this._toolbarMarginTop - this.var_1284) / (this.var_232.length - 1)));
               }
               else
               {
                  _loc7_ = Number(Math.max(this.var_1614,(this._window.width - _loc6_ * _loc9_ - this._toolbarMarginTop - this.var_1284) / (this.var_232.length - 1)));
               }
            }
         }
         _loc2_ = 0;
         while(_loc2_ < this.var_232.length)
         {
            _loc3_ = this.var_232[_loc2_];
            if(_loc3_ != null)
            {
               _loc3_.orientation = this.var_453;
               _loc3_.iconSize = _loc3_.defaultIconSize * _loc9_;
               _loc3_.position = _loc8_;
               _loc8_ += _loc3_.size + _loc7_;
            }
            _loc2_++;
         }
         _loc2_ = 0;
         while(_loc2_ < this.var_561.length)
         {
            _loc3_ = this.var_561[_loc2_];
            if(_loc3_ != null)
            {
               _loc3_.position = _loc2_;
            }
            _loc2_++;
         }
         if(this.var_262 != null)
         {
            this.var_262.refresh();
         }
      }
      
      private function onStageMouseUp(param1:MouseEvent) : void
      {
         if(this.var_1036 && this.var_1285)
         {
            this.var_1285 = false;
         }
      }
      
      private function createGroupsFromXmlList(param1:XMLList, param2:Array, param3:IHabboWindowManager, param4:IAssetLibrary, param5:IWindowContainer, param6:ToolbarBarMenuAnimator) : void
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:int = 0;
         while(_loc10_ < param1.length())
         {
            _loc7_ = param1[_loc10_];
            _loc8_ = _loc7_.children();
            _loc9_ = new ToolbarIconGroup(param3,param4,_loc10_,this._events,param5,param6,this.var_117);
            _loc9_.defaultIconSize = _loc7_.@icon_size;
            _loc9_.iconSize = _loc9_.defaultIconSize;
            _loc9_.orientation = _loc7_.@default_orientation;
            _loc9_.windowMargin = _loc7_.@window_margin;
            _loc9_.windowBottomMargin = _loc7_.@window_bottom_margin;
            if(_loc9_.addContentIndexFromXmlList(_loc7_))
            {
               param2.push(_loc9_);
            }
            _loc10_++;
         }
      }
      
      public function get orientation() : String
      {
         return this.var_453;
      }
      
      public function getIconLoc(param1:String) : Point
      {
         var _loc2_:ToolbarIcon = this.getIconById(param1);
         if(_loc2_ == null)
         {
            return null;
         }
         return new Point(_loc2_.x,_loc2_.y);
      }
      
      private function getTargetOrientationFromXY(param1:Number, param2:Number) : String
      {
         var _loc3_:IDesktopWindow = this._window.context.getDesktopWindow();
         if(_loc3_ == null)
         {
            return null;
         }
         if(param1 <= this.var_117)
         {
            return "LEFT";
         }
         if(param1 >= _loc3_.width - this.var_117)
         {
            return "RIGHT";
         }
         if(param2 <= this.var_117)
         {
            return "TOP";
         }
         if(param2 >= _loc3_.height - this.var_117)
         {
            return "BOTTOM";
         }
         return null;
      }
      
      public function hideWindow(param1:String, param2:IWindowContainer) : void
      {
         this.alignWindows();
         var _loc3_:ToolbarIcon = this.getIconByMenuId(param1);
         if(_loc3_ != null)
         {
            _loc3_.hideWindow(param1,param2,this.var_117,this.var_453);
         }
      }
      
      public function setIconState(param1:String, param2:String) : void
      {
         var _loc3_:ToolbarIcon = this.getIconById(param1);
         if(_loc3_ != null)
         {
            _loc3_.state = param2;
            this.alignWindows();
         }
      }
      
      private function getGroupForIcon(param1:String) : ToolbarIconGroup
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         _loc3_ = 0;
         while(_loc3_ < this.var_232.length)
         {
            _loc2_ = this.var_232[_loc3_];
            if(_loc2_.acceptsIcon(param1))
            {
               return _loc2_;
            }
            _loc3_++;
         }
         _loc3_ = 0;
         while(_loc3_ < this.var_561.length)
         {
            _loc2_ = this.var_561[_loc3_];
            if(_loc2_.acceptsIcon(param1))
            {
               return _loc2_;
            }
            _loc3_++;
         }
         return null;
      }
      
      private function getIconById(param1:String) : ToolbarIcon
      {
         var _loc2_:ToolbarIconGroup = this.getGroupForIcon(param1);
         if(_loc2_ != null)
         {
            return _loc2_.getIconById(param1);
         }
         return null;
      }
      
      public function animateWindowOut(param1:String, param2:IWindowContainer) : void
      {
         var _loc3_:ToolbarIcon = this.getIconByMenuId(param1);
         if(_loc3_ != null)
         {
            _loc3_.animateWindowOut(param1,param2,this.var_453);
         }
      }
      
      private function onStageMouseMove(param1:MouseEvent) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(this.var_1036 && this.var_1285)
         {
            _loc2_ = this.getTargetOrientationFromXY(param1.stageX,param1.stageY);
            if(_loc2_ != null && _loc2_ != this.var_453)
            {
               this.var_453 = _loc2_;
               this.alignWindows();
               if(this._events != null)
               {
                  _loc3_ = new HabboToolbarEvent(HabboToolbarEvent.TOOLBAR_ORIENTATION);
                  _loc3_.orientation = this.var_453;
                  this._events.dispatchEvent(_loc3_);
               }
            }
         }
      }
      
      public function positionWindow(param1:String, param2:IWindowContainer) : void
      {
         this.alignWindows();
         var _loc3_:ToolbarIcon = this.getIconByMenuId(param1);
         if(_loc3_ != null)
         {
            _loc3_.positionWindow(param1,param2,this.var_117,this.var_453);
         }
      }
      
      public function setIcon(param1:String, param2:Boolean = true) : void
      {
         var _loc3_:ToolbarIconGroup = this.getGroupForIcon(param1);
         if(_loc3_ != null)
         {
            _loc3_.setIcon(param1,param2);
            this.alignWindows();
         }
      }
   }
}
