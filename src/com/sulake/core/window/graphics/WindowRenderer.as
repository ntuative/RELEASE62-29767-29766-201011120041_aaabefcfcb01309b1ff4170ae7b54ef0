package com.sulake.core.window.graphics
{
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContext;
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.components.IDesktopWindow;
   import com.sulake.core.window.enum.WindowParam;
   import com.sulake.core.window.events.WindowDisposeEvent;
   import flash.display.BitmapData;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.Dictionary;
   
   public class WindowRenderer implements IWindowRenderer
   {
       
      
      private var var_1325:Rectangle;
      
      private var _disposed:Boolean;
      
      private var var_744:ISkinContainer;
      
      private var var_323:Dictionary;
      
      private var _drawBufferAllocator:DrawBufferAllocator;
      
      private var _debug:Boolean = false;
      
      private var var_702:Array;
      
      private var var_269:Rectangle;
      
      private var var_1705:Point;
      
      public function WindowRenderer(param1:ISkinContainer)
      {
         super();
         this._disposed = false;
         this.var_702 = new Array();
         this.var_1705 = new Point();
         this.var_1325 = new Rectangle();
         this.var_269 = new Rectangle();
         this.var_323 = new Dictionary(true);
         this.var_744 = param1;
         this._drawBufferAllocator = new DrawBufferAllocator();
      }
      
      private static function getDrawLocationAndClipRegion(param1:WindowController, param2:Rectangle, param3:Point, param4:Rectangle) : Boolean
      {
         var _loc7_:int = 0;
         var _loc5_:Rectangle = param1.rectangle.clone();
         var _loc6_:Boolean = true;
         param4.x = 0;
         param4.y = 0;
         param4.width = _loc5_.width;
         param4.height = _loc5_.height;
         if(!param1.testParamFlag(WindowParam.const_31))
         {
            param3.x = 0;
            param3.y = 0;
            if(param1.parent && param1.testParamFlag(WindowParam.WINDOW_PARAM_FORCE_CLIPPING))
            {
               return Boolean(WindowController(param1.parent).childRectToClippedDrawRegion(_loc5_,param4));
            }
         }
         else if(param1.parent)
         {
            _loc6_ = WindowController(param1.parent).childRectToClippedDrawRegion(_loc5_,param4);
            param3.x = _loc5_.x;
            param3.y = _loc5_.y;
         }
         else
         {
            param3.x = 0;
            param3.y = 0;
         }
         if(param2.x > param4.x)
         {
            _loc7_ = param2.x - param4.x;
            param3.x += _loc7_;
            param4.x += _loc7_;
            param4.width -= _loc7_;
         }
         if(param2.y > param4.y)
         {
            _loc7_ = param2.y - param4.y;
            param3.y += _loc7_;
            param4.y += _loc7_;
            param4.height -= _loc7_;
         }
         if(param2.right < param4.right)
         {
            _loc7_ = param4.right - param2.right;
            param4.width -= _loc7_;
         }
         if(param2.bottom < param4.bottom)
         {
            _loc7_ = param4.bottom - param2.bottom;
            param4.height -= _loc7_;
         }
         return _loc6_ && param4.width > 0 && param4.height > 0;
      }
      
      public function getDrawBufferForRenderable(param1:IWindow) : BitmapData
      {
         var _loc2_:WindowRendererItem = this.var_323[param1] as WindowRendererItem;
         return _loc2_ != null ? _loc2_.buffer : null;
      }
      
      public function update(param1:uint) : void
      {
         this.render();
         this.flushRenderQueue();
      }
      
      public function get debug() : Boolean
      {
         return this._debug;
      }
      
      public function render() : void
      {
         var _loc1_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         var _loc2_:uint = this.var_702.length;
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            _loc1_ = this.var_702.pop() as WindowController;
            if(!_loc1_.disposed)
            {
               _loc3_ = this.getWindowRendererItem(_loc1_);
               this.var_269.x = _loc3_.dirty.x;
               this.var_269.y = _loc3_.dirty.y;
               this.var_269.width = _loc3_.dirty.width;
               this.var_269.height = _loc3_.dirty.height;
               this.renderWindowBranch(_loc1_,_loc3_,this.var_269);
            }
            _loc4_++;
         }
      }
      
      public function removeRenderable(param1:IWindow) : void
      {
         param1.removeEventListener(WindowDisposeEvent.const_735,this.windowDisposedCallback);
         var _loc2_:WindowRendererItem = this.var_323[param1] as WindowRendererItem;
         if(_loc2_ != null)
         {
            _loc2_.dispose();
            delete this.var_323[param1];
         }
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         if(!this._disposed)
         {
            this._disposed = true;
            this.var_702 = null;
            for(_loc1_ in this.var_323)
            {
               delete this.var_323[_loc1_];
            }
            this.var_323 = null;
            this._drawBufferAllocator.dispose();
            this._drawBufferAllocator = null;
         }
      }
      
      public function get allocatedByteCount() : uint
      {
         return this._drawBufferAllocator.allocatedByteCount;
      }
      
      private function windowDisposedCallback(param1:WindowDisposeEvent) : void
      {
         this.removeRenderable(param1.window);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function set debug(param1:Boolean) : void
      {
         this._debug = param1;
      }
      
      private function renderWindowBranch(param1:WindowController, param2:WindowRendererItem, param3:Rectangle) : void
      {
         var _loc4_:* = 0;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:int = 0;
         if(param1.visible)
         {
            if(getDrawLocationAndClipRegion(param1,param3,this.var_1705,this.var_1325))
            {
               if(param2.render(param1,this.var_1705,this.var_1325))
               {
                  _loc4_ = uint(param1.numChildren);
                  if(param1.clipping)
                  {
                     _loc6_ = new Rectangle(Math.max(param3.x,0),Math.max(param3.y,0),Math.min(param3.width,param1.width),Math.min(param3.height,param1.height));
                  }
                  else
                  {
                     _loc6_ = param3;
                  }
                  _loc8_ = 0;
                  while(_loc8_ < _loc4_)
                  {
                     _loc5_ = param1.getChildAt(_loc8_) as WindowController;
                     _loc7_ = _loc5_.rectangle;
                     if(_loc7_.intersects(_loc6_))
                     {
                        if(_loc5_.testParamFlag(WindowParam.const_31))
                        {
                           _loc6_.offset(-_loc7_.x,-_loc7_.y);
                           this.renderWindowBranch(_loc5_,this.getWindowRendererItem(_loc5_),_loc6_);
                           _loc6_.offset(_loc7_.x,_loc7_.y);
                        }
                        else if(_loc5_.testParamFlag(WindowParam.WINDOW_PARAM_FORCE_CLIPPING))
                        {
                           this.renderWindowBranch(_loc5_,this.getWindowRendererItem(_loc5_),_loc6_);
                        }
                     }
                     _loc8_++;
                  }
               }
            }
            else if(!param1.testParamFlag(WindowParam.const_31))
            {
               if(param1.testParamFlag(WindowParam.WINDOW_PARAM_FORCE_CLIPPING))
               {
                  param1.getGraphicContext(false).setDrawRegion(param1.rectangle,false,this.var_1325);
               }
            }
         }
      }
      
      public function registerRenderable(param1:IWindow) : void
      {
         var _loc2_:WindowRendererItem = this.var_323[param1] as WindowRendererItem;
         if(_loc2_ == null)
         {
            _loc2_ = new WindowRendererItem(this,this._drawBufferAllocator,this.var_744);
            this.var_323[param1] = _loc2_;
            param1.addEventListener(WindowDisposeEvent.const_735,this.windowDisposedCallback);
         }
      }
      
      public function invalidate(param1:IWindowContext, param2:Rectangle) : void
      {
         var _loc5_:* = null;
         var _loc3_:IDesktopWindow = param1.getDesktopWindow();
         var _loc4_:uint = _loc3_.numChildren;
         while(_loc4_-- > 0)
         {
            _loc5_ = _loc3_.getChildAt(_loc4_) as WindowController;
            this.addToRenderQueue(_loc5_,_loc5_.rectangle,WindowRedrawFlag.const_76);
         }
      }
      
      protected function getWindowRendererItem(param1:IWindow) : WindowRendererItem
      {
         var _loc2_:WindowRendererItem = this.var_323[param1] as WindowRendererItem;
         if(_loc2_ == null)
         {
            this.registerRenderable(param1);
            _loc2_ = this.var_323[param1];
         }
         return _loc2_;
      }
      
      public function flushRenderQueue() : void
      {
         while(this.var_702.pop() != null)
         {
         }
      }
      
      public function addToRenderQueue(param1:IWindow, param2:Rectangle, param3:uint) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(this.getWindowRendererItem(param1).invalidate(param1,param2,param3))
         {
            _loc5_ = param1.context.getDesktopWindow();
            this.var_269.x = param2.x - param1.x;
            this.var_269.y = param2.y - param1.y;
            this.var_269.width = param2.width;
            this.var_269.height = param2.height;
            if(param1.testParamFlag(WindowParam.const_31))
            {
               while(param1.testParamFlag(WindowParam.const_31))
               {
                  _loc4_ = param1.parent as WindowController;
                  if(_loc4_ == null)
                  {
                     return;
                  }
                  if(_loc4_ == _loc5_)
                  {
                     return;
                  }
                  if(_loc4_.visible == false)
                  {
                     return;
                  }
                  this.var_269.offset(param1.x,param1.y);
                  param1 = _loc4_;
               }
            }
            this.getWindowRendererItem(param1).invalidate(param1,this.var_269,WindowRedrawFlag.const_939);
            if(this.var_702.indexOf(param1) == -1)
            {
               this.var_702.push(param1);
            }
         }
      }
   }
}
