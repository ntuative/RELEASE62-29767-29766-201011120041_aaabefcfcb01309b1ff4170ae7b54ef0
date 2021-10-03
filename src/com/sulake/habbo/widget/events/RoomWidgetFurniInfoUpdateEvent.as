package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetFurniInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_613:String = "RWFIUE_FURNI";
       
      
      private var var_1742:Boolean = false;
      
      private var var_2156:int = -1;
      
      private var var_2094:Boolean = false;
      
      private var var_2155:Boolean = false;
      
      private var _id:int = 0;
      
      private var var_1476:int = -1;
      
      private var var_1745:Boolean = false;
      
      private var var_1443:String = "";
      
      private var _offerId:int = -1;
      
      private var var_39:BitmapData = null;
      
      private var _category:int = 0;
      
      private var var_2157:Boolean = false;
      
      private var _name:String = "";
      
      public function RoomWidgetFurniInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         super(param1,param2,param3);
      }
      
      public function get catalogPageId() : int
      {
         return this.var_2156;
      }
      
      public function set catalogPageId(param1:int) : void
      {
         this.var_2156 = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set isWallItem(param1:Boolean) : void
      {
         this.var_2157 = param1;
      }
      
      public function set category(param1:int) : void
      {
         this._category = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return this.var_1745;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get offerId() : int
      {
         return this._offerId;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get isRoomController() : Boolean
      {
         return this.var_1742;
      }
      
      public function get isStickie() : Boolean
      {
         return this.var_2155;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         this.var_1745 = param1;
      }
      
      public function set offerId(param1:int) : void
      {
         this._offerId = param1;
      }
      
      public function get expiration() : int
      {
         return this.var_1476;
      }
      
      public function set isAnyRoomController(param1:Boolean) : void
      {
         this.var_2094 = param1;
      }
      
      public function set image(param1:BitmapData) : void
      {
         this.var_39 = param1;
      }
      
      public function set id(param1:int) : void
      {
         this._id = param1;
      }
      
      public function set isRoomController(param1:Boolean) : void
      {
         this.var_1742 = param1;
      }
      
      public function set isStickie(param1:Boolean) : void
      {
         this.var_2155 = param1;
      }
      
      public function get isWallItem() : Boolean
      {
         return this.var_2157;
      }
      
      public function get isAnyRoomController() : Boolean
      {
         return this.var_2094;
      }
      
      public function get image() : BitmapData
      {
         return this.var_39;
      }
      
      public function set expiration(param1:int) : void
      {
         this.var_1476 = param1;
      }
      
      public function set description(param1:String) : void
      {
         this.var_1443 = param1;
      }
      
      public function get description() : String
      {
         return this.var_1443;
      }
      
      public function get category() : int
      {
         return this._category;
      }
   }
}
