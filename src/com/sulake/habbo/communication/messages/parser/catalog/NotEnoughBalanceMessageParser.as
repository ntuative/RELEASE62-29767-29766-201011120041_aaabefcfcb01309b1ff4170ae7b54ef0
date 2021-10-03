package com.sulake.habbo.communication.messages.parser.catalog
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class NotEnoughBalanceMessageParser implements IMessageParser
   {
       
      
      private var var_1628:int = 0;
      
      private var _notEnoughCredits:int = 0;
      
      public function NotEnoughBalanceMessageParser()
      {
         super();
      }
      
      public function get notEnoughPixels() : int
      {
         return this.var_1628;
      }
      
      public function flush() : Boolean
      {
         this._notEnoughCredits = 0;
         this.var_1628 = 0;
         return true;
      }
      
      public function get notEnoughCredits() : int
      {
         return this._notEnoughCredits;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._notEnoughCredits = param1.readInteger();
         this.var_1628 = param1.readInteger();
         return true;
      }
   }
}
