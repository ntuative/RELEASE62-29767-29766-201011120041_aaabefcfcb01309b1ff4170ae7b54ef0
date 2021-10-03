package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class HabboActivityPointNotificationMessageParser implements IMessageParser
   {
       
      
      private var var_2129:int = 0;
      
      private var var_2130:int = 0;
      
      public function HabboActivityPointNotificationMessageParser()
      {
         super();
      }
      
      public function get change() : int
      {
         return this.var_2130;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2129 = param1.readInteger();
         this.var_2130 = param1.readInteger();
         return true;
      }
      
      public function get amount() : int
      {
         return this.var_2129;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
   }
}
