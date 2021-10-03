package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetChatUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_110:int = 1;
      
      public static const const_302:int = 4;
      
      public static const const_284:int = 3;
      
      public static const const_112:int = 0;
      
      public static const const_698:String = "RWCUE_EVENT_CHAT";
      
      public static const const_106:int = 2;
       
      
      private var var_1975:int;
      
      private var _text:String = "";
      
      private var var_1972:BitmapData;
      
      private var _userName:String;
      
      private var var_1267:int = 0;
      
      private var var_1974:uint;
      
      private var _userId:int = 0;
      
      private var _roomCategory:int;
      
      private var var_1976:Number;
      
      private var var_1973:Number;
      
      private var _roomId:int;
      
      private var var_1263:Array;
      
      public function RoomWidgetChatUpdateEvent(param1:String, param2:int, param3:String, param4:String, param5:int, param6:Number, param7:Number, param8:BitmapData, param9:uint, param10:int, param11:int, param12:int = 0, param13:Array = null, param14:Boolean = false, param15:Boolean = false)
      {
         super(param1,param14,param15);
         this._userId = param2;
         this._text = param3;
         this.var_1267 = param12;
         this._userName = param4;
         this.var_1975 = param5;
         this.var_1263 = param13;
         this.var_1976 = param6;
         this.var_1973 = param7;
         this.var_1972 = param8;
         this.var_1974 = param9;
         this._roomId = param10;
         this._roomCategory = param11;
      }
      
      public function get links() : Array
      {
         return this.var_1263;
      }
      
      public function get userColor() : uint
      {
         return this.var_1974;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get userImage() : BitmapData
      {
         return this.var_1972;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get text() : String
      {
         return this._text;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function get userCategory() : int
      {
         return this.var_1975;
      }
      
      public function get chatType() : int
      {
         return this.var_1267;
      }
      
      public function get userX() : Number
      {
         return this.var_1976;
      }
      
      public function get userY() : Number
      {
         return this.var_1973;
      }
   }
}
