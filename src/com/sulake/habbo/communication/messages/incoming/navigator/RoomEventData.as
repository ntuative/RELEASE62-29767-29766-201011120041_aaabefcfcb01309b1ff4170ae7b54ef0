package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomEventData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_2258:String;
      
      private var var_315:int;
      
      private var var_2524:String;
      
      private var var_2526:String;
      
      private var var_2525:int;
      
      private var var_2528:String;
      
      private var var_2527:int;
      
      private var var_734:Array;
      
      private var var_1035:Boolean;
      
      public function RoomEventData(param1:IMessageDataWrapper)
      {
         var _loc5_:* = null;
         this.var_734 = new Array();
         super();
         var _loc2_:String = param1.readString();
         if(_loc2_ == "-1")
         {
            Logger.log("Got null room event");
            this.var_1035 = false;
            return;
         }
         this.var_1035 = true;
         this.var_2525 = int(_loc2_);
         this.var_2524 = param1.readString();
         this.var_315 = int(param1.readString());
         this.var_2527 = param1.readInteger();
         this.var_2258 = param1.readString();
         this.var_2526 = param1.readString();
         this.var_2528 = param1.readString();
         var _loc3_:int = param1.readInteger();
         var _loc4_:int = 0;
         while(_loc4_ < _loc3_)
         {
            _loc5_ = param1.readString();
            this.var_734.push(_loc5_);
            _loc4_++;
         }
      }
      
      public function get eventType() : int
      {
         return this.var_2527;
      }
      
      public function get eventName() : String
      {
         return this.var_2258;
      }
      
      public function get eventDescription() : String
      {
         return this.var_2526;
      }
      
      public function get ownerAvatarName() : String
      {
         return this.var_2524;
      }
      
      public function get tags() : Array
      {
         return this.var_734;
      }
      
      public function get creationTime() : String
      {
         return this.var_2528;
      }
      
      public function get exists() : Boolean
      {
         return this.var_1035;
      }
      
      public function get ownerAvatarId() : int
      {
         return this.var_2525;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
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
      
      public function get flatId() : int
      {
         return this.var_315;
      }
   }
}
