package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class InfoFeedEnableMessageParser implements IMessageParser
   {
       
      
      private var var_1597:Boolean;
      
      public function InfoFeedEnableMessageParser()
      {
         super();
      }
      
      public function get enabled() : Boolean
      {
         return this.var_1597;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1597 = param1.readBoolean();
         return true;
      }
      
      public function flush() : Boolean
      {
         this.var_1597 = false;
         return true;
      }
   }
}
