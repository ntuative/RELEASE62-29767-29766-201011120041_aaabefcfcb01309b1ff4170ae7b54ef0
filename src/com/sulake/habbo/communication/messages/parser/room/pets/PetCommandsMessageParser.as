package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetCommandsMessageParser implements IMessageParser
   {
       
      
      private var var_995:Array;
      
      private var var_1467:int;
      
      public function PetCommandsMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1467 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         this.var_995 = new Array();
         while(_loc2_-- > 0)
         {
            this.var_995.push(param1.readInteger());
         }
         return true;
      }
      
      public function get enabledCommands() : Array
      {
         return this.var_995;
      }
      
      public function get petId() : int
      {
         return this.var_1467;
      }
      
      public function flush() : Boolean
      {
         this.var_1467 = -1;
         this.var_995 = null;
         return true;
      }
   }
}
