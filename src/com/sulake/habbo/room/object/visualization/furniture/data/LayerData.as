package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class LayerData
   {
      
      public static const const_455:int = 255;
      
      public static const INK_DARKEN:int = 3;
      
      public static const const_397:int = 0;
      
      public static const const_933:int = 2;
      
      public static const const_869:int = 1;
      
      public static const const_689:Boolean = false;
      
      public static const const_665:String = "";
      
      public static const const_504:int = 0;
      
      public static const const_469:int = 0;
      
      public static const const_435:int = 0;
       
      
      private var var_2473:int = 0;
      
      private var var_2021:String = "";
      
      private var var_1559:int = 0;
      
      private var var_2474:int = 0;
      
      private var var_2476:Number = 0;
      
      private var var_2023:int = 255;
      
      private var var_2475:Boolean = false;
      
      public function LayerData()
      {
         super();
      }
      
      public function get yOffset() : int
      {
         return this.var_2473;
      }
      
      public function method_4(param1:LayerData) : void
      {
         if(param1 != null)
         {
            this.tag = param1.tag;
            this.ink = param1.ink;
            this.alpha = param1.alpha;
            this.ignoreMouse = param1.ignoreMouse;
            this.xOffset = param1.xOffset;
            this.yOffset = param1.yOffset;
            this.zOffset = param1.zOffset;
         }
      }
      
      public function set ink(param1:int) : void
      {
         this.var_1559 = param1;
      }
      
      public function get zOffset() : Number
      {
         return this.var_2476;
      }
      
      public function set xOffset(param1:int) : void
      {
         this.var_2474 = param1;
      }
      
      public function set yOffset(param1:int) : void
      {
         this.var_2473 = param1;
      }
      
      public function get tag() : String
      {
         return this.var_2021;
      }
      
      public function get alpha() : int
      {
         return this.var_2023;
      }
      
      public function get ink() : int
      {
         return this.var_1559;
      }
      
      public function set zOffset(param1:Number) : void
      {
         this.var_2476 = param1;
      }
      
      public function get xOffset() : int
      {
         return this.var_2474;
      }
      
      public function set ignoreMouse(param1:Boolean) : void
      {
         this.var_2475 = param1;
      }
      
      public function get ignoreMouse() : Boolean
      {
         return this.var_2475;
      }
      
      public function set tag(param1:String) : void
      {
         this.var_2021 = param1;
      }
      
      public function set alpha(param1:int) : void
      {
         this.var_2023 = param1;
      }
   }
}
