package com.sulake.habbo.widget.events
{
   public class RoomWidgetHabboClubUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_212:String = "RWBIUE_HABBO_CLUB";
       
      
      private var var_2203:Boolean = false;
      
      private var var_2201:int = 0;
      
      private var var_2200:int = 0;
      
      private var var_2121:int;
      
      private var var_2202:int = 0;
      
      public function RoomWidgetHabboClubUpdateEvent(param1:int, param2:int, param3:int, param4:Boolean, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_212,param6,param7);
         this.var_2202 = param1;
         this.var_2200 = param2;
         this.var_2201 = param3;
         this.var_2203 = param4;
         this.var_2121 = param5;
      }
      
      public function get clubLevel() : int
      {
         return this.var_2121;
      }
      
      public function get pastPeriods() : int
      {
         return this.var_2201;
      }
      
      public function get periodsLeft() : int
      {
         return this.var_2200;
      }
      
      public function get daysLeft() : int
      {
         return this.var_2202;
      }
      
      public function get allowClubDances() : Boolean
      {
         return this.var_2203;
      }
   }
}
