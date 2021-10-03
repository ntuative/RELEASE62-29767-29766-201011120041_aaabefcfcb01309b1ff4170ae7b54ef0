package com.sulake.habbo.widget.messages
{
   public class RoomWidgetChatTypingMessage extends RoomWidgetMessage
   {
      
      public static const const_770:String = "RWCTM_TYPING_STATUS";
       
      
      private var var_782:Boolean;
      
      public function RoomWidgetChatTypingMessage(param1:Boolean)
      {
         super(const_770);
         this.var_782 = param1;
      }
      
      public function get isTyping() : Boolean
      {
         return this.var_782;
      }
   }
}
