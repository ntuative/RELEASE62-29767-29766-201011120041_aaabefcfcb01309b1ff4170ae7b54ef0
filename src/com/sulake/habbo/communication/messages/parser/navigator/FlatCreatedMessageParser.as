package com.sulake.habbo.communication.messages.parser.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class FlatCreatedMessageParser implements IMessageParser
   {
       
      
      private var var_1793:String;
      
      private var var_315:int;
      
      public function FlatCreatedMessageParser()
      {
         super();
      }
      
      public function get flatName() : String
      {
         return this.var_1793;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_315 = param1.readInteger();
         this.var_1793 = param1.readString();
         Logger.log("FLAT CREATED: " + this.var_315 + ", " + this.var_1793);
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get flatId() : int
      {
         return this.var_315;
      }
   }
}
