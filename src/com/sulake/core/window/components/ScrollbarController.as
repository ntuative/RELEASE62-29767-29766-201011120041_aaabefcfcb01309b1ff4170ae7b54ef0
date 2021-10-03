package com.sulake.core.window.components
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.core.window.WindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.enum.WindowType;
   import com.sulake.core.window.events.WindowEvent;
   import com.sulake.core.window.events.WindowMouseEvent;
   import com.sulake.core.window.events.WindowNotifyEvent;
   import com.sulake.core.window.events.WindowTouchEvent;
   import com.sulake.core.window.utils.PropertyStruct;
   import com.sulake.core.window.utils.tablet.ITouchAwareWindow;
   import flash.events.Event;
   import flash.geom.Rectangle;
   
   public class ScrollbarController extends InteractiveController implements IScrollbarWindow, ITouchAwareWindow
   {
      
      private static const const_1206:String = "increment";
      
      private static const const_541:String = "slider_bar";
      
      private static const const_1207:String = "decrement";
      
      private static const const_859:String = "slider_track";
       
      
      private var _horizontal:Boolean;
      
      protected var var_18:IScrollableWindow;
      
      private var var_1104:Boolean = false;
      
      protected var var_604:Number = 0.1;
      
      private var var_884:String;
      
      protected var _offset:Number = 0;
      
      public function ScrollbarController(param1:String, param2:uint, param3:uint, param4:uint, param5:WindowContext, param6:Rectangle, param7:IWindow, param8:Function, param9:Array = null, param10:Array = null, param11:uint = 0, param12:IScrollableWindow = null)
      {
         var _loc14_:* = null;
         super(param1,param2,param3,param4,param5,param6,param7,param8,param9,param10,param11);
         var_147 = false;
         this.var_18 = param12;
         this._horizontal = param2 == WindowType.const_454;
         var _loc13_:Array = new Array();
         groupChildrenWithTag(WindowController.TAG_INTERNAL,_loc13_,true);
         for each(_loc14_ in _loc13_)
         {
            _loc14_.procedure = this.scrollButtonEventProc;
         }
         this.updateLiftSizeAndPosition();
      }
      
      override public function update(param1:WindowController, param2:Event) : Boolean
      {
         switch(param1.name)
         {
            case ScrollbarController.const_541:
               if(param2.type == WindowNotifyEvent.const_278)
               {
                  if(!this.var_1104)
                  {
                     if(this._horizontal)
                     {
                        this.setScrollPosition(ScrollbarLiftController(param1).offsetX);
                     }
                     else
                     {
                        this.setScrollPosition(ScrollbarLiftController(param1).offsetY);
                     }
                  }
               }
         }
         var _loc3_:Boolean = super.update(param1,param2);
         if(param2.type == WindowNotifyEvent.const_512)
         {
            if(this.var_18 == null)
            {
               this.resolveScrollTarget();
            }
         }
         if(param1 == this)
         {
            if(param2.type == WindowNotifyEvent.const_167)
            {
               this.updateLiftSizeAndPosition();
            }
            else if(param2.type == WindowMouseEvent.const_291)
            {
               if(WindowMouseEvent(param2).delta > 0)
               {
                  if(this._horizontal)
                  {
                     this.scrollH -= this.var_604;
                  }
                  else
                  {
                     this.scrollV -= this.var_604;
                  }
               }
               else if(this._horizontal)
               {
                  this.scrollH += this.var_604;
               }
               else
               {
                  this.scrollV += this.var_604;
               }
               _loc3_ = true;
            }
         }
         return _loc3_;
      }
      
      override public function enable() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         if(super.enable())
         {
            _loc1_ = new Array();
            groupChildrenWithTag(WindowController.TAG_INTERNAL,_loc1_,true);
            _loc2_ = 0;
            while(_loc2_ < _loc1_.length)
            {
               IWindow(_loc1_[_loc2_]).enable();
               _loc2_++;
            }
            return true;
         }
         return false;
      }
      
      protected function get track() : WindowController
      {
         return findChildByName(const_859) as WindowController;
      }
      
      private function nullEventProc(param1:WindowEvent, param2:IWindow) : void
      {
      }
      
      public function set scrollV(param1:Number) : void
      {
         if(!this._horizontal)
         {
            if(this.setScrollPosition(param1))
            {
               this.updateLiftSizeAndPosition();
            }
         }
      }
      
      private function onScrollableScrolled(param1:WindowEvent) : void
      {
         this.updateLiftSizeAndPosition();
      }
      
      public function set scrollable(param1:IScrollableWindow) : void
      {
         if(this.var_18 != null && !this.var_18.disposed)
         {
            this.var_18.removeEventListener(WindowEvent.const_45,this.onScrollableResized);
            this.var_18.removeEventListener(WindowEvent.const_467,this.onScrollableScrolled);
         }
         this.var_18 = param1;
         if(this.var_18 != null && !this.var_18.disposed)
         {
            this.var_18.addEventListener(WindowEvent.const_45,this.onScrollableResized);
            this.var_18.addEventListener(WindowEvent.const_467,this.onScrollableScrolled);
            this.updateLiftSizeAndPosition();
         }
      }
      
      protected function get lift() : WindowController
      {
         return this.track.findChildByName(const_541) as WindowController;
      }
      
      protected function setScrollPosition(param1:Number) : Boolean
      {
         var _loc2_:* = false;
         if(this.var_18 == null)
         {
            if(!this.resolveScrollTarget())
            {
               return false;
            }
         }
         if(param1 < 0)
         {
            param1 = 0;
         }
         if(param1 > 1)
         {
            param1 = 1;
         }
         this._offset = param1;
         if(this._horizontal)
         {
            _loc2_ = this.var_18.scrollH != this._offset;
            this.var_18.scrollH = this._offset;
         }
         else
         {
            _loc2_ = this.var_18.scrollV != this._offset;
            this.var_18.scrollV = this._offset;
         }
         return _loc2_;
      }
      
      override public function dispose() : void
      {
         this.scrollable = null;
         super.dispose();
      }
      
      public function get scrollH() : Number
      {
         return !!this._horizontal ? Number(this._offset) : Number(0);
      }
      
      public function get horizontal() : Boolean
      {
         return this._horizontal;
      }
      
      override public function set properties(param1:Array) : void
      {
         var _loc3_:* = null;
         var _loc2_:int = param1.length;
         var _loc4_:int = 0;
         while(_loc4_ < _loc2_)
         {
            _loc3_ = param1[_loc4_] as PropertyStruct;
            if(_loc3_.key == "scrollable")
            {
               this.var_884 = _loc3_.value as String;
            }
            _loc4_++;
         }
         super.properties = param1;
      }
      
      override public function disable() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         if(super.disable())
         {
            _loc1_ = new Array();
            groupChildrenWithTag(WindowController.TAG_INTERNAL,_loc1_,true);
            _loc2_ = 0;
            while(_loc2_ < _loc1_.length)
            {
               IWindow(_loc1_[_loc2_]).disable();
               _loc2_++;
            }
            return true;
         }
         return false;
      }
      
      public function get scrollV() : Number
      {
         return !!this._horizontal ? 0 : Number(this._offset);
      }
      
      private function resolveScrollTarget() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:* = 0;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         if(this.var_18 != null)
         {
            if(!this.var_18.disposed)
            {
               return true;
            }
         }
         if(this.var_884 != null)
         {
            _loc1_ = findParentByName(this.var_884) as IScrollableWindow;
            if(_loc1_ == null && var_13 is IWindowContainer)
            {
               _loc1_ = IWindowContainer(var_13).findChildByName(this.var_884) as IScrollableWindow;
               if(_loc1_)
               {
                  this.scrollable = _loc1_;
                  return true;
               }
            }
         }
         if(var_13 is IScrollableWindow)
         {
            this.scrollable = IScrollableWindow(var_13);
            return true;
         }
         if(var_13 is IWindowContainer && !(var_13 is IDesktopWindow))
         {
            _loc2_ = uint(IWindowContainer(var_13).numChildren);
            _loc4_ = 0;
            while(_loc4_ < _loc2_)
            {
               _loc3_ = IWindowContainer(var_13).getChildAt(_loc4_) as IScrollableWindow;
               if(_loc3_)
               {
                  this.scrollable = _loc3_;
                  return true;
               }
               _loc4_++;
            }
         }
         return false;
      }
      
      public function get scrollable() : IScrollableWindow
      {
         return this.var_18;
      }
      
      private function scrollButtonEventProc(param1:WindowEvent, param2:IWindow) : void
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc3_:Boolean = false;
         if(param1.type == WindowMouseEvent.const_39 || param1.type == WindowTouchEvent.const_399)
         {
            if(param2.name == const_1206)
            {
               if(this.var_18)
               {
                  this.var_1104 = true;
                  if(this._horizontal)
                  {
                     this.scrollH += this.var_18.scrollStepH / this.var_18.maxScrollH;
                  }
                  else
                  {
                     this.scrollV += this.var_18.scrollStepV / this.var_18.maxScrollV;
                  }
                  this.var_1104 = false;
               }
            }
            else if(param2.name == const_1207)
            {
               if(this.var_18)
               {
                  this.var_1104 = true;
                  if(this._horizontal)
                  {
                     this.scrollH -= this.var_18.scrollStepH / this.var_18.maxScrollH;
                  }
                  else
                  {
                     this.scrollV -= this.var_18.scrollStepV / this.var_18.maxScrollV;
                  }
                  this.var_1104 = false;
               }
            }
            else if(param2.name == const_859)
            {
               if(param1 is WindowMouseEvent)
               {
                  _loc4_ = WindowMouseEvent(param1).localX;
                  _loc5_ = WindowMouseEvent(param1).localY;
               }
               else if(param1 is WindowTouchEvent)
               {
                  _loc4_ = WindowTouchEvent(param1).localX;
                  _loc5_ = WindowTouchEvent(param1).localY;
               }
               _loc6_ = WindowController(param2).getChildByName(ScrollbarController.const_541).rectangle;
               if(this._horizontal)
               {
                  if(_loc4_ < _loc6_.x)
                  {
                     this.scrollH -= (this.var_18.visibleRegion.width - this.var_18.scrollStepH) / this.var_18.maxScrollH;
                  }
                  else if(_loc4_ > _loc6_.right)
                  {
                     this.scrollH += (this.var_18.visibleRegion.width - this.var_18.scrollStepH) / this.var_18.maxScrollH;
                  }
               }
               else if(_loc5_ < _loc6_.y)
               {
                  this.scrollV -= (this.var_18.visibleRegion.height - this.var_18.scrollStepV) / this.var_18.maxScrollV;
               }
               else if(_loc5_ > _loc6_.bottom)
               {
                  this.scrollV += (this.var_18.visibleRegion.height - this.var_18.scrollStepV) / this.var_18.maxScrollV;
               }
               _loc3_ = true;
            }
         }
         if(param1.type == WindowMouseEvent.const_291)
         {
            if(WindowMouseEvent(param1).delta > 0)
            {
               if(this._horizontal)
               {
                  this.scrollH -= this.var_604;
               }
               else
               {
                  this.scrollV -= this.var_604;
               }
            }
            else if(this._horizontal)
            {
               this.scrollH += this.var_604;
            }
            else
            {
               this.scrollV += this.var_604;
            }
            _loc3_ = true;
         }
         if(_loc3_)
         {
            this.updateLiftSizeAndPosition();
         }
      }
      
      override public function get properties() : Array
      {
         var _loc1_:Array = super.properties;
         var _loc2_:String = "";
         if(this.var_18 is IWindow)
         {
            _loc2_ = IWindow(this.var_18).name;
         }
         else if(this.var_884 != null)
         {
            _loc2_ = this.var_884;
         }
         _loc1_.push(new PropertyStruct("scrollable",_loc2_,"String",_loc2_ != ""));
         return _loc1_;
      }
      
      public function get vertical() : Boolean
      {
         return !this._horizontal;
      }
      
      private function updateLiftSizeAndPosition() : void
      {
         var _loc1_:* = NaN;
         var _loc4_:int = 0;
         if(this.var_18 == null || this.var_18.disposed)
         {
            if(_disposed || !this.resolveScrollTarget())
            {
               return;
            }
         }
         var _loc2_:WindowController = this.track;
         var _loc3_:WindowController = this.lift;
         if(_loc3_ != null)
         {
            if(this._horizontal)
            {
               _loc1_ = Number(this.var_18.visibleRegion.width / this.var_18.scrollableRegion.width);
               if(_loc1_ > 1)
               {
                  _loc1_ = 1;
               }
               _loc4_ = _loc1_ * _loc2_.width;
               _loc3_.width = _loc4_;
               _loc3_.x = this.var_18.scrollH * (_loc2_.width - _loc4_);
            }
            else
            {
               _loc1_ = Number(this.var_18.visibleRegion.height / this.var_18.scrollableRegion.height);
               if(_loc1_ > 1)
               {
                  _loc1_ = 1;
               }
               _loc4_ = _loc1_ * _loc2_.height;
               _loc3_.height = _loc4_;
               _loc3_.y = this.var_18.scrollV * (_loc2_.height - _loc4_);
            }
         }
         if(_loc1_ == 1)
         {
            this.disable();
         }
         else
         {
            this.enable();
         }
      }
      
      private function onScrollableResized(param1:Event) : void
      {
         this.updateLiftSizeAndPosition();
         this.setScrollPosition(this._offset);
      }
      
      public function set scrollH(param1:Number) : void
      {
         if(this._horizontal)
         {
            if(this.setScrollPosition(param1))
            {
               this.updateLiftSizeAndPosition();
            }
         }
      }
   }
}
