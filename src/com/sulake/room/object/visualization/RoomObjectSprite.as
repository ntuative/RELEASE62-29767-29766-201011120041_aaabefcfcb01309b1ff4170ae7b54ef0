package com.sulake.room.object.visualization
{
   import flash.display.BitmapData;
   import flash.geom.Point;
   
   public final class RoomObjectSprite implements IRoomObjectSprite
   {
      
      private static var var_952:int = 0;
       
      
      private var _updateID:int = 0;
      
      private var var_2027:Boolean = false;
      
      private var var_2026:String = "normal";
      
      private var var_1631:String = "";
      
      private var _instanceId:int = 0;
      
      private var var_336:Boolean = true;
      
      private var _height:int = 0;
      
      private var var_2023:int = 255;
      
      private var _color:int = 16777215;
      
      private var var_1154:Boolean = false;
      
      private var var_1155:Boolean = false;
      
      private var var_2025:Boolean = false;
      
      private var _offset:Point;
      
      private var var_2024:Boolean = true;
      
      private var var_1498:Array;
      
      private var var_1122:Number = 0;
      
      private var _width:int = 0;
      
      private var var_2021:String = "";
      
      private var var_343:BitmapData = null;
      
      public function RoomObjectSprite()
      {
         this._offset = new Point(0,0);
         this.var_1498 = [];
         super();
         this._instanceId = var_952++;
      }
      
      public function set filters(param1:Array) : void
      {
         this.var_1498 = param1;
         ++this._updateID;
      }
      
      public function set flipV(param1:Boolean) : void
      {
         this.var_1155 = param1;
         ++this._updateID;
      }
      
      public function set clickHandling(param1:Boolean) : void
      {
         this.var_2025 = param1;
         ++this._updateID;
      }
      
      public function dispose() : void
      {
         this.var_343 = null;
         this._width = 0;
         this._height = 0;
      }
      
      public function get offsetX() : int
      {
         return this._offset.x;
      }
      
      public function get offsetY() : int
      {
         return this._offset.y;
      }
      
      public function get height() : int
      {
         return this._height;
      }
      
      public function set blendMode(param1:String) : void
      {
         this.var_2026 = param1;
         ++this._updateID;
      }
      
      public function set tag(param1:String) : void
      {
         this.var_2021 = param1;
         ++this._updateID;
      }
      
      public function set assetName(param1:String) : void
      {
         this.var_1631 = param1;
         ++this._updateID;
      }
      
      public function get varyingDepth() : Boolean
      {
         return this.var_2027;
      }
      
      public function set offsetX(param1:int) : void
      {
         this._offset.x = param1;
         ++this._updateID;
      }
      
      public function set offsetY(param1:int) : void
      {
         this._offset.y = param1;
         ++this._updateID;
      }
      
      public function get relativeDepth() : Number
      {
         return this.var_1122;
      }
      
      public function get color() : int
      {
         return this._color;
      }
      
      public function get alpha() : int
      {
         return this.var_2023;
      }
      
      public function set capturesMouse(param1:Boolean) : void
      {
         this.var_2024 = param1;
         ++this._updateID;
      }
      
      public function get visible() : Boolean
      {
         return this.var_336;
      }
      
      public function set varyingDepth(param1:Boolean) : void
      {
         this.var_2027 = param1;
         ++this._updateID;
      }
      
      public function get flipH() : Boolean
      {
         return this.var_1154;
      }
      
      public function get flipV() : Boolean
      {
         return this.var_1155;
      }
      
      public function get clickHandling() : Boolean
      {
         return this.var_2025;
      }
      
      public function get blendMode() : String
      {
         return this.var_2026;
      }
      
      public function get instanceId() : int
      {
         return this._instanceId;
      }
      
      public function get tag() : String
      {
         return this.var_2021;
      }
      
      public function get assetName() : String
      {
         return this.var_1631;
      }
      
      public function set relativeDepth(param1:Number) : void
      {
         this.var_1122 = param1;
         ++this._updateID;
      }
      
      public function get capturesMouse() : Boolean
      {
         return this.var_2024;
      }
      
      public function set alpha(param1:int) : void
      {
         param1 &= 255;
         this.var_2023 = param1;
         ++this._updateID;
      }
      
      public function get updateId() : int
      {
         return this._updateID;
      }
      
      public function get width() : int
      {
         return this._width;
      }
      
      public function set color(param1:int) : void
      {
         param1 &= 16777215;
         this._color = param1;
         ++this._updateID;
      }
      
      public function set asset(param1:BitmapData) : void
      {
         if(param1 != null)
         {
            this._width = param1.width;
            this._height = param1.height;
         }
         this.var_343 = param1;
         ++this._updateID;
      }
      
      public function set visible(param1:Boolean) : void
      {
         this.var_336 = param1;
         ++this._updateID;
      }
      
      public function get asset() : BitmapData
      {
         return this.var_343;
      }
      
      public function get filters() : Array
      {
         return this.var_1498;
      }
      
      public function set flipH(param1:Boolean) : void
      {
         this.var_1154 = param1;
         ++this._updateID;
      }
   }
}
