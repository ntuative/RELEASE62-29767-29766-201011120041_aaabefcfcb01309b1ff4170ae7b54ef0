package com.sulake.habbo.communication.messages.parser.users
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.parser.inventory.pets.PetData;
   
   public class PetRespectNotificationParser implements IMessageParser
   {
       
      
      private var var_2041:int;
      
      private var var_1162:PetData;
      
      private var var_2042:int;
      
      public function PetRespectNotificationParser()
      {
         super();
      }
      
      public function get respect() : int
      {
         return this.var_2041;
      }
      
      public function get petData() : PetData
      {
         return this.var_1162;
      }
      
      public function flush() : Boolean
      {
         this.var_1162 = null;
         return true;
      }
      
      public function get petOwnerId() : int
      {
         return this.var_2042;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2041 = param1.readInteger();
         this.var_2042 = param1.readInteger();
         this.var_1162 = new PetData(param1);
         return true;
      }
   }
}
