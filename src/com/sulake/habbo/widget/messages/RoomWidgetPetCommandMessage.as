package com.sulake.habbo.widget.messages
{
   public class RoomWidgetPetCommandMessage extends RoomWidgetMessage
   {
      
      public static const const_703:String = "RWPCM_REQUEST_PET_COMMANDS";
      
      public static const const_558:String = "RWPCM_PET_COMMAND";
       
      
      private var var_156:String;
      
      private var var_1467:int = 0;
      
      public function RoomWidgetPetCommandMessage(param1:String, param2:int, param3:String = null)
      {
         super(param1);
         this.var_1467 = param2;
         this.var_156 = param3;
      }
      
      public function get value() : String
      {
         return this.var_156;
      }
      
      public function get petId() : int
      {
         return this.var_1467;
      }
   }
}
