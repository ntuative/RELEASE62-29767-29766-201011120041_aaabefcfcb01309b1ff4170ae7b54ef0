package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class InitCryptoMessageParser implements IMessageParser
   {
       
      
      protected var var_1257:String;
      
      protected var var_2592:Boolean;
      
      protected var var_2530:Boolean;
      
      public function InitCryptoMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get isClientEncrypted() : Boolean
      {
         return this.var_2592;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1257 = param1.readString();
         var _loc2_:int = param1.readInteger();
         this.var_2530 = _loc2_ > 0 ? true : false;
         return true;
      }
      
      public function get token() : String
      {
         return this.var_1257;
      }
      
      public function get isServerEncrypted() : Boolean
      {
         return this.var_2530;
      }
   }
}
