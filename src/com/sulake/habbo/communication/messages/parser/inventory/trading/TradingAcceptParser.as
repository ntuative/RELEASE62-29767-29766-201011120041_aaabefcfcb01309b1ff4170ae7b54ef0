package com.sulake.habbo.communication.messages.parser.inventory.trading
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class TradingAcceptParser implements IMessageParser
   {
       
      
      private var var_1630:Boolean;
      
      private var _userID:int;
      
      public function TradingAcceptParser()
      {
         super();
      }
      
      public function get userAccepts() : Boolean
      {
         return this.var_1630;
      }
      
      public function flush() : Boolean
      {
         this._userID = -1;
         this.var_1630 = false;
         return true;
      }
      
      public function get userID() : int
      {
         return this._userID;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._userID = param1.readInteger();
         this.var_1630 = param1.readInteger() > 0;
         return true;
      }
   }
}
