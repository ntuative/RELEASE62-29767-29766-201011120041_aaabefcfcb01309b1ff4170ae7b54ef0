package com.sulake.habbo.widget.events
{
   public class RoomWidgetPetCommandsUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_152:String = "RWPCUE_PET_COMMANDS";
       
      
      private var _id:int;
      
      private var var_995:Array;
      
      public function RoomWidgetPetCommandsUpdateEvent(param1:int, param2:Array, param3:Boolean = false, param4:Boolean = false)
      {
         super(RoomWidgetPetCommandsUpdateEvent.const_152,param3,param4);
         this._id = param1;
         this.var_995 = param2;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get enabledCommands() : Array
      {
         return this.var_995;
      }
   }
}
