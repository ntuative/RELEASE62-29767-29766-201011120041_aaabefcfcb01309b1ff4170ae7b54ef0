package com.sulake.habbo.widget.events
{
   public class RoomWidgetCreditBalanceUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_181:String = "RWCBUE_CREDIT_BALANCE";
       
      
      private var var_2166:int;
      
      public function RoomWidgetCreditBalanceUpdateEvent(param1:int, param2:Boolean = false, param3:Boolean = false)
      {
         super(const_181,param2,param3);
         this.var_2166 = param1;
      }
      
      public function get balance() : int
      {
         return this.var_2166;
      }
   }
}
