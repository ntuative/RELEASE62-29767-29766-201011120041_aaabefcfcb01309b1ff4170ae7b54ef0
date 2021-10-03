package com.sulake.habbo.communication.messages.parser.room.session
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CantConnectMessageParser implements IMessageParser
   {
      
      public static const const_1730:int = 2;
      
      public static const const_1467:int = 4;
      
      public static const const_1384:int = 1;
      
      public static const const_1404:int = 3;
       
      
      private var var_1172:int = 0;
      
      private var var_1173:String = "";
      
      public function CantConnectMessageParser()
      {
         super();
      }
      
      public function get reason() : int
      {
         return this.var_1172;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1172 = param1.readInteger();
         if(this.var_1172 == 3)
         {
            this.var_1173 = param1.readString();
         }
         else
         {
            this.var_1173 = "";
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         this.var_1172 = 0;
         this.var_1173 = "";
         return true;
      }
      
      public function get parameter() : String
      {
         return this.var_1173;
      }
   }
}
