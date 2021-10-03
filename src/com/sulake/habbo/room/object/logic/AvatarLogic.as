package com.sulake.habbo.room.object.logic
{
   import com.sulake.habbo.avatar.enum.AvatarAction;
   import com.sulake.habbo.room.events.RoomObjectMoveEvent;
   import com.sulake.habbo.room.messages.RoomObjectAvatarCarryObjectUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarChatUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarDanceUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarEffectUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarFigureUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarFlatControlUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarGestureUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarPostureUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarSelectedMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarSignUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarSleepUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarTypingUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarUseObjectUpdateMessage;
   import com.sulake.habbo.room.messages.RoomObjectAvatarWaveUpdateMessage;
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.room.events.RoomObjectEvent;
   import com.sulake.room.events.RoomObjectMouseEvent;
   import com.sulake.room.events.RoomSpriteMouseEvent;
   import com.sulake.room.messages.RoomObjectUpdateMessage;
   import com.sulake.room.object.IRoomObjectModelController;
   import com.sulake.room.utils.IRoomGeometry;
   import com.sulake.room.utils.IVector3d;
   import com.sulake.room.utils.Vector3d;
   import flash.events.MouseEvent;
   import flash.utils.getTimer;
   
   public class AvatarLogic extends MovingObjectLogic
   {
      
      private static const const_800:int = 500;
      
      private static const const_802:Number = 1.5;
      
      private static const const_799:int = 28;
      
      private static const const_801:int = 29;
       
      
      private var var_741:int = 0;
      
      private var var_1153:int = 0;
      
      private var var_915:int = 0;
      
      private var var_1383:int = 0;
      
      private var var_605:int = 0;
      
      private var var_742:int = 0;
      
      private var var_1151:int = 0;
      
      private var var_1150:int = 0;
      
      private var var_406:Vector3d = null;
      
      private var var_1152:int = 0;
      
      private var var_916:int = 0;
      
      private var var_1384:int = 0;
      
      private var var_178:Boolean = false;
      
      public function AvatarLogic()
      {
         super();
         this.var_1384 = getTimer() + this.getBlinkInterval();
      }
      
      private function updateActions(param1:int, param2:IRoomObjectModelController) : void
      {
         if(this.var_1152 > 0)
         {
            if(param1 > this.var_1152)
            {
               param2.setNumber(RoomObjectVariableEnum.const_248,0);
               this.var_1152 = 0;
               this.var_605 = 0;
               this.var_741 = 0;
            }
            else if(this.var_741 == 0 && this.var_605 == 0)
            {
               this.var_605 = param1 + this.getTalkingPauseInterval();
               this.var_741 = this.var_605 + this.getTalkingPauseLength();
            }
            else if(this.var_605 > 0 && param1 > this.var_605)
            {
               param2.setNumber(RoomObjectVariableEnum.const_248,0);
               this.var_605 = 0;
            }
            else if(this.var_741 > 0 && param1 > this.var_741)
            {
               param2.setNumber(RoomObjectVariableEnum.const_248,1);
               this.var_741 = 0;
            }
         }
         if(this.var_915 > 0 && param1 > this.var_915)
         {
            param2.setNumber(RoomObjectVariableEnum.const_192,0);
            this.var_915 = 0;
         }
         if(this.var_1153 > 0 && param1 > this.var_1153)
         {
            param2.setNumber(RoomObjectVariableEnum.const_298,0);
            this.var_1153 = 0;
         }
         if(this.var_1151 > 0 && param1 > this.var_1151)
         {
            param2.setNumber(RoomObjectVariableEnum.const_1040,0);
            this.var_1151 = 0;
         }
         if(this.var_916 > 0)
         {
            if(param1 > this.var_916)
            {
               param2.setNumber(RoomObjectVariableEnum.const_524,0);
               this.var_916 = 0;
            }
            else if((this.var_916 - param1) % 10000 < 1000)
            {
               param2.setNumber(RoomObjectVariableEnum.const_328,1);
            }
            else
            {
               param2.setNumber(RoomObjectVariableEnum.const_328,0);
            }
         }
         if(param1 > this.var_1384)
         {
            param2.setNumber(RoomObjectVariableEnum.const_737,1);
            this.var_1384 = param1 + this.getBlinkInterval();
            this.var_1150 = param1 + this.getBlinkLength();
         }
         if(this.var_1150 > 0 && param1 > this.var_1150)
         {
            param2.setNumber(RoomObjectVariableEnum.const_737,0);
            this.var_1150 = 0;
         }
         if(this.var_742 > 0 && param1 > this.var_742)
         {
            param2.setNumber(RoomObjectVariableEnum.const_396,this.var_1383);
            this.var_742 = 0;
         }
      }
      
      private function updateEffect(param1:int, param2:IRoomObjectModelController) : void
      {
         if(param1 == const_799)
         {
            this.var_742 = getTimer() + const_800;
            this.var_1383 = const_801;
         }
         else if(param2.getNumber(RoomObjectVariableEnum.const_396) == const_801)
         {
            this.var_742 = getTimer() + const_800;
            this.var_1383 = param1;
            param1 = const_799;
         }
         else
         {
            this.var_742 = 0;
         }
         param2.setNumber(RoomObjectVariableEnum.const_396,param1);
      }
      
      private function getBlinkInterval() : int
      {
         return 4500 + Math.random() * 1000;
      }
      
      private function getBlinkLength() : int
      {
         return 50 + Math.random() * 200;
      }
      
      override public function processUpdateMessage(param1:RoomObjectUpdateMessage) : void
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:* = null;
         var _loc11_:* = null;
         var _loc12_:int = 0;
         var _loc13_:* = null;
         var _loc14_:* = null;
         var _loc15_:* = null;
         var _loc16_:* = null;
         var _loc17_:* = null;
         var _loc18_:* = null;
         var _loc19_:* = null;
         var _loc20_:* = null;
         var _loc21_:* = null;
         if(param1 == null || object == null)
         {
            return;
         }
         super.processUpdateMessage(param1);
         var _loc2_:IRoomObjectModelController = object.getModelController();
         if(param1 is RoomObjectAvatarPostureUpdateMessage)
         {
            _loc3_ = param1 as RoomObjectAvatarPostureUpdateMessage;
            _loc2_.setString(RoomObjectVariableEnum.const_392,_loc3_.postureType);
            _loc2_.setString(RoomObjectVariableEnum.const_676,_loc3_.parameter);
            return;
         }
         if(param1 is RoomObjectAvatarChatUpdateMessage)
         {
            _loc4_ = param1 as RoomObjectAvatarChatUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_248,1);
            this.var_1152 = getTimer() + _loc4_.numberOfWords * 1000;
            return;
         }
         if(param1 is RoomObjectAvatarTypingUpdateMessage)
         {
            _loc5_ = param1 as RoomObjectAvatarTypingUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_1017,Number(_loc5_.isTyping));
            return;
         }
         if(param1 is RoomObjectAvatarUpdateMessage)
         {
            _loc6_ = param1 as RoomObjectAvatarUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_314,_loc6_.dirHead);
            return;
         }
         if(param1 is RoomObjectAvatarGestureUpdateMessage)
         {
            _loc7_ = param1 as RoomObjectAvatarGestureUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_298,_loc7_.gesture);
            this.var_1153 = getTimer() + 3000;
            return;
         }
         if(param1 is RoomObjectAvatarWaveUpdateMessage)
         {
            _loc8_ = param1 as RoomObjectAvatarWaveUpdateMessage;
            if(_loc8_.isWaving)
            {
               _loc2_.setNumber(RoomObjectVariableEnum.const_192,1);
               this.var_915 = getTimer() + 0;
            }
            else
            {
               _loc2_.setNumber(RoomObjectVariableEnum.const_192,0);
               this.var_915 = 0;
            }
            return;
         }
         if(param1 is RoomObjectAvatarDanceUpdateMessage)
         {
            _loc9_ = param1 as RoomObjectAvatarDanceUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_944,_loc9_.danceStyle);
            return;
         }
         if(param1 is RoomObjectAvatarSleepUpdateMessage)
         {
            _loc10_ = param1 as RoomObjectAvatarSleepUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_391,Number(_loc10_.isSleeping));
            return;
         }
         if(param1 is RoomObjectAvatarEffectUpdateMessage)
         {
            _loc11_ = param1 as RoomObjectAvatarEffectUpdateMessage;
            _loc12_ = _loc11_.effect;
            this.updateEffect(_loc12_,_loc2_);
            return;
         }
         if(param1 is RoomObjectAvatarCarryObjectUpdateMessage)
         {
            _loc13_ = param1 as RoomObjectAvatarCarryObjectUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_524,_loc13_.itemType);
            this.var_916 = getTimer() + 100000;
            return;
         }
         if(param1 is RoomObjectAvatarUseObjectUpdateMessage)
         {
            _loc14_ = param1 as RoomObjectAvatarUseObjectUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_328,_loc14_.itemType);
            return;
         }
         if(param1 is RoomObjectAvatarSignUpdateMessage)
         {
            _loc15_ = param1 as RoomObjectAvatarSignUpdateMessage;
            _loc2_.setNumber(RoomObjectVariableEnum.const_1040,_loc15_.signType);
            this.var_1151 = getTimer() + 5000;
            return;
         }
         if(param1 is RoomObjectAvatarFlatControlUpdateMessage)
         {
            _loc16_ = param1 as RoomObjectAvatarFlatControlUpdateMessage;
            _loc2_.setString(RoomObjectVariableEnum.const_632,_loc16_.rawData);
            _loc2_.setNumber(RoomObjectVariableEnum.const_1323,Number(_loc16_.isAdmin));
            return;
         }
         if(param1 is RoomObjectAvatarFigureUpdateMessage)
         {
            _loc17_ = param1 as RoomObjectAvatarFigureUpdateMessage;
            _loc18_ = _loc2_.getString(RoomObjectVariableEnum.const_162);
            _loc19_ = _loc17_.figure;
            _loc20_ = _loc17_.gender;
            if(_loc18_ != null && _loc18_.indexOf(".bds-") != -1)
            {
               _loc19_ += _loc18_.substr(_loc18_.indexOf(".bds-"));
            }
            _loc2_.setString(RoomObjectVariableEnum.const_162,_loc19_);
            _loc2_.setString(RoomObjectVariableEnum.const_988,_loc20_);
            return;
         }
         if(param1 is RoomObjectAvatarSelectedMessage)
         {
            _loc21_ = param1 as RoomObjectAvatarSelectedMessage;
            this.var_178 = _loc21_.selected;
            this.var_406 = null;
            return;
         }
      }
      
      override public function update(param1:int) : void
      {
         var _loc2_:* = null;
         var _loc3_:* = null;
         super.update(param1);
         if(this.var_178 && object != null)
         {
            if(eventDispatcher != null)
            {
               _loc2_ = object.getLocation();
               if(this.var_406 == null || this.var_406.x != _loc2_.x || this.var_406.y != _loc2_.y || this.var_406.z != _loc2_.z)
               {
                  if(this.var_406 == null)
                  {
                     this.var_406 = new Vector3d();
                  }
                  this.var_406.assign(_loc2_);
                  _loc3_ = new RoomObjectMoveEvent(RoomObjectMoveEvent.const_465,object.getId(),object.getType());
                  eventDispatcher.dispatchEvent(_loc3_);
               }
            }
         }
         if(object != null && object.getModelController() != null)
         {
            this.updateActions(param1,object.getModelController());
         }
      }
      
      private function getTalkingPauseInterval() : int
      {
         return 100 + Math.random() * 200;
      }
      
      override public function dispose() : void
      {
         var _loc1_:* = null;
         if(this.var_178 && object != null)
         {
            if(eventDispatcher != null)
            {
               _loc1_ = new RoomObjectMoveEvent(RoomObjectMoveEvent.const_464,object.getId(),object.getType());
               eventDispatcher.dispatchEvent(_loc1_);
            }
         }
         super.dispose();
         this.var_406 = null;
      }
      
      private function getTalkingPauseLength() : int
      {
         return 75 + Math.random() * 75;
      }
      
      override public function mouseEvent(param1:RoomSpriteMouseEvent, param2:IRoomGeometry) : void
      {
         var _loc3_:int = 0;
         var _loc4_:* = null;
         var _loc5_:* = null;
         if(object == null || param1 == null)
         {
            return;
         }
         switch(param1.type)
         {
            case MouseEvent.CLICK:
               _loc3_ = object.getId();
               _loc4_ = object.getType();
               if(eventDispatcher != null)
               {
                  _loc5_ = new RoomObjectMouseEvent(RoomObjectMouseEvent.ROOM_OBJECT_MOUSE_CLICK,param1.eventId,_loc3_,_loc4_,param1.altKey,param1.ctrlKey,param1.shiftKey,param1.buttonDown);
                  eventDispatcher.dispatchEvent(_loc5_);
               }
         }
      }
      
      private function targetIsWarping(param1:IVector3d) : Boolean
      {
         var _loc2_:IVector3d = object.getLocation();
         if(param1 == null)
         {
            return false;
         }
         if(_loc2_.x == 0 && _loc2_.y == 0)
         {
            return false;
         }
         if(Math.abs(_loc2_.x - param1.x) > const_802 || Math.abs(_loc2_.y - param1.y) > const_802)
         {
            return true;
         }
         return false;
      }
   }
}
