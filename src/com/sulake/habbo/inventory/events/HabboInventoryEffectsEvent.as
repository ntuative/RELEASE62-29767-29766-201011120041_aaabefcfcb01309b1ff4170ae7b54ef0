package com.sulake.habbo.inventory.events
{
   import flash.events.Event;
   
   public class HabboInventoryEffectsEvent extends Event
   {
      
      public static const const_1050:String = "HIEE_EFFECTS_CHANGED";
       
      
      private var var_242:Array;
      
      public function HabboInventoryEffectsEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
   }
}
