package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatMessage extends RoomWidgetMessage
   {
      
      public static const const_112:int = 0;
      
      public static const const_110:int = 1;
      
      public static const const_106:int = 2;
      
      public static const const_573:String = "RWCM_MESSAGE_CHAT";
       
      
      private var var_1267:int = 0;
      
      private var var_2213:String = "";
      
      private var _text:String = "";
      
      public function RoomWidgetChatMessage(param1:String, param2:String, param3:int = 0, param4:String = "")
      {
         super(param1);
         this._text = param2;
         this.var_1267 = param3;
         this.var_2213 = param4;
      }
      
      public function get recipientName() : String
      {
         return this.var_2213;
      }
      
      public function get chatType() : int
      {
         return this.var_1267;
      }
      
      public function get text() : String
      {
         return this._text;
      }
   }
}
