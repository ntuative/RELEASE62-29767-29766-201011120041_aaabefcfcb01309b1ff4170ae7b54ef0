package com.sulake.habbo.avatar.cache
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.AvatarImageBodyPartContainer;
   import com.sulake.habbo.avatar.AvatarImagePartContainer;
   import com.sulake.habbo.avatar.AvatarStructure;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.actions.IActiveActionData;
   import com.sulake.habbo.avatar.alias.AssetAliasCollection;
   import com.sulake.habbo.avatar.animation.Animation;
   import com.sulake.habbo.avatar.animation.AnimationLayerData;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarBodyPartType;
   import com.sulake.habbo.avatar.enum.AvatarDirectionAngle;
   import com.sulake.habbo.avatar.enum.AvatarScaleType;
   import com.sulake.habbo.avatar.enum.GeometryType;
   import com.sulake.habbo.avatar.palette.PaletteMap;
   import com.sulake.habbo.avatar.structure.AvatarCanvas;
   import flash.display.BitmapData;
   import flash.geom.ColorTransform;
   import flash.geom.Point;
   import flash.geom.Rectangle;
   import flash.utils.ByteArray;
   import flash.utils.Dictionary;
   import flash.utils.getTimer;
   
   public class AvatarImageCache
   {
      
      private static const const_1489:int = 60000;
       
      
      private var var_212:Map;
      
      private var _disposed:Boolean;
      
      private var var_359:AvatarImageBodyPartContainer;
      
      private var var_751:Point;
      
      private var var_1404:String;
      
      private var var_1872:Point;
      
      private var _assets:AssetAliasCollection;
      
      private var var_607:String;
      
      private var var_151:String;
      
      private var var_1873:ImageData;
      
      private var var_1403:PaletteMap;
      
      private var var_1871:ByteArray;
      
      private var _scale:String;
      
      private var _bodyPartCache:AvatarImageBodyPartCache;
      
      private var var_1161:String;
      
      private var var_132:AvatarImagePartContainer;
      
      private var var_150:BitmapData;
      
      private var var_752:BitmapData;
      
      private var var_288:IActiveActionData;
      
      private var var_750:Array;
      
      private var _frame:int;
      
      private var var_343:BitmapDataAsset;
      
      private var var_82:AvatarStructure;
      
      private var var_503:AvatarCanvas;
      
      private var var_932:String;
      
      private var var_1271:IAvatarImage;
      
      public function AvatarImageCache(param1:AvatarStructure, param2:IAvatarImage, param3:AssetAliasCollection, param4:String)
      {
         this.var_750 = new Array();
         super();
         this.var_82 = param1;
         this.var_1271 = param2;
         this._assets = param3;
         this._scale = param4;
         this.var_212 = new Map();
      }
      
      private function createUnionImage(param1:Array, param2:Boolean) : ImageData
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc3_:Rectangle = new Rectangle();
         for each(_loc4_ in param1)
         {
            _loc3_ = _loc3_.union(_loc4_.offsetRect);
         }
         _loc5_ = new Point(-_loc3_.left,-_loc3_.top);
         _loc6_ = new BitmapData(_loc3_.width,_loc3_.height,true,16777215);
         for each(_loc4_ in param1)
         {
            _loc7_ = _loc5_.subtract(_loc4_.regpoint);
            _loc6_.copyPixels(_loc4_.bitmap,_loc4_.bitmap.rect,_loc7_,null,null,true);
         }
         return new ImageData(_loc6_,_loc5_,param2);
      }
      
      public function getBodyPartCache(param1:String) : AvatarImageBodyPartCache
      {
         var _loc2_:AvatarImageBodyPartCache = this.var_212.getValue(param1) as AvatarImageBodyPartCache;
         if(_loc2_ == null)
         {
            _loc2_ = new AvatarImageBodyPartCache();
            this.var_212.add(param1,_loc2_);
         }
         return _loc2_;
      }
      
      public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         if(this._disposed)
         {
            return;
         }
         this.var_82 = null;
         this.var_1271 = null;
         this._assets = null;
         if(this.var_212 != null)
         {
            _loc2_ = this.var_212.getKeys();
            for each(_loc3_ in _loc2_)
            {
               _loc1_ = this.var_212.getValue(_loc3_) as AvatarImageBodyPartCache;
               if(_loc1_ != null)
               {
                  _loc1_.dispose();
               }
            }
            this.var_212.dispose();
            this.var_212 = null;
         }
         this.var_503 = null;
         this.var_343 = null;
         this.var_752 = null;
         if(this.var_150)
         {
            this.var_150.dispose();
         }
         this.var_150 = null;
         this._disposed = true;
      }
      
      private function debugInfo(param1:String) : void
      {
         Logger.log("[AvatarImagecache] " + param1);
      }
      
      public function setAction(param1:IActiveActionData, param2:int) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc3_:Array = this.var_82.getActiveBodyPartIds(param1);
         for each(_loc4_ in _loc3_)
         {
            _loc5_ = this.getBodyPartCache(_loc4_);
            if(_loc5_ != null)
            {
               _loc5_.setAction(param1,param2);
            }
         }
      }
      
      public function setDirection(param1:String, param2:int) : void
      {
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc3_:Array = this.var_82.getBodyPartsUnordered(param1);
         for each(_loc5_ in _loc3_)
         {
            _loc4_ = this.getBodyPartCache(_loc5_);
            if(_loc4_ != null)
            {
               _loc4_.setDirection(param2);
            }
         }
      }
      
      public function resetBodyPartCache(param1:IActiveActionData) : void
      {
         var _loc2_:* = null;
         var _loc4_:* = null;
         var _loc3_:Array = this.var_212.getKeys();
         for each(_loc4_ in _loc3_)
         {
            _loc2_ = this.var_212.getValue(_loc4_) as AvatarImageBodyPartCache;
            if(_loc2_ != null)
            {
               _loc2_.setAction(param1,0);
            }
         }
      }
      
      public function setGeometryType(param1:String) : void
      {
         if(this.var_607 == param1)
         {
            return;
         }
         if(this.var_607 == GeometryType.const_995 && param1 == GeometryType.const_978 || this.var_607 == GeometryType.const_978 && param1 == GeometryType.const_995)
         {
            this.var_607 = param1;
            this.var_503 = null;
            return;
         }
         this.disposeInactiveActions(0);
         this.var_607 = param1;
         this.var_503 = null;
      }
      
      public function getImageContainer(param1:String, param2:int) : AvatarImageBodyPartContainer
      {
         var _loc11_:int = 0;
         var _loc12_:* = null;
         var _loc13_:int = 0;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = null;
         this._bodyPartCache = this.getBodyPartCache(param1);
         if(this._bodyPartCache == null)
         {
            this._bodyPartCache = new AvatarImageBodyPartCache();
            this.var_212.add(param1,this._bodyPartCache);
         }
         var _loc3_:int = this._bodyPartCache.getDirection();
         var _loc4_:int = param2;
         this.var_288 = this._bodyPartCache.getAction();
         var _loc5_:IActiveActionData = this.var_288;
         var _loc6_:* = [];
         var _loc7_:Dictionary = new Dictionary();
         var _loc8_:Point = new Point();
         if(!(!this.var_288 || !this.var_288.definition))
         {
            if(this.var_288.definition.isAnimation)
            {
               _loc11_ = _loc3_;
               _loc12_ = this.var_82.getAnimation(this.var_288.definition.state + "." + this.var_288.actionParameter);
               _loc13_ = param2 - this.var_288.startFrame;
               if(_loc12_ != null)
               {
                  _loc14_ = _loc12_.getLayerData(_loc13_,param1,this.var_288.overridingAction);
                  if(_loc14_ != null)
                  {
                     _loc11_ = _loc3_ + _loc14_.directionOffset;
                     if(_loc14_.directionOffset < 0)
                     {
                        if(_loc11_ < 0)
                        {
                           _loc11_ = 8 + _loc11_;
                        }
                        else if(_loc11_ > 7)
                        {
                           _loc11_ = 8 - _loc11_;
                        }
                     }
                     else if(_loc11_ < 0)
                     {
                        _loc11_ += 8;
                     }
                     else if(_loc11_ > 7)
                     {
                        _loc11_ -= 8;
                     }
                     if(this._scale == AvatarScaleType.const_47)
                     {
                        _loc8_.x = _loc14_.dx;
                        _loc8_.y = _loc14_.dy;
                     }
                     else
                     {
                        _loc8_.x = _loc14_.dx / 2;
                        _loc8_.y = _loc14_.dy / 2;
                     }
                     _loc4_ = _loc14_.animationFrame;
                     if(_loc14_.action != null)
                     {
                        this.var_288 = _loc14_.action;
                     }
                     if(_loc14_.type == AnimationLayerData.const_564)
                     {
                        if(_loc14_.action != null)
                        {
                           _loc5_ = _loc14_.action;
                        }
                        _loc3_ = _loc11_;
                     }
                     else if(_loc14_.type == AnimationLayerData.const_407)
                     {
                        _loc3_ = _loc11_;
                     }
                  }
                  _loc6_ = _loc12_.removeData;
                  _loc7_ = _loc14_.items;
               }
            }
         }
         var _loc9_:AvatarImageActionCache = this._bodyPartCache.getActionCache(_loc5_);
         if(_loc9_ == null)
         {
            _loc9_ = new AvatarImageActionCache();
            this._bodyPartCache.updateActionCache(_loc5_,_loc9_);
         }
         var _loc10_:AvatarImageDirectionCache = _loc9_.getDirectionCache(_loc3_);
         if(_loc10_ == null)
         {
            _loc15_ = this.var_82.getParts(param1,this.var_1271.getFigure(),_loc5_,this.var_607,_loc3_,_loc6_,_loc7_);
            _loc10_ = new AvatarImageDirectionCache(_loc15_);
            _loc9_.updateDirectionCache(_loc3_,_loc10_);
         }
         this.var_359 = _loc10_.getImageContainer(_loc4_);
         if(this.var_359 == null)
         {
            _loc16_ = _loc10_.getPartList();
            this.var_359 = this.renderBodyPart(_loc3_,_loc16_,_loc4_,this.var_288);
            if(this.var_359 == null)
            {
               return null;
            }
            _loc10_.updateImageContainer(this.var_359,_loc4_);
         }
         this.var_359.offset = _loc8_;
         return this.var_359;
      }
      
      private function renderBodyPart(param1:int, param2:Array, param3:int, param4:IActiveActionData) : AvatarImageBodyPartContainer
      {
         var _loc7_:Boolean = false;
         var _loc8_:int = 0;
         var _loc15_:* = null;
         var _loc16_:* = NaN;
         var _loc17_:* = null;
         var _loc18_:* = null;
         if(param2 == null)
         {
            return null;
         }
         if(param2.length == 0)
         {
            return null;
         }
         if(!this.var_503)
         {
            this.var_503 = this.var_82.getCanvas(this._scale,this.var_607);
            if(!this.var_503)
            {
               return null;
            }
            this.var_1872 = new Point(0,this.var_503.height - int(this.var_503.width / 4));
         }
         var _loc5_:int = param1;
         var _loc6_:Boolean = AvatarDirectionAngle.const_1292[param1];
         var _loc9_:String = param4.definition.assetPartDefinition;
         var _loc10_:String = param4.definition.state;
         var _loc11_:Boolean = _loc10_ == AvatarAction.const_701 || _loc10_ == AvatarAction.const_370;
         var _loc12_:int = param2.length - 1;
         _loc8_ = _loc12_;
         while(_loc8_ >= 0)
         {
            this.var_132 = param2[_loc8_] as AvatarImagePartContainer;
            this.var_1161 = this.var_132.bodyPartId;
            this.var_151 = this.var_132.partType;
            this.var_1404 = this.var_132.partId;
            this._frame = this.var_132.getFrameIndex(param3);
            _loc5_ = param1;
            _loc7_ = false;
            if(_loc6_)
            {
               if(_loc9_ == "wav" && (this.var_151 == "lh" || this.var_151 == "ls" || this.var_151 == "lc" || this.var_151 == "lhs"))
               {
                  _loc7_ = true;
               }
               else if(_loc9_ == "drk" && (this.var_151 == "rh" || this.var_151 == "rs" || this.var_151 == "rc" || this.var_151 == "rhs"))
               {
                  _loc7_ = true;
               }
               else if(_loc9_ == "crr" && this.var_151 == "rhs")
               {
                  _loc7_ = true;
               }
               else if(this.var_151 == "ri")
               {
                  _loc7_ = true;
               }
               else if(this.var_151 == "cp")
               {
                  _loc7_ = true;
               }
               else
               {
                  if(param1 == 4)
                  {
                     _loc5_ = 2;
                  }
                  else if(param1 == 5)
                  {
                     _loc5_ = 1;
                  }
                  else if(param1 == 6)
                  {
                     _loc5_ = 0;
                  }
                  if(this.var_132.flippedPartType != this.var_151)
                  {
                     this.var_151 = this.var_132.flippedPartType;
                  }
               }
            }
            this.var_932 = this._scale + "_" + this.var_132.action.assetPartDefinition + "_" + this.var_151 + "_" + this.var_1404 + "_" + _loc5_ + "_" + this._frame;
            this.var_343 = this._assets.getAssetByName(this.var_932) as BitmapDataAsset;
            if(this.var_343 == null)
            {
               this.var_932 = this._scale + "_std_" + this.var_151 + "_" + this.var_1404 + "_" + _loc5_ + "_0";
               this.var_343 = this._assets.getAssetByName(this.var_932) as BitmapDataAsset;
            }
            if(!this.var_343 || !this.var_343.content)
            {
               Logger.log("renderBodyPart could not find required asset: " + this.var_932);
            }
            else
            {
               if(this.var_132.paletteMapId > -1)
               {
                  this.var_1403 = this.var_82.renderManager.paletteManager.getPalette(this.var_132.paletteMapId);
                  if(this.var_1403 != null)
                  {
                     this.var_752 = this.var_343.content as BitmapData;
                     this.var_150 = new BitmapData(this.var_752.width,this.var_752.height);
                     this.var_1871 = this.var_1403.colorize(this.var_752.getPixels(this.var_752.rect));
                     this.var_150.setPixels(this.var_150.rect,this.var_1871);
                  }
                  else
                  {
                     this.var_150 = (this.var_343.content as BitmapData).clone();
                  }
               }
               else
               {
                  this.var_150 = (this.var_343.content as BitmapData).clone();
               }
               if(this.var_150 == null)
               {
                  return null;
               }
               if(_loc11_ && (this.var_1161 == AvatarBodyPartType.const_234 || this.var_1161 == AvatarBodyPartType.const_1327 || this.var_1161 == AvatarBodyPartType.const_1410) && this.var_132.color != null)
               {
                  _loc16_ = 0.7;
                  _loc17_ = this.var_132.color.colorTransform;
                  _loc18_ = new ColorTransform(_loc17_.redMultiplier * _loc16_,_loc17_.greenMultiplier * _loc16_ + 0.3,_loc17_.blueMultiplier * _loc16_ + 0.3,_loc17_.alphaMultiplier,0,0,20);
                  this.var_150.colorTransform(this.var_150.rect,_loc18_);
               }
               else if(this.var_132.isColorable && this.var_132.color != null)
               {
                  this.var_150.colorTransform(this.var_150.rect,this.var_132.color.colorTransform);
               }
               if(this.var_132.isBlendable)
               {
                  this.var_150.colorTransform(this.var_150.rect,this.var_132.blendTransform);
               }
               this.var_751 = this.var_343.offset.clone();
               if(_loc7_)
               {
                  if(this._scale == AvatarScaleType.const_47)
                  {
                     this.var_751.x += 65;
                  }
                  else
                  {
                     this.var_751.x += 31;
                  }
               }
               this.var_1873 = new ImageData(this.var_150,this.var_751,_loc7_);
               this.var_750.push(this.var_1873);
            }
            _loc8_--;
         }
         if(this.var_750.length == 0)
         {
            return null;
         }
         var _loc13_:ImageData = this.createUnionImage(this.var_750,_loc6_);
         var _loc14_:Point = new Point(-1 * _loc13_.regpoint.x,this.var_1872.y - _loc13_.regpoint.y);
         if(_loc6_)
         {
            if(this._scale == AvatarScaleType.const_47)
            {
               _loc14_.x += 67;
            }
            else
            {
               _loc14_.x += 31;
            }
         }
         _loc8_ = this.var_750.length - 1;
         while(_loc8_ >= 0)
         {
            _loc15_ = this.var_750.pop();
            if(_loc15_)
            {
               _loc15_.dispose();
            }
            _loc8_--;
         }
         return new AvatarImageBodyPartContainer(_loc13_.bitmap,_loc14_);
      }
      
      public function disposeInactiveActions(param1:int = 60000) : void
      {
         var _loc3_:* = null;
         var _loc5_:* = null;
         var _loc2_:int = getTimer();
         var _loc4_:Array = this.var_212.getKeys();
         for each(_loc5_ in _loc4_)
         {
            _loc3_ = this.var_212.getValue(_loc5_) as AvatarImageBodyPartCache;
            if(_loc3_ != null)
            {
               _loc3_.disposeActions(param1,_loc2_);
            }
         }
      }
   }
}
