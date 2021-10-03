package com.sulake.habbo.widget.events
{
   import flash.display.BitmapData;
   
   public class RoomWidgetUserInfoUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_196:String = "RWUIUE_PEER";
      
      public static const const_197:String = "RWUIUE_OWN_USER";
      
      public static const TRADE_REASON_NO_OWN_RIGHT:int = 1;
      
      public static const BOT:String = "RWUIUE_BOT";
      
      public static const const_1289:String = "BOT";
      
      public static const const_864:int = 2;
      
      public static const const_1353:int = 0;
      
      public static const const_998:int = 3;
       
      
      private var var_597:String = "";
      
      private var var_1700:String = "";
      
      private var var_2184:Boolean = false;
      
      private var var_1895:int = 0;
      
      private var var_2181:int = 0;
      
      private var var_2179:Boolean = false;
      
      private var var_1412:String = "";
      
      private var var_2175:Boolean = false;
      
      private var _respectLeft:int = 0;
      
      private var var_2180:Boolean = true;
      
      private var var_1236:int = 0;
      
      private var var_2186:Boolean = false;
      
      private var var_1745:Boolean = false;
      
      private var var_2185:Boolean = false;
      
      private var var_2183:int = 0;
      
      private var var_2178:Boolean = false;
      
      private var var_39:BitmapData = null;
      
      private var var_233:Array;
      
      private var var_1744:Boolean = false;
      
      private var _name:String = "";
      
      private var var_1899:int = 0;
      
      private var var_2176:Boolean = false;
      
      private var var_2177:int = 0;
      
      private var var_2182:String = "";
      
      public function RoomWidgetUserInfoUpdateEvent(param1:String, param2:Boolean = false, param3:Boolean = false)
      {
         this.var_233 = [];
         super(param1,param2,param3);
      }
      
      public function get userRoomId() : int
      {
         return this.var_2181;
      }
      
      public function set userRoomId(param1:int) : void
      {
         this.var_2181 = param1;
      }
      
      public function get canBeAskedAsFriend() : Boolean
      {
         return this.var_2184;
      }
      
      public function get canBeKicked() : Boolean
      {
         return this.var_2180;
      }
      
      public function set canBeKicked(param1:Boolean) : void
      {
         this.var_2180 = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set amIAnyRoomController(param1:Boolean) : void
      {
         this.var_2175 = param1;
      }
      
      public function get motto() : String
      {
         return this.var_1700;
      }
      
      public function set isIgnored(param1:Boolean) : void
      {
         this.var_2186 = param1;
      }
      
      public function get isRoomOwner() : Boolean
      {
         return this.var_1745;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1700 = param1;
      }
      
      public function get amIOwner() : Boolean
      {
         return this.var_2176;
      }
      
      public function get groupBadgeId() : String
      {
         return this.var_2182;
      }
      
      public function set isRoomOwner(param1:Boolean) : void
      {
         this.var_1745 = param1;
      }
      
      public function get hasFlatControl() : Boolean
      {
         return this.var_2178;
      }
      
      public function set carryItem(param1:int) : void
      {
         this.var_2183 = param1;
      }
      
      public function get badges() : Array
      {
         return this.var_233;
      }
      
      public function get amIController() : Boolean
      {
         return this.var_2179;
      }
      
      public function set amIController(param1:Boolean) : void
      {
         this.var_2179 = param1;
      }
      
      public function set amIOwner(param1:Boolean) : void
      {
         this.var_2176 = param1;
      }
      
      public function set image(param1:BitmapData) : void
      {
         this.var_39 = param1;
      }
      
      public function set canTradeReason(param1:int) : void
      {
         this.var_2177 = param1;
      }
      
      public function set groupBadgeId(param1:String) : void
      {
         this.var_2182 = param1;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1412 = param1;
      }
      
      public function get amIAnyRoomController() : Boolean
      {
         return this.var_2175;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_597 = param1;
      }
      
      public function get carryItem() : int
      {
         return this.var_2183;
      }
      
      public function get isSpectatorMode() : Boolean
      {
         return this.var_1744;
      }
      
      public function get isIgnored() : Boolean
      {
         return this.var_2186;
      }
      
      public function set respectLeft(param1:int) : void
      {
         this._respectLeft = param1;
      }
      
      public function get image() : BitmapData
      {
         return this.var_39;
      }
      
      public function get canTradeReason() : int
      {
         return this.var_2177;
      }
      
      public function get realName() : String
      {
         return this.var_1412;
      }
      
      public function get figure() : String
      {
         return this.var_597;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_1899 = param1;
      }
      
      public function set badges(param1:Array) : void
      {
         this.var_233 = param1;
      }
      
      public function set canTrade(param1:Boolean) : void
      {
         this.var_2185 = param1;
      }
      
      public function set hasFlatControl(param1:Boolean) : void
      {
         this.var_2178 = param1;
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
      
      public function get webID() : int
      {
         return this.var_1899;
      }
      
      public function set groupId(param1:int) : void
      {
         this.var_1236 = param1;
      }
      
      public function get xp() : int
      {
         return this.var_1895;
      }
      
      public function set canBeAskedAsFriend(param1:Boolean) : void
      {
         this.var_2184 = param1;
      }
      
      public function get groupId() : int
      {
         return this.var_1236;
      }
      
      public function get canTrade() : Boolean
      {
         return this.var_2185;
      }
      
      public function set isSpectatorMode(param1:Boolean) : void
      {
         this.var_1744 = param1;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_1895 = param1;
      }
   }
}
