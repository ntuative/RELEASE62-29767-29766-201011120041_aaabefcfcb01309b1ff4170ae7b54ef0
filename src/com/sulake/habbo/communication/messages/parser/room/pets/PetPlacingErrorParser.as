package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetPlacingErrorParser implements IMessageParser
   {
       
      
      private var var_1513:int;
      
      private var _roomCategory:int = 0;
      
      private var _roomId:int = 0;
      
      public function PetPlacingErrorParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_1513 = -1;
         return true;
      }
      
      public function get errorCode() : int
      {
         return this.var_1513;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1513 = param1.readInteger();
         return true;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
   }
}
