package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserFigureUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_151:String = "RWUTUE_USER_FIGURE";
       
      
      private var var_39:BitmapData;
      
      private var _userId:int;
      
      private var var_2085:Boolean;
      
      private var var_1503:String = "";
      
      public function RoomWidgetUserFigureUpdateEvent(param1:int, param2:BitmapData, param3:Boolean, param4:String, param5:Boolean = false, param6:Boolean = false)
      {
         super(const_151,param5,param6);
         this._userId = param1;
         this.var_39 = param2;
         this.var_2085 = param3;
         this.var_1503 = param4;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get isOwnUser() : Boolean
      {
         return this.var_2085;
      }
      
      public function get image() : BitmapData
      {
         return this.var_39;
      }
      
      public function get customInfo() : String
      {
         return this.var_1503;
      }
   }
}
