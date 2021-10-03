package com.sulake.habbo.widget.messages
{
   public class RoomWidgetDanceMessage extends RoomWidgetMessage
   {
      
      public static const const_718:String = "RWCM_MESSAGE_DANCE";
      
      public static const const_1052:int = 0;
      
      public static const const_1367:Array = [2,3,4];
       
      
      private var var_75:int = 0;
      
      public function RoomWidgetDanceMessage(param1:int)
      {
         super(const_718);
         this.var_75 = param1;
      }
      
      public function get style() : int
      {
         return this.var_75;
      }
   }
}
