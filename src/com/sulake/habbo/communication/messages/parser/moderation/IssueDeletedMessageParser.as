package com.sulake.habbo.communication.messages.parser.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class IssueDeletedMessageParser implements IMessageParser
   {
       
      
      private var var_1870:int;
      
      public function IssueDeletedMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_1870 = parseInt(param1.readString());
         return true;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get issueId() : int
      {
         return this.var_1870;
      }
   }
}
