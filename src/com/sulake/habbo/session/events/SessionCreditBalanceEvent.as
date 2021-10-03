package com.sulake.habbo.session.events
{
   import flash.events.Event;
   
   public class SessionCreditBalanceEvent extends Event
   {
      
      public static const const_181:String = "session_credit_balance";
       
      
      private var var_1940:int;
      
      public function SessionCreditBalanceEvent(param1:int, param2:Boolean = false, param3:Boolean = false)
      {
         super(const_181,param2,param3);
         this.var_1940 = param1;
      }
      
      public function get credits() : int
      {
         return this.var_1940;
      }
   }
}
