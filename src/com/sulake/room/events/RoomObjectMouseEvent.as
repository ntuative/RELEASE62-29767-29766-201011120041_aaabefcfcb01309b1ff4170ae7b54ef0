package com.sulake.room.events
{
   public class RoomObjectMouseEvent extends RoomObjectEvent
   {
      
      public static const const_1546:String = "ROE_MOUSE_LEAVE";
      
      public static const const_1700:String = "ROE_MOUSE_ENTER";
      
      public static const const_386:String = "ROE_MOUSE_MOVE";
      
      public static const const_1582:String = "ROE_MOUSE_DOUBLE_CLICK";
      
      public static const ROOM_OBJECT_MOUSE_CLICK:String = "ROE_MOUSE_CLICK";
      
      public static const const_420:String = "ROE_MOUSE_DOWN";
       
      
      private var var_2066:Boolean;
      
      private var var_2069:Boolean;
      
      private var var_2065:Boolean;
      
      private var var_1474:String = "";
      
      private var var_2063:Boolean;
      
      public function RoomObjectMouseEvent(param1:String, param2:String, param3:int, param4:String, param5:Boolean = false, param6:Boolean = false, param7:Boolean = false, param8:Boolean = false, param9:Boolean = false, param10:Boolean = false)
      {
         super(param1,param3,param4,param9,param10);
         this.var_1474 = param2;
         this.var_2066 = param5;
         this.var_2065 = param6;
         this.var_2063 = param7;
         this.var_2069 = param8;
      }
      
      public function get eventId() : String
      {
         return this.var_1474;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2065;
      }
      
      public function get buttonDown() : Boolean
      {
         return this.var_2069;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2066;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_2063;
      }
   }
}
