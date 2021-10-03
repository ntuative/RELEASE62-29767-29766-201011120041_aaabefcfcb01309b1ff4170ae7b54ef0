package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class SecretKeyMessageParser implements IMessageParser
   {
       
      
      protected var var_2549:String;
      
      public function SecretKeyMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_2549 = param1.readString();
         return true;
      }
      
      public function get serverPublicKey() : String
      {
         return this.var_2549;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
   }
}
