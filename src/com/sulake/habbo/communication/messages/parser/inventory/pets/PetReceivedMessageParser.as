package com.sulake.habbo.communication.messages.parser.inventory.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetReceivedMessageParser implements IMessageParser
   {
       
      
      private var var_1061:PetData;
      
      private var var_1663:Boolean;
      
      public function PetReceivedMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1663 = param1.readBoolean();
         this.var_1061 = new PetData(param1);
         Logger.log("Got PetReceived: " + this.var_1663 + ", " + this.var_1061.id + ", " + this.var_1061.name + ", " + this.pet.figure + ", " + this.var_1061.type);
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get boughtAsGift() : Boolean
      {
         return this.var_1663;
      }
      
      public function get pet() : PetData
      {
         return this.var_1061;
      }
   }
}
