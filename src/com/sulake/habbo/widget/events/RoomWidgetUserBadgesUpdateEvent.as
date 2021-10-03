package com.sulake.habbo.widget.events
{
   public class RoomWidgetUserBadgesUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_131:String = "RWUBUE_USER_BADGES";
       
      
      private var _userId:int;
      
      private var var_233:Array;
      
      public function RoomWidgetUserBadgesUpdateEvent(param1:int, param2:Array, param3:Boolean = false, param4:Boolean = false)
      {
         super(const_131,param3,param4);
         this._userId = param1;
         this.var_233 = param2;
      }
      
      public function get badges() : Array
      {
         return this.var_233;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
   }
}
