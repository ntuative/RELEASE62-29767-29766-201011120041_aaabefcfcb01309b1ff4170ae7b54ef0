package com.sulake.core.window.graphics.renderer
{
   import flash.geom.Rectangle;
   
   public class SkinLayoutEntity implements ISkinLayoutEntity
   {
      
      public static const const_275:uint = 1;
      
      public static const const_439:uint = 0;
      
      public static const const_956:uint = 8;
      
      public static const const_294:uint = 4;
      
      public static const const_447:uint = 2;
       
      
      private var var_667:uint;
      
      private var var_2375:uint;
      
      private var _color:uint;
      
      private var _name:String;
      
      private var var_2374:uint;
      
      private var _region:Rectangle;
      
      private var var_734:Array;
      
      private var _id:uint;
      
      public function SkinLayoutEntity(param1:uint, param2:String, param3:Rectangle, param4:uint = 4.294967295E9, param5:uint = 100, param6:uint = 0, param7:uint = 0)
      {
         super();
         this._id = param1;
         this._name = param2;
         this._region = param3;
         this._color = param4;
         this.var_667 = param5;
         this.var_2375 = param6;
         this.var_2374 = param7;
         this.var_734 = new Array();
      }
      
      public function get scaleH() : uint
      {
         return this.var_2375;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get blend() : uint
      {
         return this.var_667;
      }
      
      public function get scaleV() : uint
      {
         return this.var_2374;
      }
      
      public function get tags() : Array
      {
         return this.var_734;
      }
      
      public function get id() : uint
      {
         return this._id;
      }
      
      public function dispose() : void
      {
         this._region = null;
         this.var_734 = null;
      }
      
      public function get color() : uint
      {
         return this._color;
      }
      
      public function get region() : Rectangle
      {
         return this._region;
      }
   }
}
