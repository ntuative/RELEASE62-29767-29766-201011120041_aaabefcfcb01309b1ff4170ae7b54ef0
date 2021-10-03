package com.sulake.habbo.room.object.visualization.room
{
   import com.sulake.habbo.room.object.visualization.room.mask.PlaneMaskManager;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.IPlaneRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.animated.LandscapeRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.FloorRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallAdRasterizer;
   import com.sulake.habbo.room.object.visualization.room.rasterizer.basic.WallRasterizer;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.utils.IGraphicAssetCollection;
   
   public class RoomVisualizationData implements IRoomObjectVisualizationData
   {
       
      
      private var var_456:FloorRasterizer;
      
      private var var_815:Boolean = false;
      
      private var var_686:PlaneMaskManager;
      
      private var var_455:WallRasterizer;
      
      private var var_685:WallAdRasterizer;
      
      private var var_454:LandscapeRasterizer;
      
      public function RoomVisualizationData()
      {
         super();
         this.var_455 = new WallRasterizer();
         this.var_456 = new FloorRasterizer();
         this.var_685 = new WallAdRasterizer();
         this.var_454 = new LandscapeRasterizer();
         this.var_686 = new PlaneMaskManager();
      }
      
      public function get wallRasterizer() : IPlaneRasterizer
      {
         return this.var_455;
      }
      
      public function get wallAdRasterizr() : WallAdRasterizer
      {
         return this.var_685;
      }
      
      public function get floorRasterizer() : IPlaneRasterizer
      {
         return this.var_456;
      }
      
      public function get initialized() : Boolean
      {
         return this.var_815;
      }
      
      protected function reset() : void
      {
      }
      
      public function get maskManager() : PlaneMaskManager
      {
         return this.var_686;
      }
      
      public function dispose() : void
      {
         if(this.var_455 != null)
         {
            this.var_455.dispose();
            this.var_455 = null;
         }
         if(this.var_456 != null)
         {
            this.var_456.dispose();
            this.var_456 = null;
         }
         if(this.var_685 != null)
         {
            this.var_685.dispose();
            this.var_685 = null;
         }
         if(this.var_454 != null)
         {
            this.var_454.dispose();
            this.var_454 = null;
         }
         if(this.var_686 != null)
         {
            this.var_686.dispose();
            this.var_686 = null;
         }
      }
      
      public function initialize(param1:XML) : Boolean
      {
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         this.reset();
         if(param1 == null)
         {
            return false;
         }
         var _loc2_:XMLList = param1.wallData;
         if(_loc2_.length() > 0)
         {
            _loc7_ = _loc2_[0];
            this.var_455.initialize(_loc7_);
         }
         var _loc3_:XMLList = param1.floorData;
         if(_loc3_.length() > 0)
         {
            _loc8_ = _loc3_[0];
            this.var_456.initialize(_loc8_);
         }
         var _loc4_:XMLList = param1.wallAdData;
         if(_loc4_.length() > 0)
         {
            _loc9_ = _loc4_[0];
            this.var_685.initialize(_loc9_);
         }
         var _loc5_:XMLList = param1.landscapeData;
         if(_loc5_.length() > 0)
         {
            _loc10_ = _loc5_[0];
            this.var_454.initialize(_loc10_);
         }
         var _loc6_:XMLList = param1.maskData;
         if(_loc6_.length() > 0)
         {
            _loc11_ = _loc6_[0];
            this.var_686.initialize(_loc11_);
         }
         return true;
      }
      
      public function clearCache() : void
      {
         if(this.var_455 != null)
         {
            this.var_455.clearCache();
         }
         if(this.var_456 != null)
         {
            this.var_456.clearCache();
         }
         if(this.var_454 != null)
         {
            this.var_454.clearCache();
         }
      }
      
      public function get landscapeRasterizer() : IPlaneRasterizer
      {
         return this.var_454;
      }
      
      public function initializeAssetCollection(param1:IGraphicAssetCollection) : void
      {
         if(this.var_815)
         {
            return;
         }
         this.var_455.initializeAssetCollection(param1);
         this.var_456.initializeAssetCollection(param1);
         this.var_685.initializeAssetCollection(param1);
         this.var_454.initializeAssetCollection(param1);
         this.var_686.initializeAssetCollection(param1);
         this.var_815 = true;
      }
   }
}
