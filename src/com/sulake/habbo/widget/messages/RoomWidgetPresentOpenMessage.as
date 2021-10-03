package com.sulake.habbo.widget.messages
{
   public class RoomWidgetPresentOpenMessage extends RoomWidgetMessage
   {
      
      public static const const_726:String = "RWPOM_OPEN_PRESENT";
       
      
      private var var_287:int;
      
      public function RoomWidgetPresentOpenMessage(param1:String, param2:int)
      {
         super(param1);
         this.var_287 = param2;
      }
      
      public function get objectId() : int
      {
         return this.var_287;
      }
   }
}
