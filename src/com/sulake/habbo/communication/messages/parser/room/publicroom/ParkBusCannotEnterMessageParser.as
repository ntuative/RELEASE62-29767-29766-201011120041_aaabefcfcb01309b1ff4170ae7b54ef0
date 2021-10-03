package com.sulake.habbo.communication.messages.parser.room.publicroom
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ParkBusCannotEnterMessageParser implements IMessageParser
   {
       
      
      private var var_1172:String = "";
      
      public function ParkBusCannotEnterMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1172 = param1.readString();
         return true;
      }
      
      public function flush() : Boolean
      {
         this.var_1172 = "";
         return true;
      }
      
      public function get reason() : String
      {
         return this.var_1172;
      }
   }
}
