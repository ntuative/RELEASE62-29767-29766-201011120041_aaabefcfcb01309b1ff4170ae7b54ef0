package com.sulake.habbo.communication.messages.parser.availability
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class InfoHotelClosingMessageParser implements IMessageParser
   {
       
      
      private var var_1679:int;
      
      public function InfoHotelClosingMessageParser()
      {
         super();
      }
      
      public function get minutesUntilClosing() : int
      {
         return this.var_1679;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1679 = param1.readInteger();
         return true;
      }
      
      public function flush() : Boolean
      {
         this.var_1679 = 0;
         return true;
      }
   }
}
