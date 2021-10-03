package com.sulake.habbo.widget.events
{
   public class RoomWidgetUpdateEffectsUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_657:String = "RWUEUE_UPDATE_EFFECTS";
       
      
      private var var_242:Array;
      
      public function RoomWidgetUpdateEffectsUpdateEvent(param1:Array = null, param2:Boolean = false, param3:Boolean = false)
      {
         super(const_657,param2,param3);
         this.var_242 = param1;
      }
      
      public function get effects() : Array
      {
         return this.var_242;
      }
   }
}
