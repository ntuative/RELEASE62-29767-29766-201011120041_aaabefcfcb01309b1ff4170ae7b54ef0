package com.sulake.habbo.widget.events
{
   import flash.geom.Point;
   import flash.geom.Rectangle;
   
   public class RoomWidgetRoomViewUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_762:String = "RWRVUE_ROOM_VIEW_POSITION_CHANGED";
      
      public static const const_673:String = "RWRVUE_ROOM_VIEW_SCALE_CHANGED";
      
      public static const const_285:String = "RWRVUE_ROOM_VIEW_SIZE_CHANGED";
       
      
      private var var_1711:Point;
      
      private var var_1712:Rectangle;
      
      private var _scale:Number = 0.0;
      
      public function RoomWidgetRoomViewUpdateEvent(param1:String, param2:Rectangle = null, param3:Point = null, param4:Number = 0.0, param5:Boolean = false, param6:Boolean = false)
      {
         super(param1,param5,param6);
         this.var_1712 = param2;
         this.var_1711 = param3;
         this._scale = param4;
      }
      
      public function get rect() : Rectangle
      {
         if(this.var_1712 != null)
         {
            return this.var_1712.clone();
         }
         return null;
      }
      
      public function get scale() : Number
      {
         return this._scale;
      }
      
      public function get positionDelta() : Point
      {
         if(this.var_1711 != null)
         {
            return this.var_1711.clone();
         }
         return null;
      }
   }
}
