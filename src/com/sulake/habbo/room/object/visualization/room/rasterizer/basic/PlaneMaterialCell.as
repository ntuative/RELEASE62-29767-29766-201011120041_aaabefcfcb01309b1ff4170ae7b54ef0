package com.sulake.habbo.room.object.visualization.room.rasterizer.basic
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.habbo.room.object.visualization.room.utils.Randomizer;
   import com.sulake.room.object.visualization.utils.IGraphicAsset;
   import com.sulake.room.utils.IVector3d;
   import flash.display.BitmapData;
   import flash.geom.Matrix;
   import flash.geom.Point;
   
   public class PlaneMaterialCell
   {
       
      
      private var var_517:PlaneTexture;
      
      private var var_774:Array;
      
      private var var_965:int = 0;
      
      private var var_28:BitmapData = null;
      
      private var _extraItemOffsets:Array;
      
      public function PlaneMaterialCell(param1:PlaneTexture, param2:Array = null, param3:Array = null, param4:int = 0)
      {
         var _loc5_:int = 0;
         var _loc6_:* = null;
         var _loc7_:* = null;
         this._extraItemOffsets = [];
         this.var_774 = [];
         super();
         this.var_517 = param1;
         if(param2 != null && param2.length > 0 && param4 > 0)
         {
            _loc5_ = 0;
            _loc5_ = 0;
            while(_loc5_ < param2.length)
            {
               _loc6_ = param2[_loc5_] as IGraphicAsset;
               if(_loc6_ != null)
               {
                  this.var_774.push(_loc6_);
               }
               _loc5_++;
            }
            if(this.var_774.length > 0)
            {
               if(param3 != null)
               {
                  _loc5_ = 0;
                  while(_loc5_ < param3.length)
                  {
                     _loc7_ = param3[_loc5_] as Point;
                     if(_loc7_ != null)
                     {
                        this._extraItemOffsets.push(new Point(_loc7_.x,_loc7_.y));
                     }
                     _loc5_++;
                  }
               }
               this.var_965 = param4;
            }
         }
      }
      
      public function render(param1:IVector3d) : BitmapData
      {
         var _loc2_:* = null;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:* = null;
         var _loc13_:* = NaN;
         var _loc14_:* = NaN;
         var _loc15_:* = NaN;
         var _loc16_:* = NaN;
         var _loc17_:* = 0;
         if(this.var_517 != null)
         {
            _loc2_ = this.var_517.getBitmap(param1);
            if(_loc2_ != null)
            {
               if(!this.isStatic)
               {
                  if(this.var_28 != null)
                  {
                     if(this.var_28.width != _loc2_.width || this.var_28.height != _loc2_.height)
                     {
                        this.var_28.dispose();
                        this.var_28 = null;
                     }
                     else
                     {
                        this.var_28.copyPixels(_loc2_,_loc2_.rect,new Point(0,0));
                     }
                  }
                  if(this.var_28 == null)
                  {
                     this.var_28 = _loc2_.clone();
                  }
                  _loc3_ = Math.min(this.var_965,this._extraItemOffsets.length);
                  _loc4_ = Math.max(this.var_965,this._extraItemOffsets.length);
                  _loc5_ = Randomizer.getArray(this.var_965,_loc4_);
                  _loc6_ = 0;
                  while(_loc6_ < _loc3_)
                  {
                     _loc7_ = this._extraItemOffsets[_loc5_[_loc6_]] as Point;
                     _loc8_ = this.var_774[_loc6_ % this.var_774.length] as IGraphicAsset;
                     if(_loc7_ != null && _loc8_ != null)
                     {
                        _loc9_ = _loc8_.asset as BitmapDataAsset;
                        if(_loc9_ != null)
                        {
                           _loc10_ = _loc9_.content as BitmapData;
                           if(_loc10_ != null)
                           {
                              _loc11_ = new Point(_loc7_.x + _loc8_.offsetX,_loc7_.y + _loc8_.offsetY);
                              _loc12_ = new Matrix();
                              _loc13_ = 1;
                              _loc14_ = 1;
                              _loc15_ = 0;
                              _loc16_ = 0;
                              if(_loc8_.flipH)
                              {
                                 _loc13_ = -1;
                                 _loc15_ = Number(_loc10_.width);
                              }
                              if(_loc8_.flipV)
                              {
                                 _loc14_ = -1;
                                 _loc16_ = Number(_loc10_.height);
                              }
                              _loc17_ = int(_loc11_.x + _loc15_);
                              _loc17_ = _loc17_ >> 1 << 1;
                              _loc12_.scale(_loc13_,_loc14_);
                              _loc12_.translate(_loc17_,_loc11_.y + _loc16_);
                              this.var_28.draw(_loc10_,_loc12_);
                           }
                        }
                     }
                     _loc6_++;
                  }
                  return this.var_28;
               }
               return _loc2_;
            }
         }
         return null;
      }
      
      public function dispose() : void
      {
         if(this.var_517 != null)
         {
            this.var_517.dispose();
            this.var_517 = null;
         }
         if(this.var_28 != null)
         {
            this.var_28.dispose();
            this.var_28 = null;
         }
         this.var_774 = null;
         this._extraItemOffsets = null;
      }
      
      public function clearCache() : void
      {
         if(this.var_28 != null)
         {
            this.var_28.dispose();
            this.var_28 = null;
         }
      }
      
      public function get isStatic() : Boolean
      {
         return this.var_965 == 0;
      }
      
      public function getHeight(param1:IVector3d) : int
      {
         var _loc2_:* = null;
         if(this.var_517 != null)
         {
            _loc2_ = this.var_517.getBitmap(param1);
            if(_loc2_ != null)
            {
               return _loc2_.height;
            }
         }
         return 0;
      }
   }
}
