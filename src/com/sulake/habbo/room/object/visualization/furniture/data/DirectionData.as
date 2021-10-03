package com.sulake.habbo.room.object.visualization.furniture.data
{
   public class DirectionData
   {
       
      
      private var var_101:Array;
      
      public function DirectionData(param1:int)
      {
         var _loc3_:* = null;
         this.var_101 = [];
         super();
         var _loc2_:int = 0;
         while(_loc2_ < param1)
         {
            _loc3_ = new LayerData();
            this.var_101.push(_loc3_);
            _loc2_++;
         }
      }
      
      public function getTag(param1:int) : String
      {
         var _loc2_:LayerData = this.getLayer(param1);
         if(_loc2_ != null)
         {
            return _loc2_.tag;
         }
         return LayerData.const_665;
      }
      
      public function method_4(param1:DirectionData) : void
      {
         if(param1 == null)
         {
            return;
         }
         if(this.layerCount != param1.layerCount)
         {
            return;
         }
         var _loc2_:* = null;
         var _loc3_:* = null;
         var _loc4_:int = 0;
         while(_loc4_ < this.layerCount)
         {
            _loc2_ = this.getLayer(_loc4_);
            _loc3_ = param1.getLayer(_loc4_);
            if(_loc2_)
            {
               _loc2_.method_4(_loc3_);
            }
            _loc4_++;
         }
      }
      
      public function getAlpha(param1:int) : int
      {
         var _loc2_:LayerData = this.getLayer(param1);
         if(_loc2_ != null)
         {
            return _loc2_.alpha;
         }
         return LayerData.const_455;
      }
      
      public function setXOffset(param1:int, param2:int) : void
      {
         var _loc3_:LayerData = this.getLayer(param1);
         if(_loc3_ != null)
         {
            _loc3_.xOffset = param2;
         }
      }
      
      public function setYOffset(param1:int, param2:int) : void
      {
         var _loc3_:LayerData = this.getLayer(param1);
         if(_loc3_ != null)
         {
            _loc3_.yOffset = param2;
         }
      }
      
      public function setInk(param1:int, param2:int) : void
      {
         var _loc3_:LayerData = this.getLayer(param1);
         if(_loc3_ != null)
         {
            _loc3_.ink = param2;
         }
      }
      
      public function getInk(param1:int) : int
      {
         var _loc2_:LayerData = this.getLayer(param1);
         if(_loc2_ != null)
         {
            return _loc2_.ink;
         }
         return LayerData.const_397;
      }
      
      public function setIgnoreMouse(param1:int, param2:Boolean) : void
      {
         var _loc3_:LayerData = this.getLayer(param1);
         if(_loc3_ != null)
         {
            _loc3_.ignoreMouse = param2;
         }
      }
      
      public function setZOffset(param1:int, param2:Number) : void
      {
         var _loc3_:LayerData = this.getLayer(param1);
         if(_loc3_ != null)
         {
            _loc3_.zOffset = param2;
         }
      }
      
      public function getXOffset(param1:int) : int
      {
         var _loc2_:LayerData = this.getLayer(param1);
         if(_loc2_ != null)
         {
            return _loc2_.xOffset;
         }
         return LayerData.const_435;
      }
      
      public function getYOffset(param1:int) : int
      {
         var _loc2_:LayerData = this.getLayer(param1);
         if(_loc2_ != null)
         {
            return _loc2_.yOffset;
         }
         return LayerData.const_469;
      }
      
      public function getZOffset(param1:int) : Number
      {
         var _loc2_:LayerData = this.getLayer(param1);
         if(_loc2_ != null)
         {
            return _loc2_.zOffset;
         }
         return LayerData.const_504;
      }
      
      public function setTag(param1:int, param2:String) : void
      {
         var _loc3_:LayerData = this.getLayer(param1);
         if(_loc3_ != null)
         {
            _loc3_.tag = param2;
         }
      }
      
      private function getLayer(param1:int) : LayerData
      {
         if(param1 < 0 || param1 >= this.layerCount)
         {
            return null;
         }
         return this.var_101[param1];
      }
      
      public function setAlpha(param1:int, param2:int) : void
      {
         var _loc3_:LayerData = this.getLayer(param1);
         if(_loc3_ != null)
         {
            _loc3_.alpha = param2;
         }
      }
      
      public function getIgnoreMouse(param1:int) : Boolean
      {
         var _loc2_:LayerData = this.getLayer(param1);
         if(_loc2_ != null)
         {
            return _loc2_.ignoreMouse;
         }
         return LayerData.const_689;
      }
      
      public function get layerCount() : int
      {
         return this.var_101.length;
      }
      
      public function dispose() : void
      {
         this.var_101 = null;
      }
   }
}
