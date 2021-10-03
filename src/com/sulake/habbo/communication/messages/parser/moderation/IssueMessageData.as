package com.sulake.habbo.communication.messages.parser.moderation
{
   import flash.utils.getTimer;
   
   public class IssueMessageData
   {
      
      public static const const_146:int = 1;
      
      public static const const_1370:int = 3;
      
      public static const const_341:int = 2;
       
      
      private var var_2105:int;
      
      private var var_2106:int;
      
      private var var_2111:int;
      
      private var var_1862:int;
      
      private var _state:int;
      
      private var var_315:int;
      
      private var var_1674:int;
      
      private var var_1870:int;
      
      private var var_1353:int;
      
      private var var_2113:String;
      
      private var var_2108:int;
      
      private var var_2107:int;
      
      private var var_2110:String;
      
      private var var_2109:String;
      
      private var var_2104:int = 0;
      
      private var var_1754:String;
      
      private var _message:String;
      
      private var var_2071:int;
      
      private var var_2112:String;
      
      private var var_1297:int;
      
      private var var_864:String;
      
      private var var_2114:String;
      
      private var var_1444:int;
      
      public function IssueMessageData()
      {
         super();
      }
      
      public function set reportedUserId(param1:int) : void
      {
         this.var_1353 = param1;
      }
      
      public function set temporalPriority(param1:int) : void
      {
         this.var_2104 = param1;
      }
      
      public function get reporterUserId() : int
      {
         return this.var_2107;
      }
      
      public function set roomName(param1:String) : void
      {
         this.var_864 = param1;
      }
      
      public function set chatRecordId(param1:int) : void
      {
         this.var_2108 = param1;
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      public function get roomResources() : String
      {
         return this.var_2113;
      }
      
      public function set roomResources(param1:String) : void
      {
         this.var_2113 = param1;
      }
      
      public function get roomName() : String
      {
         return this.var_864;
      }
      
      public function get message() : String
      {
         return this._message;
      }
      
      public function set worldId(param1:int) : void
      {
         this.var_1862 = param1;
      }
      
      public function set state(param1:int) : void
      {
         this._state = param1;
      }
      
      public function get unitPort() : int
      {
         return this.var_2106;
      }
      
      public function get priority() : int
      {
         return this.var_2105 + this.var_2104;
      }
      
      public function set issueId(param1:int) : void
      {
         this.var_1870 = param1;
      }
      
      public function get pickerUserName() : String
      {
         return this.var_2109;
      }
      
      public function getOpenTime() : String
      {
         var _loc1_:int = (getTimer() - this.var_1444) / 1000;
         var _loc2_:int = _loc1_ % 60;
         var _loc3_:int = _loc1_ / 60;
         var _loc4_:int = _loc3_ % 60;
         var _loc5_:int = _loc3_ / 60;
         var _loc6_:String = _loc2_ < 10 ? "0" + _loc2_ : "" + _loc2_;
         var _loc7_:String = _loc4_ < 10 ? "0" + _loc4_ : "" + _loc4_;
         var _loc8_:String = _loc5_ < 10 ? "0" + _loc5_ : "" + _loc5_;
         return _loc8_ + ":" + _loc7_ + ":" + _loc6_;
      }
      
      public function get categoryId() : int
      {
         return this.var_1297;
      }
      
      public function set reporterUserId(param1:int) : void
      {
         this.var_2107 = param1;
      }
      
      public function get roomType() : int
      {
         return this.var_1674;
      }
      
      public function set flatType(param1:String) : void
      {
         this.var_2110 = param1;
      }
      
      public function get chatRecordId() : int
      {
         return this.var_2108;
      }
      
      public function set message(param1:String) : void
      {
         this._message = param1;
      }
      
      public function get worldId() : int
      {
         return this.var_1862;
      }
      
      public function set flatOwnerName(param1:String) : void
      {
         this.var_2114 = param1;
      }
      
      public function set reportedUserName(param1:String) : void
      {
         this.var_1754 = param1;
      }
      
      public function get issueId() : int
      {
         return this.var_1870;
      }
      
      public function set priority(param1:int) : void
      {
         this.var_2105 = param1;
      }
      
      public function set unitPort(param1:int) : void
      {
         this.var_2106 = param1;
      }
      
      public function get flatType() : String
      {
         return this.var_2110;
      }
      
      public function set reportedCategoryId(param1:int) : void
      {
         this.var_2111 = param1;
      }
      
      public function set pickerUserName(param1:String) : void
      {
         this.var_2109 = param1;
      }
      
      public function set pickerUserId(param1:int) : void
      {
         this.var_2071 = param1;
      }
      
      public function get reportedUserName() : String
      {
         return this.var_1754;
      }
      
      public function set roomType(param1:int) : void
      {
         this.var_1674 = param1;
      }
      
      public function get reportedCategoryId() : int
      {
         return this.var_2111;
      }
      
      public function set flatId(param1:int) : void
      {
         this.var_315 = param1;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1297 = param1;
      }
      
      public function set timeStamp(param1:int) : void
      {
         this.var_1444 = param1;
      }
      
      public function get pickerUserId() : int
      {
         return this.var_2071;
      }
      
      public function set reporterUserName(param1:String) : void
      {
         this.var_2112 = param1;
      }
      
      public function get timeStamp() : int
      {
         return this.var_1444;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1353;
      }
      
      public function get flatId() : int
      {
         return this.var_315;
      }
      
      public function get flatOwnerName() : String
      {
         return this.var_2114;
      }
      
      public function get reporterUserName() : String
      {
         return this.var_2112;
      }
   }
}
