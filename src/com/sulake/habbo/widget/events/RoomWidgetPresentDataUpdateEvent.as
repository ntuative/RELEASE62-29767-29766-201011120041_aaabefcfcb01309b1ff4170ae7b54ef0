package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetPresentDataUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_417:String = "RWPDUE_CONTENTS_CLUB";
      
      public static const const_496:String = "RWPDUE_CONTENTS_LANDSCAPE";
      
      public static const const_82:String = "RWPDUE_CONTENTS";
      
      public static const const_403:String = "RWPDUE_CONTENTS_WALLPAPER";
      
      public static const const_450:String = "RWPDUE_CONTENTS_FLOOR";
      
      public static const const_65:String = "RWPDUE_PACKAGEINFO";
       
      
      private var _text:String;
      
      private var var_2420:BitmapData;
      
      private var var_287:int = -1;
      
      private var _controller:Boolean;
      
      public function RoomWidgetPresentDataUpdateEvent(param1:String, param2:int, param3:String, param4:Boolean = false, param5:BitmapData = null, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         this.var_287 = param2;
         this._text = param3;
         this._controller = param4;
         this.var_2420 = param5;
      }
      
      public function get iconBitmapData() : BitmapData
      {
         return this.var_2420;
      }
      
      public function get text() : String
      {
         return this._text;
      }
      
      public function get objectId() : int
      {
         return this.var_287;
      }
      
      public function get controller() : Boolean
      {
         return this._controller;
      }
   }
}
