package com.sulake.habbo.room.events
{
   public class RoomEngineObjectEvent extends RoomEngineEvent
   {
      
      public static const const_266:String = "REOB_OBJECT_ADDED";
      
      public static const const_461:String = "REOE_ROOM_AD_FURNI_CLICK";
      
      public static const ROOM_OBJECT_WIDGET_REMOVE_DIMMER:String = "REOR_REMOVE_DIMMER";
      
      public static const const_118:String = "REOE_WIDGET_REQUEST_CREDITFURNI";
      
      public static const const_246:String = "REOB_OBJECT_PLACED";
      
      public static const const_114:String = "REOE_WIDGET_REQUEST_STICKIE";
      
      public static const const_478:String = "REOE_ROOM_AD_FURNI_DOUBLE_CLICK";
      
      public static const const_113:String = "REOE_WIDGET_REQUEST_DIMMER";
      
      public static const const_568:String = "REOE_OBJECT_REMOVED";
      
      public static const const_116:String = "REOR_REQUEST_CLOTHING_CHANGE";
      
      public static const const_128:String = "REOE_WIDGET_REQUEST_PLACEHOLDER";
      
      public static const const_126:String = "REOE_WIDGET_REQUEST_ECOTRONBOX";
      
      public static const const_483:String = "REOE_ROOM_AD_TOOLTIP_SHOW";
      
      public static const const_651:String = "REOE_OBJECT_SELECTED";
      
      public static const const_452:String = "REOE_OBJECT_DESELECTED";
      
      public static const const_477:String = "REOE_ROOM_AD_TOOLTIP_HIDE";
      
      public static const const_117:String = "REOE_WIDGET_REQUEST_PRESENT";
      
      public static const const_624:String = "REOB_OBJECT_REQUEST_MOVE";
      
      public static const const_130:String = "REOE_WIDGET_REQUEST_TROPHY";
       
      
      private var _roomId:int;
      
      private var _roomCategory:int;
      
      private var var_287:int;
      
      private var _category:int;
      
      public function RoomEngineObjectEvent(param1:String, param2:int, param3:int, param4:int, param5:int, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param2,param3,param6,param7);
         this.var_287 = param4;
         this._category = param5;
      }
      
      public function get objectId() : int
      {
         return this.var_287;
      }
      
      public function get category() : int
      {
         return this._category;
      }
   }
}
