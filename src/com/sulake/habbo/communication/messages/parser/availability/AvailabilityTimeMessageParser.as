package com.sulake.habbo.communication.messages.parser.availability
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class AvailabilityTimeMessageParser implements IMessageParser
   {
       
      
      private var var_1196:Boolean;
      
      private var var_1406:int;
      
      public function AvailabilityTimeMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1196 = param1.readInteger() > 0;
         this.var_1406 = param1.readInteger();
         return true;
      }
      
      public function get isOpen() : Boolean
      {
         return this.var_1196;
      }
      
      public function flush() : Boolean
      {
         this.var_1196 = false;
         this.var_1406 = 0;
         return true;
      }
      
      public function get minutesUntilChange() : int
      {
         return this.var_1406;
      }
   }
}
