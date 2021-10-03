package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomThumbnailData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_687:int;
      
      private var _objects:Array;
      
      private var var_567:int;
      
      public function RoomThumbnailData(param1:IMessageDataWrapper)
      {
         var _loc4_:* = null;
         this._objects = new Array();
         super();
         if(param1 == null)
         {
            return;
         }
         this.var_567 = param1.readInteger();
         this.var_687 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            _loc4_ = new RoomThumbnailObjectData();
            _loc4_.pos = param1.readInteger();
            _loc4_.imgId = param1.readInteger();
            this._objects.push(_loc4_);
            _loc3_++;
         }
         if(this.var_567 == 0)
         {
            this.setDefaults();
         }
      }
      
      public function get bgImgId() : int
      {
         return this.var_567;
      }
      
      private function setDefaults() : void
      {
         this.var_567 = 1;
         this.var_687 = 0;
         var _loc1_:RoomThumbnailObjectData = new RoomThumbnailObjectData();
         _loc1_.pos = 4;
         _loc1_.imgId = 1;
         this._objects.push(_loc1_);
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function getCopy() : RoomThumbnailData
      {
         var _loc2_:* = null;
         var _loc1_:RoomThumbnailData = new RoomThumbnailData(null);
         _loc1_.var_567 = this.var_567;
         _loc1_.var_687 = this.var_687;
         for each(_loc2_ in this._objects)
         {
            _loc1_._objects.push(_loc2_.getCopy());
         }
         return _loc1_;
      }
      
      public function set frontImgId(param1:int) : void
      {
         this.var_687 = param1;
      }
      
      public function set bgImgId(param1:int) : void
      {
         this.var_567 = param1;
      }
      
      public function get objects() : Array
      {
         return this._objects;
      }
      
      public function getAsString() : String
      {
         var _loc2_:* = null;
         var _loc1_:* = this.var_687 + ";";
         _loc1_ += this.var_567 + ";";
         for each(_loc2_ in this._objects)
         {
            _loc1_ += _loc2_.imgId + "," + _loc2_.pos + ";";
         }
         return _loc1_;
      }
      
      public function get frontImgId() : int
      {
         return this.var_687;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         this._objects = null;
      }
   }
}
