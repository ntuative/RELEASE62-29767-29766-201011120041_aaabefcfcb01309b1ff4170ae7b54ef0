package com.sulake.habbo.room.object.visualization.pet
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IPetImageListener;
   import com.sulake.habbo.avatar.animation.IAnimationLayerData;
   import com.sulake.habbo.avatar.animation.ISpriteDataContainer;
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.avatar.enum.AvatarSetType;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import com.sulake.room.object.visualization.IRoomObjectSprite;
   import com.sulake.room.object.visualization.IRoomObjectVisualizationData;
   import com.sulake.room.object.visualization.RoomObjectSpriteVisualization;
   import com.sulake.room.utils.IRoomGeometry;
   import flash.display.BitmapData;
   import flash.display.BlendMode;
   
   public class PetVisualization extends RoomObjectSpriteVisualization implements IPetImageListener
   {
      
      private static const const_819:int = 2;
      
      private static const const_1126:Array = [0,0,0];
       
      
      private var var_597:String;
      
      private const const_1502:int = 1;
      
      private var var_295:String = "";
      
      private var var_1015:int = 0;
      
      private var var_911:Boolean = false;
      
      private var var_2197:int = 0;
      
      private var var_1221:String = "";
      
      private var var_1496:Boolean = false;
      
      private var var_853:Boolean;
      
      private const const_1127:int = 3;
      
      private var var_1223:String = "";
      
      private var var_52:IAvatarImage = null;
      
      private var var_1016:int = 0;
      
      private const const_1769:int = 3;
      
      private var var_1432:int = -1;
      
      private var var_1569:Boolean = false;
      
      private var var_1493:int = -1;
      
      private var var_500:int = 0;
      
      private var _updateTimes:Array;
      
      private const const_820:int = 0;
      
      private var var_1495:Boolean = false;
      
      private var var_1497:int = -1;
      
      private var var_358:ExperienceData;
      
      private var var_1494:Number = NaN;
      
      private var var_985:Boolean = false;
      
      private var var_1222:Boolean = false;
      
      private var var_532:BitmapDataAsset;
      
      private const const_1497:int = 2;
      
      private var var_1262:int = 0;
      
      private var var_788:PetVisualizationData = null;
      
      private var var_443:Map;
      
      private var var_1568:Boolean = false;
      
      public function PetVisualization()
      {
         super();
         this._updateTimes = new Array();
         this.var_443 = new Map();
         this.var_853 = false;
      }
      
      public function imageReady() : void
      {
         this.var_1569 = true;
      }
      
      private function updateActions(param1:IAvatarImage) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.initActionAppends();
         param1.appendAction(AvatarAction.const_362,this.var_295,this.var_1223);
         if(this.var_1221 != null && this.var_1221 != "")
         {
            param1.appendAction(AvatarAction.const_256,this.var_1221);
         }
         if(this.var_1496 || this.var_1222)
         {
            param1.appendAction(AvatarAction.const_405);
         }
         param1.endActionAppends();
         var _loc2_:int = param1.getSprites().length + this.const_1127;
         if(_loc2_ != spriteCount)
         {
            createSprites(_loc2_);
         }
      }
      
      private function validateActions() : void
      {
         var _loc1_:int = 0;
         this.var_1568 = false;
         switch(this.var_295)
         {
            case AvatarAction.const_475:
            case AvatarAction.const_949:
            case AvatarAction.const_900:
            case AvatarAction.const_930:
            case AvatarAction.const_1039:
            case AvatarAction.const_908:
            case AvatarAction.const_773:
            case AvatarAction.const_259:
            case AvatarAction.const_204:
               this.var_1568 = true;
         }
         this.var_1495 = false;
         this.var_985 = false;
         if(this.var_295 == "lay")
         {
            this.var_985 = true;
            _loc1_ = int(this.var_1223);
            if(_loc1_ < 0)
            {
               this.var_1495 = true;
            }
         }
      }
      
      public function get disposed() : Boolean
      {
         return this.var_911;
      }
      
      private function resetAvatarImages() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_443)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         this.var_443.reset();
         this.var_52 = null;
      }
      
      public function petImageReady(param1:String) : void
      {
         this.resetAvatarImages();
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         this.var_788 = param1 as PetVisualizationData;
         createSprites(this.const_1127);
         this.var_358 = new ExperienceData(this.var_788);
         return true;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         var _loc3_:* = null;
         super.dispose();
         if(this.var_443 != null)
         {
            _loc1_ = this.var_443.getKeys();
            for each(_loc2_ in _loc1_)
            {
               _loc3_ = this.var_443.getValue(_loc2_) as IAvatarImage;
               _loc3_.dispose();
            }
         }
         this.var_443.dispose();
         if(this.var_358)
         {
            this.var_358.dispose();
         }
         this.var_358 = null;
         this.var_788 = null;
         this.var_911 = true;
      }
      
      private function updateShadow(param1:Number) : void
      {
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1502);
         this.var_532 = null;
         _loc2_ = getSprite(this.const_1502);
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(param1 < 48)
         {
            this.var_532 = this.var_52.getAsset("sh_std_sd_1_0_0");
            _loc3_ = -8;
            _loc4_ = -3;
         }
         else
         {
            this.var_532 = this.var_52.getAsset("h_std_sd_1_0_0");
            _loc3_ = -17;
            _loc4_ = -7;
         }
         if(this.var_532)
         {
            _loc2_.asset = this.var_532.content as BitmapData;
            _loc2_.offsetX = _loc3_;
            _loc2_.offsetY = _loc4_;
            _loc2_.alpha = 50;
            _loc2_.relativeDepth = 1;
         }
         else
         {
            _loc2_.asset = null;
         }
      }
      
      private function getAvatarImage(param1:Number) : IAvatarImage
      {
         var _loc2_:String = "avatarImage" + param1.toString();
         var _loc3_:IAvatarImage = this.var_443.getValue(_loc2_) as IAvatarImage;
         if(_loc3_ == null)
         {
            _loc3_ = this.var_788.getAvatar(this.var_597,param1,this);
            if(_loc3_ != null)
            {
               this.var_443.add(_loc2_,_loc3_);
            }
         }
         return _loc3_;
      }
      
      private function updateModel(param1:IRoomObjectModel, param2:Number) : Boolean
      {
         var _loc3_:* = null;
         if(param1.getUpdateID() != var_209)
         {
            this.var_1496 = param1.getNumber(RoomObjectVariableEnum.const_391) > 0;
            this.var_1221 = param1.getString(RoomObjectVariableEnum.const_298);
            this.var_295 = param1.getString(RoomObjectVariableEnum.const_392);
            this.var_1223 = param1.getString(RoomObjectVariableEnum.const_676);
            this.var_1494 = param1.getNumber(RoomObjectVariableEnum.const_314);
            this.var_1262 = param1.getNumber(RoomObjectVariableEnum.const_880);
            this.var_2197 = param1.getNumber(RoomObjectVariableEnum.const_1078);
            this.validateActions();
            _loc3_ = param1.getString(RoomObjectVariableEnum.const_162);
            if(this.var_597 != _loc3_)
            {
               this.var_597 = _loc3_;
               this.resetAvatarImages();
            }
            var_209 = param1.getUpdateID();
            return true;
         }
         return false;
      }
      
      override public function update(param1:IRoomGeometry, param2:int, param3:Boolean) : void
      {
         var _loc12_:int = 0;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:int = 0;
         var _loc16_:int = 0;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:int = 0;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:* = null;
         var _loc26_:* = null;
         var _loc4_:IRoomObject = object;
         if(_loc4_ == null)
         {
            return;
         }
         if(param1 == null)
         {
            return;
         }
         if(this.var_788 == null)
         {
            return;
         }
         var _loc5_:IRoomObjectModel = _loc4_.getModel();
         if(this.var_1569)
         {
            this.var_1569 = false;
            this.var_1015 = 0;
            this.var_1016 = 1;
            this.resetAvatarImages();
         }
         var _loc6_:Number = param1.scale;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = this.updateModel(_loc5_,_loc6_);
         if(_loc9_ || _loc6_ != var_244 || this.var_52 == null)
         {
            if(_loc6_ != var_244)
            {
               var_244 = _loc6_;
               _loc7_ = true;
            }
            if(_loc7_ || this.var_52 == null)
            {
               this.var_52 = this.getAvatarImage(_loc6_);
            }
            if(this.var_52 == null)
            {
               return;
            }
            if(_loc7_)
            {
               this.updateShadow(_loc6_);
            }
            _loc8_ = this.updateObject(_loc4_,param1,true);
            this.updateActions(this.var_52);
         }
         else
         {
            _loc8_ = this.updateObject(_loc4_,param1);
         }
         var _loc10_:Boolean = _loc8_ || _loc9_ || _loc7_;
         var _loc11_:Boolean = this.var_853 || this.var_1016 > 0 || this.var_1568;
         this.var_358.alpha = 0;
         if(this.var_1262 > 0)
         {
            _loc12_ = param2 - this.var_1262;
            if(_loc12_ < AvatarAction.const_958)
            {
               this.var_358.alpha = int(Math.sin(_loc12_ / 0 * 0) * 255);
               this.var_358.setExperience(this.var_2197);
               this.var_1016 = this.const_1769;
            }
            else
            {
               this.var_1262 = 0;
            }
            _loc13_ = getSprite(this.const_1497);
            if(_loc13_ != null)
            {
               if(this.var_358.alpha > 0)
               {
                  _loc13_.asset = this.var_358.image;
                  _loc13_.offsetX = -20;
                  _loc13_.offsetY = -80;
                  _loc13_.alpha = this.var_358.alpha;
                  _loc13_.visible = true;
               }
               else
               {
                  _loc13_.asset = null;
                  _loc13_.visible = false;
               }
            }
         }
         if(_loc10_ || _loc11_)
         {
            increaseUpdateId();
            --this.var_1016;
            ++this.var_500;
            --this.var_1015;
            if(!(this.var_1015 <= 0 || _loc7_))
            {
               return;
            }
            this.var_52.updateAnimationByFrames(1);
            this.var_1015 = const_819;
            this.var_853 = this.var_52.isAnimating();
            _loc14_ = this.var_52.getCanvasOffsets();
            if(_loc14_ == null || _loc14_.length < 3)
            {
               _loc14_ = const_1126;
            }
            _loc15_ = 0;
            if(object.getLocation().z > 0)
            {
               _loc15_ = Math.min(_loc6_ / 2.75,0);
            }
            _loc13_ = getSprite(this.const_820);
            if(_loc13_)
            {
               _loc18_ = this.var_52.getImage(AvatarSetType.const_32,false);
               if(_loc18_ != null)
               {
                  _loc13_.asset = _loc18_;
               }
               if(_loc6_ < 48)
               {
                  _loc13_.offsetX = -16 + _loc14_[0];
                  _loc13_.offsetY = -_loc13_.asset.height + 8 + _loc14_[1] + _loc15_;
               }
               else
               {
                  _loc13_.offsetX = -32 + _loc14_[0];
                  _loc13_.offsetY = -_loc13_.asset.height + 16 + _loc14_[1] + _loc15_;
               }
            }
            _loc16_ = this.const_1127;
            for each(_loc17_ in this.var_52.getSprites())
            {
               _loc13_ = getSprite(_loc16_);
               if(_loc13_ != null)
               {
                  _loc19_ = this.var_52.getLayerData(_loc17_);
                  _loc20_ = 0;
                  _loc21_ = _loc17_.getDirectionOffsetX(this.var_52.getDirection());
                  _loc22_ = _loc17_.getDirectionOffsetY(this.var_52.getDirection());
                  _loc23_ = _loc17_.getDirectionOffsetZ(this.var_52.getDirection());
                  _loc24_ = 0;
                  if(_loc17_.hasDirections)
                  {
                     _loc24_ = this.var_52.getDirection();
                  }
                  if(_loc19_ != null)
                  {
                     _loc20_ = _loc19_.animationFrame;
                     _loc21_ += _loc19_.dx;
                     _loc22_ += _loc19_.dy;
                     _loc24_ += _loc19_.directionOffset;
                  }
                  if(_loc6_ < 48)
                  {
                     _loc21_ /= 2;
                     _loc22_ /= 2;
                  }
                  if(_loc24_ < 0)
                  {
                     _loc24_ += 8;
                  }
                  if(_loc24_ > 7)
                  {
                     _loc24_ -= 8;
                  }
                  _loc25_ = this.var_52.getScale() + "_" + _loc17_.member + "_" + _loc24_ + "_" + _loc20_;
                  _loc26_ = this.var_52.getAsset(_loc25_);
                  if(_loc26_ != null)
                  {
                     _loc13_.asset = _loc26_.content as BitmapData;
                     _loc13_.offsetX = -1 * _loc26_.offset.x - _loc6_ / 2 + _loc21_;
                     _loc13_.offsetY = -1 * _loc26_.offset.y + _loc22_;
                     _loc13_.relativeDepth = -0.01 - 0.1 * _loc16_ * _loc23_;
                     if(_loc17_.ink == 33)
                     {
                        _loc13_.blendMode = BlendMode.ADD;
                     }
                     else
                     {
                        _loc13_.blendMode = BlendMode.NORMAL;
                     }
                     _loc16_++;
                  }
               }
            }
         }
      }
      
      private function updateObject(param1:IRoomObject, param2:IRoomGeometry, param3:Boolean = false) : Boolean
      {
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         if(param3 || var_396 != param1.getUpdateID() || this.var_1432 != param2.updateId)
         {
            _loc4_ = param1.getDirection().x - param2.direction.x;
            _loc4_ = (_loc4_ % 360 + 360) % 360;
            _loc5_ = this.var_1494;
            if(isNaN(this.var_1494))
            {
               _loc5_ = _loc4_;
            }
            else
            {
               _loc5_ -= param2.direction.x;
               _loc5_ = (_loc5_ % 360 + 360) % 360;
            }
            if(_loc4_ != this.var_1493 || param3)
            {
               this.var_1493 = _loc4_;
               _loc4_ -= 112.5;
               _loc4_ = (_loc4_ + 360) % 360;
               this.var_52.setDirectionAngle(AvatarSetType.const_32,_loc4_);
            }
            if(_loc5_ != this.var_1497 || param3)
            {
               this.var_1497 = _loc5_;
               _loc5_ -= 112.5;
               _loc5_ = (_loc5_ + 360) % 360;
               this.var_52.setDirectionAngle(AvatarSetType.const_41,_loc5_);
            }
            var_396 = param1.getUpdateID();
            this.var_1432 = param2.updateId;
            return true;
         }
         return false;
      }
   }
}
