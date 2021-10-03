package com.sulake.habbo.communication.messages.parser.error
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class ErrorReportMessageParser implements IMessageParser
   {
       
      
      private var var_1583:int;
      
      private var var_1513:int;
      
      private var var_1582:String;
      
      public function ErrorReportMessageParser()
      {
         super();
      }
      
      public function get messageId() : int
      {
         return this.var_1583;
      }
      
      public function flush() : Boolean
      {
         this.var_1513 = 0;
         this.var_1583 = 0;
         this.var_1582 = null;
         return true;
      }
      
      public function get errorCode() : int
      {
         return this.var_1513;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1583 = param1.readInteger();
         this.var_1513 = param1.readInteger();
         this.var_1582 = param1.readString();
         return true;
      }
      
      public function get timestamp() : String
      {
         return this.var_1582;
      }
   }
}
