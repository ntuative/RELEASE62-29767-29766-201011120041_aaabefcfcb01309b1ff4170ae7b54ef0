package com.sulake.habbo.widget.events
{
   public class RoomWidgetDanceUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_648:String = "RWUE_DANCE";
       
      
      private var var_75:int;
      
      public function RoomWidgetDanceUpdateEvent(param1:int, param2:Boolean = false, param3:Boolean = false)
      {
         super(const_648,param2,param3);
         this.var_75 = param1;
      }
      
      public function get style() : int
      {
         return this.var_75;
      }
   }
}
