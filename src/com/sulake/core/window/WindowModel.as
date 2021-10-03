package com.sulake.core.window
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.enum.WindowState;
   import com.sulake.core.window.utils.IRectLimiter;
   import com.sulake.core.window.utils.WindowRectLimits;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class WindowModel implements IDisposable
   {
       
      
      protected var _disposed:Boolean = false;
      
      protected var var_337:Rectangle;
      
      protected var _param:uint;
      
      protected var var_125:Rectangle;
      
      protected var _type:uint;
      
      protected var var_735:Boolean = true;
      
      protected var var_124:Rectangle;
      
      protected var var_399:uint = 16777215;
      
      protected var _state:uint;
      
      protected var var_398:uint = 10;
      
      protected var var_75:uint;
      
      protected var var_336:Boolean = true;
      
      protected var var_246:String = "";
      
      protected var var_69:WindowRectLimits;
      
      protected var var_1135:uint;
      
      protected var var_490:Boolean = false;
      
      protected var var_667:Number = 1.0;
      
      protected var var_55:Rectangle;
      
      protected var _id:uint;
      
      protected var _name:String;
      
      protected var var_11:Rectangle;
      
      protected var var_17:WindowContext;
      
      protected var var_734:Array;
      
      public function WindowModel(param1:uint, param2:String, param3:uint, param4:uint, param5:uint, param6:WindowContext, param7:Rectangle, param8:Array = null)
      {
         super();
         this._id = param1;
         this._name = param2;
         this._type = param3;
         this._param = param5;
         this._state = WindowState.const_87;
         this.var_75 = param4;
         this.var_734 = param8 == null ? new Array() : param8;
         this.var_17 = param6;
         this.var_11 = param7.clone();
         this.var_337 = param7.clone();
         this.var_55 = param7.clone();
         this.var_124 = new Rectangle();
         this.var_125 = null;
         this.var_69 = new WindowRectLimits(this as IWindow);
      }
      
      public function getMinHeight() : int
      {
         return this.var_69.minHeight;
      }
      
      public function testTypeFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (this._type & param2 ^ param1) == 0;
         }
         return (this._type & param1) == param1;
      }
      
      public function getMinWidth() : int
      {
         return this.var_69.minWidth;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get param() : uint
      {
         return this._param;
      }
      
      public function get state() : uint
      {
         return this._state;
      }
      
      public function getMaximizedWidth() : int
      {
         return this.var_125.width;
      }
      
      public function getMinimizedHeight() : int
      {
         return this.var_124.height;
      }
      
      public function get limits() : IRectLimiter
      {
         return this.var_69;
      }
      
      public function get tags() : Array
      {
         return this.var_734;
      }
      
      public function get id() : uint
      {
         return this._id;
      }
      
      public function testStateFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (this._state & param2 ^ param1) == 0;
         }
         return (this._state & param1) == param1;
      }
      
      public function dispose() : void
      {
         if(!this._disposed)
         {
            this._disposed = true;
            this.var_11 = null;
            this._state = WindowState.const_476;
            this.var_734 = null;
         }
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get height() : int
      {
         return this.var_11.height;
      }
      
      public function get position() : Point
      {
         return this.var_11.topLeft;
      }
      
      public function get background() : Boolean
      {
         return this.var_490;
      }
      
      public function get context() : IWindowContext
      {
         return this.var_17;
      }
      
      public function get mouseTreshold() : uint
      {
         return this.var_398;
      }
      
      public function get style() : uint
      {
         return this.var_75;
      }
      
      public function invalidate(param1:Rectangle = null) : void
      {
      }
      
      public function testParamFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (this._param & param2 ^ param1) == 0;
         }
         return (this._param & param1) == param1;
      }
      
      public function testStyleFlag(param1:uint, param2:uint = 0) : Boolean
      {
         if(param2 > 0)
         {
            return (this.var_75 & param2 ^ param1) == 0;
         }
         return (this.var_75 & param1) == param1;
      }
      
      public function getMaxWidth() : int
      {
         return this.var_69.maxWidth;
      }
      
      public function hasMaxHeight() : Boolean
      {
         return this.var_69.maxHeight < int.MAX_VALUE;
      }
      
      public function get type() : uint
      {
         return this._type;
      }
      
      public function get clipping() : Boolean
      {
         return this.var_735;
      }
      
      public function setMinWidth(param1:int) : int
      {
         var _loc2_:int = this.var_69.minWidth;
         this.var_69.minWidth = param1;
         return _loc2_;
      }
      
      public function get width() : int
      {
         return this.var_11.width;
      }
      
      public function hasMinHeight() : Boolean
      {
         return this.var_69.minHeight > int.MIN_VALUE;
      }
      
      public function get blend() : Number
      {
         return this.var_667;
      }
      
      public function getInitialHeight() : int
      {
         return this.var_337.height;
      }
      
      public function getMinimizedWidth() : int
      {
         return this.var_124.width;
      }
      
      public function setMinHeight(param1:int) : int
      {
         var _loc2_:int = this.var_69.minHeight;
         this.var_69.minHeight = param1;
         return _loc2_;
      }
      
      public function getInitialWidth() : int
      {
         return this.var_337.width;
      }
      
      public function getPreviousWidth() : int
      {
         return this.var_55.width;
      }
      
      public function hasMinWidth() : Boolean
      {
         return this.var_69.minWidth > int.MIN_VALUE;
      }
      
      public function get color() : uint
      {
         return this.var_399;
      }
      
      public function setMaxHeight(param1:int) : int
      {
         var _loc2_:int = this.var_69.maxHeight;
         this.var_69.maxHeight = param1;
         return _loc2_;
      }
      
      public function get caption() : String
      {
         return this.var_246;
      }
      
      public function get rectangle() : Rectangle
      {
         return this.var_11;
      }
      
      public function setMaxWidth(param1:int) : int
      {
         var _loc2_:int = this.var_69.maxWidth;
         this.var_69.maxWidth = param1;
         return _loc2_;
      }
      
      public function get visible() : Boolean
      {
         return this.var_336;
      }
      
      public function getMaxHeight() : int
      {
         return this.var_69.maxHeight;
      }
      
      public function get x() : int
      {
         return this.var_11.x;
      }
      
      public function get y() : int
      {
         return this.var_11.y;
      }
      
      public function getPreviousHeight() : int
      {
         return this.var_55.height;
      }
      
      public function hasMaxWidth() : Boolean
      {
         return this.var_69.maxWidth < int.MAX_VALUE;
      }
      
      public function getMaximizedHeight() : int
      {
         return this.var_125.height;
      }
   }
}
