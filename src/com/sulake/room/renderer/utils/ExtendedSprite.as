package com.sulake.room.renderer.utils
{
   import flash.display.Bitmap;
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public class ExtendedSprite extends Bitmap
   {
       
      
      private var var_1230:Boolean = false;
      
      private var _height:int = 0;
      
      private var var_2571:Point;
      
      private var var_1534:String = "";
      
      private var _width:int = 0;
      
      private var var_1511:int = -1;
      
      private var var_2027:Boolean = false;
      
      private var var_2025:Boolean = false;
      
      private var var_2021:String = "";
      
      private var _bitmapData:ExtendedBitmapData = null;
      
      private var var_1512:int = -1;
      
      private var var_1229:int = 128;
      
      public function ExtendedSprite()
      {
         super();
         this.var_2571 = new Point();
         cacheAsBitmap = false;
         this.enableAlpha();
      }
      
      public function get alphaActive() : Boolean
      {
         return this.var_1230;
      }
      
      override public function hitTestPoint(param1:Number, param2:Number, param3:Boolean = false) : Boolean
      {
         return this.hitTest(param1,param2);
      }
      
      public function get clickHandling() : Boolean
      {
         return this.var_2025;
      }
      
      public function hitTest(param1:int, param2:int) : Boolean
      {
         if(this.var_1229 > 255 || bitmapData == null)
         {
            return false;
         }
         if(param1 < 0 || param2 < 0 || param1 >= this._width || param2 >= this._height)
         {
            return false;
         }
         return this.hitTestBitmapData(param1,param2);
      }
      
      public function get alphaTolerance() : int
      {
         return this.var_1229;
      }
      
      private function hitTestBitmapData(param1:int, param2:int) : Boolean
      {
         var pixel:uint = 0;
         var x:int = param1;
         var y:int = param2;
         var retVal:Boolean = false;
         try
         {
            if(!this.var_1230 || true)
            {
               retVal = true;
            }
            else
            {
               pixel = bitmapData.getPixel32(x,y);
               pixel >>= 24;
               retVal = pixel > this.var_1229;
            }
         }
         catch(e:Error)
         {
         }
         return retVal;
      }
      
      public function set identifier(param1:String) : void
      {
         this.var_1534 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_2021;
      }
      
      public function set clickHandling(param1:Boolean) : void
      {
         this.var_2025 = param1;
      }
      
      public function enableAlpha() : void
      {
         this.disableAlpha();
         this.var_1230 = true;
      }
      
      public function set alphaTolerance(param1:int) : void
      {
         this.var_1229 = param1;
      }
      
      public function needsUpdate(param1:int, param2:int) : Boolean
      {
         if(param1 != this.var_1512 || param2 != this.var_1511)
         {
            this.var_1512 = param1;
            this.var_1511 = param2;
            return true;
         }
         if(this._bitmapData != null && this._bitmapData.disposed)
         {
            return true;
         }
         return false;
      }
      
      public function get identifier() : String
      {
         return this.var_1534;
      }
      
      public function set varyingDepth(param1:Boolean) : void
      {
         this.var_2027 = param1;
      }
      
      public function dispose() : void
      {
         if(this._bitmapData != null)
         {
            this._bitmapData.dispose();
            this._bitmapData = null;
         }
      }
      
      override public function set bitmapData(param1:BitmapData) : void
      {
         var _loc2_:* = null;
         if(param1 == bitmapData)
         {
            return;
         }
         if(this._bitmapData != null)
         {
            this._bitmapData.dispose();
            this._bitmapData = null;
         }
         if(param1 != null)
         {
            this._width = param1.width;
            this._height = param1.height;
            _loc2_ = param1 as ExtendedBitmapData;
            if(_loc2_ != null)
            {
               _loc2_.addReference();
               this._bitmapData = _loc2_;
            }
         }
         else
         {
            this._width = 0;
            this._height = 0;
            this.var_1512 = -1;
            this.var_1511 = -1;
         }
         super.bitmapData = param1;
      }
      
      public function get varyingDepth() : Boolean
      {
         return this.var_2027;
      }
      
      public function set tag(param1:String) : void
      {
         this.var_2021 = param1;
      }
      
      public function disableAlpha() : void
      {
         this.var_1230 = false;
      }
   }
}
