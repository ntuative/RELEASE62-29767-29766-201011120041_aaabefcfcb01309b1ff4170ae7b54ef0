package com.sulake.habbo.communication.messages.outgoing.room.engine
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   
   public class PickupObjectMessageComposer implements IMessageComposer
   {
       
      
      private var _roomCategory:int;
      
      private var _roomId:int;
      
      private var var_287:int;
      
      private var var_1959:int;
      
      public function PickupObjectMessageComposer(param1:int, param2:int, param3:int = 0, param4:int = 0)
      {
         super();
         this.var_287 = param1;
         this.var_1959 = param2;
         this._roomId = param3;
         this._roomCategory = param4;
      }
      
      public function getMessageArray() : Array
      {
         var _loc1_:int = 0;
         switch(this.var_1959)
         {
            case RoomObjectCategoryEnum.const_28:
               _loc1_ = 2;
               break;
            case RoomObjectCategoryEnum.const_27:
               _loc1_ = 1;
               break;
            default:
               return [];
         }
         return [_loc1_,this.var_287];
      }
      
      public function dispose() : void
      {
      }
   }
}
