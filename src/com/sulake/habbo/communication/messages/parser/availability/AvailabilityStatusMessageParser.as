package com.sulake.habbo.communication.messages.parser.availability
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class AvailabilityStatusMessageParser implements IMessageParser
   {
       
      
      private var var_1196:Boolean;
      
      private var var_1445:Boolean;
      
      public function AvailabilityStatusMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1196 = param1.readInteger() > 0;
         this.var_1445 = param1.readInteger() > 0;
         return true;
      }
      
      public function get isOpen() : Boolean
      {
         return this.var_1196;
      }
      
      public function get onShutDown() : Boolean
      {
         return this.var_1445;
      }
      
      public function flush() : Boolean
      {
         this.var_1196 = false;
         this.var_1445 = false;
         return true;
      }
   }
}
