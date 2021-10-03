package com.sulake.habbo.communication.messages.parser.inventory.badges
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class BadgeAndPointLimit
   {
       
      
      private var var_1629:int;
      
      private var var_717:String;
      
      public function BadgeAndPointLimit(param1:String, param2:IMessageDataWrapper)
      {
         super();
         this.var_717 = "ACH_" + param1 + param2.readInteger();
         this.var_1629 = param2.readInteger();
      }
      
      public function get limit() : int
      {
         return this.var_1629;
      }
      
      public function get badgeId() : String
      {
         return this.var_717;
      }
   }
}
