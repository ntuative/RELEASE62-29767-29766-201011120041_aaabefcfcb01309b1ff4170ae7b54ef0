package com.sulake.habbo.room.object.visualization.avatar
{
   import com.sulake.core.assets.BitmapDataAsset;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.avatar.IAvatarImage;
   import com.sulake.habbo.avatar.IAvatarImageListener;
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
   
   public class AvatarVisualization extends RoomObjectSpriteVisualization implements IAvatarImageListener
   {
      
      private static const const_532:Number = -0.01;
      
      private static const const_531:Number = -0.409;
      
      private static const const_1126:Array = [0,0,0];
      
      private static const const_818:String = "avatar";
      
      private static const const_819:int = 2;
       
      
      private var var_533:int = 0;
      
      private var var_597:String;
      
      private var var_2022:int = 0;
      
      private const const_1502:int = 1;
      
      private var var_295:String = "";
      
      private var var_1015:int = 0;
      
      private var var_1221:int = 0;
      
      private var var_1496:Boolean = false;
      
      private var var_853:Boolean;
      
      private const const_1127:int = 3;
      
      private var var_1224:int = 0;
      
      private var var_1220:int = 0;
      
      private var var_52:IAvatarImage = null;
      
      private var var_782:Boolean = false;
      
      private var var_1492:Boolean = false;
      
      private var var_1223:String = "";
      
      private var var_1491:Boolean = false;
      
      private var var_911:Boolean;
      
      private var var_1432:int = -1;
      
      private var var_1016:int = 0;
      
      private var var_1493:int = -1;
      
      private var var_1495:Boolean = false;
      
      private const const_820:int = 0;
      
      private var var_1497:int = -1;
      
      private var var_1494:int = -1;
      
      private var var_635:int = 0;
      
      private var var_1225:int = 0;
      
      private var var_898:String;
      
      private var var_985:Boolean = false;
      
      private var var_1222:Boolean = false;
      
      private var var_787:BitmapDataAsset;
      
      private const const_1497:int = 2;
      
      private var var_788:AvatarVisualizationData = null;
      
      private var var_532:BitmapDataAsset;
      
      private var var_443:Map;
      
      public function AvatarVisualization()
      {
         super();
         this.var_443 = new Map();
         this.var_853 = false;
      }
      
      override public function initialize(param1:IRoomObjectVisualizationData) : Boolean
      {
         this.var_788 = param1 as AvatarVisualizationData;
         createSprites(this.const_1127);
         return true;
      }
      
      private function validateActions(param1:Number) : void
      {
         var _loc2_:int = 0;
         if(param1 < 48)
         {
            this.var_1222 = false;
         }
         if(this.var_295 == "sit" || this.var_295 == "lay")
         {
            this.var_1224 = param1 / 2;
         }
         else
         {
            this.var_1224 = 0;
         }
         this.var_1495 = false;
         this.var_985 = false;
         if(this.var_295 == "lay")
         {
            this.var_985 = true;
            _loc2_ = int(this.var_1223);
            if(_loc2_ < 0)
            {
               this.var_1495 = true;
            }
         }
      }
      
      public function get disposed() : Boolean
      {
         return this.var_911;
      }
      
      private function updateModel(param1:IRoomObjectModel, param2:Number, param3:Boolean) : Boolean
      {
         var _loc4_:Boolean = false;
         var _loc5_:* = false;
         var _loc6_:int = 0;
         var _loc7_:* = null;
         var _loc8_:* = null;
         if(param1.getUpdateID() != var_209)
         {
            _loc4_ = false;
            _loc5_ = false;
            _loc6_ = 0;
            _loc7_ = "";
            _loc5_ = Boolean(param1.getNumber(RoomObjectVariableEnum.const_248) > 0 && param3);
            if(_loc5_ != this.var_1491)
            {
               this.var_1491 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_192) > 0;
            if(_loc5_ != this.var_1492)
            {
               this.var_1492 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_391) > 0;
            if(_loc5_ != this.var_1496)
            {
               this.var_1496 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = Boolean(param1.getNumber(RoomObjectVariableEnum.const_737) > 0 && param3);
            if(_loc5_ != this.var_1222)
            {
               this.var_1222 = _loc5_;
               _loc4_ = true;
            }
            _loc5_ = param1.getNumber(RoomObjectVariableEnum.const_1017) > 0;
            if(_loc5_ != this.var_782)
            {
               this.var_782 = _loc5_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_298);
            if(_loc6_ != this.var_1221)
            {
               this.var_1221 = _loc6_;
               _loc4_ = true;
            }
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_392);
            if(_loc7_ != this.var_295)
            {
               this.var_295 = _loc7_;
               _loc4_ = true;
            }
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_676);
            if(_loc7_ != this.var_1223)
            {
               this.var_1223 = _loc7_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_944);
            if(_loc6_ != this.var_1225)
            {
               this.var_1225 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_396);
            if(_loc6_ != this.var_1220)
            {
               this.var_1220 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_524);
            if(_loc6_ != this.var_635)
            {
               this.var_635 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_328);
            if(_loc6_ != this.var_533)
            {
               this.var_533 = _loc6_;
               _loc4_ = true;
            }
            _loc6_ = param1.getNumber(RoomObjectVariableEnum.const_314);
            if(_loc6_ != this.var_1494)
            {
               this.var_1494 = _loc6_;
               _loc4_ = true;
            }
            if(this.var_635 > 0 && param1.getNumber(RoomObjectVariableEnum.const_328) > 0)
            {
               if(this.var_533 != this.var_635)
               {
                  this.var_533 = this.var_635;
                  _loc4_ = true;
               }
            }
            else if(this.var_533 != 0)
            {
               this.var_533 = 0;
               _loc4_ = true;
            }
            this.validateActions(param2);
            _loc7_ = param1.getString(RoomObjectVariableEnum.const_988);
            if(_loc7_ != this.var_898)
            {
               this.var_898 = _loc7_;
               _loc4_ = true;
            }
            _loc8_ = param1.getString(RoomObjectVariableEnum.const_162);
            if(this.updateFigure(_loc8_))
            {
               _loc4_ = true;
            }
            var_209 = param1.getUpdateID();
            return _loc4_;
         }
         return false;
      }
      
      override public function dispose() : void
      {
         if(this.var_443 != null)
         {
            this.resetImages();
            this.var_443.dispose();
            this.var_443 = null;
         }
         this.var_788 = null;
         this.var_532 = null;
         this.var_787 = null;
         super.dispose();
         this.var_911 = true;
      }
      
      private function resetImages() : void
      {
         var _loc1_:* = null;
         var _loc2_:* = null;
         for each(_loc1_ in this.var_443)
         {
            if(_loc1_)
            {
               _loc1_.dispose();
            }
         }
         this.var_443.reset();
         this.var_52 = null;
         _loc2_ = getSprite(this.const_820);
         if(_loc2_ != null)
         {
            _loc2_.asset = null;
            _loc2_.alpha = 255;
         }
      }
      
      private function updateFigure(param1:String) : Boolean
      {
         if(this.var_597 != param1)
         {
            this.var_597 = param1;
            this.resetImages();
            return true;
         }
         return false;
      }
      
      private function updateShadow(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1502);
         this.var_532 = null;
         if(this.var_295 == "mv" || this.var_295 == "std")
         {
            _loc2_.visible = true;
            if(this.var_532 == null || param1 != var_244)
            {
               _loc3_ = 0;
               _loc4_ = 0;
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
               if(this.var_532 != null)
               {
                  _loc2_.asset = this.var_532.content as BitmapData;
                  _loc2_.offsetX = _loc3_;
                  _loc2_.offsetY = _loc4_;
                  _loc2_.alpha = 50;
                  _loc2_.relativeDepth = 1;
               }
               else
               {
                  _loc2_.visible = false;
               }
            }
         }
         else
         {
            this.var_532 = null;
            _loc2_.visible = false;
         }
      }
      
      private function getAvatarImage(param1:Number) : IAvatarImage
      {
         var _loc2_:String = "avatarImage" + param1.toString();
         var _loc3_:IAvatarImage = this.var_443.getValue(_loc2_) as IAvatarImage;
         if(_loc3_ == null)
         {
            _loc3_ = this.var_788.getAvatar(this.var_597,param1,this.var_898,this);
            if(_loc3_ != null)
            {
               this.var_443.add(_loc2_,_loc3_);
            }
         }
         return _loc3_;
      }
      
      public function avatarImageReady(param1:String) : void
      {
         this.resetImages();
      }
      
      private function updateTypingBubble(param1:Number) : void
      {
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         var _loc5_:int = 0;
         this.var_787 = null;
         var _loc2_:IRoomObjectSprite = getSprite(this.const_1497);
         if(this.var_782)
         {
            _loc2_.visible = true;
            _loc5_ = 64;
            if(param1 < 48)
            {
               this.var_787 = this.var_788.getAvatarRendererAsset("user_typing_small_png") as BitmapDataAsset;
               _loc3_ = 3;
               _loc4_ = -42;
               _loc5_ = 32;
            }
            else
            {
               this.var_787 = this.var_788.getAvatarRendererAsset("user_typing_png") as BitmapDataAsset;
               _loc3_ = 14;
               _loc4_ = -83;
            }
            if(this.var_295 == "sit")
            {
               _loc4_ += _loc5_ / 2;
            }
            else if(this.var_295 == "lay")
            {
               _loc4_ += _loc5_;
            }
            if(this.var_787 != null)
            {
               _loc2_.asset = this.var_787.content as BitmapData;
               _loc2_.offsetX = _loc3_;
               _loc2_.offsetY = _loc4_;
               _loc2_.relativeDepth = -0.02;
            }
         }
         else
         {
            _loc2_.visible = false;
         }
      }
      
      override public function update(param1:IRoomGeometry, param2:int, param3:Boolean) : void
      {
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:int = 0;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc20_:int = 0;
         var _loc21_:int = 0;
         var _loc22_:* = null;
         var _loc23_:int = 0;
         var _loc24_:int = 0;
         var _loc25_:int = 0;
         var _loc26_:int = 0;
         var _loc27_:int = 0;
         var _loc28_:* = null;
         var _loc29_:* = null;
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
         var _loc6_:Number = param1.scale;
         var _loc7_:Boolean = false;
         var _loc8_:Boolean = false;
         var _loc9_:Boolean = false;
         var _loc10_:Boolean = this.updateModel(_loc5_,_loc6_,param3);
         if(_loc10_ || _loc6_ != var_244 || this.var_52 == null)
         {
            if(_loc6_ != var_244)
            {
               _loc8_ = true;
               this.validateActions(_loc6_);
            }
            if(_loc8_ || this.var_52 == null)
            {
               this.var_52 = this.getAvatarImage(_loc6_);
               if(this.var_52 == null)
               {
                  return;
               }
               _loc7_ = true;
               _loc13_ = getSprite(this.const_820);
               if(_loc13_ && this.var_52 && this.var_52.isPlaceholder())
               {
                  _loc13_.alpha = 150;
               }
               else if(_loc13_)
               {
                  _loc13_.alpha = 255;
               }
            }
            if(this.var_52 == null)
            {
               return;
            }
            this.updateShadow(_loc6_);
            this.updateTypingBubble(_loc6_);
            _loc9_ = this.updateObject(_loc4_,param1,param3,true);
            this.updateActions(this.var_52);
            var_244 = _loc6_;
         }
         else
         {
            _loc9_ = this.updateObject(_loc4_,param1,param3);
         }
         var _loc11_:Boolean = _loc9_ || _loc10_ || _loc8_;
         var _loc12_:Boolean = (this.var_853 || this.var_1016 > 0) && param3;
         if(_loc11_)
         {
            this.var_1016 = const_819;
         }
         if(_loc11_ || _loc12_)
         {
            increaseUpdateId();
            --this.var_1016;
            --this.var_1015;
            if(!(this.var_1015 <= 0 || _loc8_ || _loc10_ || _loc7_))
            {
               return;
            }
            this.var_52.updateAnimationByFrames(1);
            this.var_1015 = const_819;
            _loc15_ = this.var_52.getCanvasOffsets();
            if(_loc15_ == null || _loc15_.length < 3)
            {
               _loc15_ = const_1126;
            }
            _loc14_ = getSprite(this.const_820);
            if(_loc14_ != null)
            {
               _loc18_ = this.var_52.getImage(AvatarSetType.const_32,false);
               if(_loc18_ != null)
               {
                  _loc14_.asset = _loc18_;
               }
               if(_loc14_.asset)
               {
                  _loc14_.offsetX = -1 * _loc6_ / 2 + _loc15_[0];
                  _loc14_.offsetY = -_loc14_.asset.height + _loc6_ / 4 + _loc15_[1] + this.var_1224;
               }
               if(this.var_985)
               {
                  if(this.var_1495)
                  {
                     _loc14_.relativeDepth = -0.5;
                  }
                  else
                  {
                     _loc14_.relativeDepth = const_531 + _loc15_[2];
                  }
               }
               else
               {
                  _loc14_.relativeDepth = const_532 + _loc15_[2];
               }
            }
            _loc14_ = getSprite(this.const_1497);
            if(_loc14_ != null && _loc14_.visible)
            {
               if(!this.var_985)
               {
                  _loc14_.relativeDepth = const_532 - 0.01 + _loc15_[2];
               }
               else
               {
                  _loc14_.relativeDepth = const_531 - 0.01 + _loc15_[2];
               }
            }
            this.var_853 = this.var_52.isAnimating();
            _loc16_ = this.const_1127;
            for each(_loc17_ in this.var_52.getSprites())
            {
               if(_loc17_.id == const_818)
               {
                  _loc14_ = getSprite(this.const_820);
                  _loc19_ = this.var_52.getLayerData(_loc17_);
                  _loc20_ = _loc17_.getDirectionOffsetX(this.var_52.getDirection());
                  _loc21_ = _loc17_.getDirectionOffsetY(this.var_52.getDirection());
                  if(_loc19_ != null)
                  {
                     _loc20_ += _loc19_.dx;
                     _loc21_ += _loc19_.dy;
                  }
                  if(_loc6_ < 48)
                  {
                     _loc20_ /= 2;
                     _loc21_ /= 2;
                  }
                  _loc14_.offsetX += _loc20_;
                  _loc14_.offsetY += _loc21_;
               }
               else
               {
                  _loc14_ = getSprite(_loc16_);
                  if(_loc14_ != null)
                  {
                     _loc14_.capturesMouse = false;
                     _loc14_.visible = true;
                     _loc22_ = this.var_52.getLayerData(_loc17_);
                     _loc23_ = 0;
                     _loc24_ = _loc17_.getDirectionOffsetX(this.var_52.getDirection());
                     _loc25_ = _loc17_.getDirectionOffsetY(this.var_52.getDirection());
                     _loc26_ = _loc17_.getDirectionOffsetZ(this.var_52.getDirection());
                     _loc27_ = 0;
                     if(_loc17_.hasDirections)
                     {
                        _loc27_ = this.var_52.getDirection();
                     }
                     if(_loc22_ != null)
                     {
                        _loc23_ = _loc22_.animationFrame;
                        _loc24_ += _loc22_.dx;
                        _loc25_ += _loc22_.dy;
                        _loc27_ += _loc22_.directionOffset;
                     }
                     if(_loc6_ < 48)
                     {
                        _loc24_ /= 2;
                        _loc25_ /= 2;
                     }
                     if(_loc27_ < 0)
                     {
                        _loc27_ += 8;
                     }
                     else if(_loc27_ > 7)
                     {
                        _loc27_ -= 8;
                     }
                     _loc28_ = this.var_52.getScale() + "_" + _loc17_.member + "_" + _loc27_ + "_" + _loc23_;
                     _loc29_ = this.var_52.getAsset(_loc28_);
                     if(_loc29_ == null)
                     {
                        continue;
                     }
                     _loc14_.asset = _loc29_.content as BitmapData;
                     _loc14_.offsetX = -_loc29_.offset.x - _loc6_ / 2 + _loc24_;
                     _loc14_.offsetY = -_loc29_.offset.y + _loc25_ + this.var_1224;
                     if(this.var_985)
                     {
                        _loc14_.relativeDepth = const_531 - 0.001 * spriteCount * _loc26_;
                     }
                     else
                     {
                        _loc14_.relativeDepth = const_532 - 0.001 * spriteCount * _loc26_;
                     }
                     if(_loc17_.ink == 33)
                     {
                        _loc14_.blendMode = BlendMode.ADD;
                     }
                     else
                     {
                        _loc14_.blendMode = BlendMode.NORMAL;
                     }
                  }
                  _loc16_++;
               }
            }
         }
      }
      
      private function updateObject(param1:IRoomObject, param2:IRoomGeometry, param3:Boolean, param4:Boolean = false) : Boolean
      {
         var _loc5_:Boolean = false;
         var _loc6_:int = 0;
         var _loc7_:int = 0;
         if(param4 || var_396 != param1.getUpdateID() || this.var_1432 != param2.updateId)
         {
            _loc5_ = param3;
            _loc6_ = param1.getDirection().x - param2.direction.x;
            _loc6_ = (_loc6_ % 360 + 360) % 360;
            _loc7_ = this.var_1494;
            if(this.var_295 == "float")
            {
               _loc7_ = _loc6_;
            }
            else
            {
               _loc7_ -= param2.direction.x;
            }
            _loc7_ = (_loc7_ % 360 + 360) % 360;
            if(_loc6_ != this.var_1493 || param4)
            {
               _loc5_ = true;
               this.var_1493 = _loc6_;
               _loc6_ -= 112.5;
               _loc6_ = (_loc6_ + 360) % 360;
               this.var_52.setDirectionAngle(AvatarSetType.const_32,_loc6_);
            }
            if(_loc7_ != this.var_1497 || param4)
            {
               _loc5_ = true;
               this.var_1497 = _loc7_;
               if(this.var_1497 != this.var_1493)
               {
                  _loc7_ -= 112.5;
                  _loc7_ = (_loc7_ + 360) % 360;
                  this.var_52.setDirectionAngle(AvatarSetType.const_41,_loc7_);
               }
            }
            var_396 = param1.getUpdateID();
            this.var_1432 = param2.updateId;
            return _loc5_;
         }
         return false;
      }
      
      private function updateActions(param1:IAvatarImage) : void
      {
         var _loc3_:* = null;
         if(param1 == null)
         {
            return;
         }
         param1.initActionAppends();
         param1.appendAction(AvatarAction.const_362,this.var_295,this.var_1223);
         if(this.var_1221 > 0)
         {
            param1.appendAction(AvatarAction.const_256,AvatarAction.const_1266[this.var_1221]);
         }
         if(this.var_1225 > 0)
         {
            param1.appendAction(AvatarAction.const_652,this.var_1225);
         }
         if(this.var_2022 > 0)
         {
            param1.appendAction(AvatarAction.const_732,this.var_2022);
         }
         if(this.var_635 > 0)
         {
            param1.appendAction(AvatarAction.const_746,this.var_635);
         }
         if(this.var_533 > 0)
         {
            param1.appendAction(AvatarAction.const_601,this.var_533);
         }
         if(this.var_1491)
         {
            param1.appendAction(AvatarAction.const_259);
         }
         if(this.var_1496 || this.var_1222)
         {
            param1.appendAction(AvatarAction.const_405);
         }
         if(this.var_1492)
         {
            param1.appendAction(AvatarAction.const_204);
         }
         if(this.var_1220 > 0)
         {
            param1.appendAction(AvatarAction.const_260,this.var_1220);
         }
         param1.endActionAppends();
         this.var_853 = param1.isAnimating();
         var _loc2_:int = this.const_1127;
         for each(_loc3_ in this.var_52.getSprites())
         {
            if(_loc3_.id != const_818)
            {
               _loc2_++;
            }
         }
         if(_loc2_ != spriteCount)
         {
            createSprites(_loc2_);
         }
      }
   }
}
