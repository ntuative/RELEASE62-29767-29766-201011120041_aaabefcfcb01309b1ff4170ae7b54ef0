package com.sulake.habbo.communication.messages.parser.notifications
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetLevelNotificationParser implements IMessageParser
   {
       
      
      private var var_597:String;
      
      private var var_1865:int;
      
      private var var_2218:String;
      
      private var var_1318:int;
      
      private var var_1467:int;
      
      public function PetLevelNotificationParser()
      {
         super();
      }
      
      public function get petId() : int
      {
         return this.var_1467;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1467 = param1.readInteger();
         this.var_2218 = param1.readString();
         this.var_1865 = param1.readInteger();
         this.var_597 = param1.readString();
         this.var_1318 = param1.readInteger();
         return true;
      }
      
      public function get petName() : String
      {
         return this.var_2218;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get figure() : String
      {
         return this.var_597;
      }
      
      public function get petType() : int
      {
         return this.var_1318;
      }
      
      public function get level() : int
      {
         return this.var_1865;
      }
   }
}
