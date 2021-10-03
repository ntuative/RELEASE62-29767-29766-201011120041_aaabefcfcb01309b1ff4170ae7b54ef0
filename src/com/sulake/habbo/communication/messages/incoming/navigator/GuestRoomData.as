package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class GuestRoomData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_1922:int;
      
      private var var_2384:String;
      
      private var var_2385:int;
      
      private var var_461:int;
      
      private var var_665:Boolean;
      
      private var var_2057:Boolean;
      
      private var var_315:int;
      
      private var var_1443:String;
      
      private var var_2054:int;
      
      private var var_1297:int;
      
      private var _ownerName:String;
      
      private var var_864:String;
      
      private var var_2382:int;
      
      private var var_2383:RoomThumbnailData;
      
      private var var_2078:Boolean;
      
      private var var_734:Array;
      
      public function GuestRoomData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         this.var_734 = new Array();
         super();
         this.var_315 = param1.readInteger();
         this.var_665 = param1.readBoolean();
         this.var_864 = param1.readString();
         this._ownerName = param1.readString();
         this.var_2054 = param1.readInteger();
         this.var_1922 = param1.readInteger();
         this.var_2382 = param1.readInteger();
         this.var_1443 = param1.readString();
         this.var_2385 = param1.readInteger();
         this.var_2078 = param1.readBoolean();
         this.var_461 = param1.readInteger();
         this.var_1297 = param1.readInteger();
         this.var_2384 = param1.readString();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = param1.readString();
            this.var_734.push(_loc4_);
            _loc3_++;
         }
         this.var_2383 = new RoomThumbnailData(param1);
         this.var_2057 = param1.readBoolean();
      }
      
      public function get maxUserCount() : int
      {
         return this.var_2382;
      }
      
      public function get roomName() : String
      {
         return this.var_864;
      }
      
      public function get userCount() : int
      {
         return this.var_1922;
      }
      
      public function get score() : int
      {
         return this.var_461;
      }
      
      public function get eventCreationTime() : String
      {
         return this.var_2384;
      }
      
      public function get allowTrading() : Boolean
      {
         return this.var_2078;
      }
      
      public function get tags() : Array
      {
         return this.var_734;
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2057;
      }
      
      public function get event() : Boolean
      {
         return this.var_665;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this.var_734 = null;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get categoryId() : int
      {
         return this.var_1297;
      }
      
      public function get srchSpecPrm() : int
      {
         return this.var_2385;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get thumbnail() : RoomThumbnailData
      {
         return this.var_2383;
      }
      
      public function get doorMode() : int
      {
         return this.var_2054;
      }
      
      public function get flatId() : int
      {
         return this.var_315;
      }
      
      public function get description() : String
      {
         return this.var_1443;
      }
   }
}
