package com.sulake.habbo.communication.messages.outgoing.room.engine
{
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.habbo.room.object.RoomObjectCategoryEnum;
   
   public class PlaceObjectMessageComposer implements IMessageComposer
   {
       
      
      private var var_287:int;
      
      private var var_243:int = 0;
      
      private var _roomId:int;
      
      private var _x:int = 0;
      
      private var var_162:int = 0;
      
      private var var_1959:int;
      
      private var var_2115:String;
      
      private var _roomCategory:int;
      
      public function PlaceObjectMessageComposer(param1:int, param2:int, param3:String, param4:int, param5:int, param6:int, param7:int = 0, param8:int = 0)
      {
         super();
         this.var_287 = param1;
         this.var_1959 = param2;
         this.var_2115 = param3;
         this._x = param4;
         this.var_162 = param5;
         this.var_243 = param6;
         this._roomId = param7;
         this._roomCategory = param8;
      }
      
      public function dispose() : void
      {
      }
      
      public function getMessageArray() : Array
      {
         switch(this.var_1959)
         {
            case RoomObjectCategoryEnum.const_28:
               return [this.var_287 + " " + this._x + " " + this.var_162 + " " + this.var_243];
            case RoomObjectCategoryEnum.const_27:
               return [this.var_287 + " " + this.var_2115];
            default:
               return [];
         }
      }
   }
}
