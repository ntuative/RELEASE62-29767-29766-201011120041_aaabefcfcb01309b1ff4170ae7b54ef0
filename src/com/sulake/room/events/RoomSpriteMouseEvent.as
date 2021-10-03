package com.sulake.room.events
{
   public class RoomSpriteMouseEvent
   {
       
      
      private var var_2069:Boolean = false;
      
      private var var_2066:Boolean = false;
      
      private var var_1474:String = "";
      
      private var _type:String = "";
      
      private var var_2063:Boolean = false;
      
      private var var_2014:String = "";
      
      private var var_2068:Number = 0;
      
      private var var_2062:Number = 0;
      
      private var var_2061:String = "";
      
      private var var_2064:Number = 0;
      
      private var var_2065:Boolean = false;
      
      private var var_2067:Number = 0;
      
      public function RoomSpriteMouseEvent(param1:String, param2:String, param3:String, param4:String, param5:Number, param6:Number, param7:Number = 0, param8:Number = 0, param9:Boolean = false, param10:Boolean = false, param11:Boolean = false, param12:Boolean = false)
      {
         super();
         this._type = param1;
         this.var_1474 = param2;
         this.var_2061 = param3;
         this.var_2014 = param4;
         this.var_2068 = param5;
         this.var_2062 = param6;
         this.var_2067 = param7;
         this.var_2064 = param8;
         this.var_2065 = param9;
         this.var_2066 = param10;
         this.var_2063 = param11;
         this.var_2069 = param12;
      }
      
      public function get spriteTag() : String
      {
         return this.var_2014;
      }
      
      public function get ctrlKey() : Boolean
      {
         return this.var_2065;
      }
      
      public function get screenX() : Number
      {
         return this.var_2068;
      }
      
      public function get buttonDown() : Boolean
      {
         return this.var_2069;
      }
      
      public function get localX() : Number
      {
         return this.var_2067;
      }
      
      public function get localY() : Number
      {
         return this.var_2064;
      }
      
      public function get canvasId() : String
      {
         return this.var_2061;
      }
      
      public function get altKey() : Boolean
      {
         return this.var_2066;
      }
      
      public function get eventId() : String
      {
         return this.var_1474;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function get screenY() : Number
      {
         return this.var_2062;
      }
      
      public function get shiftKey() : Boolean
      {
         return this.var_2063;
      }
   }
}
