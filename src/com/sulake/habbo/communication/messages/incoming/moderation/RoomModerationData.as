package com.sulake.habbo.communication.messages.incoming.moderation
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class RoomModerationData implements IDisposable
   {
       
      
      private var var_110:RoomData;
      
      private var _disposed:Boolean;
      
      private var var_1922:int;
      
      private var var_315:int;
      
      private var var_665:RoomData;
      
      private var var_1921:int;
      
      private var _ownerName:String;
      
      private var var_1920:Boolean;
      
      public function RoomModerationData(param1:IMessageDataWrapper)
      {
         super();
         this.var_315 = param1.readInteger();
         this.var_1922 = param1.readInteger();
         this.var_1920 = param1.readBoolean();
         this.var_1921 = param1.readInteger();
         this._ownerName = param1.readString();
         this.var_110 = new RoomData(param1);
         this.var_665 = new RoomData(param1);
      }
      
      public function get userCount() : int
      {
         return this.var_1922;
      }
      
      public function get event() : RoomData
      {
         return this.var_665;
      }
      
      public function get room() : RoomData
      {
         return this.var_110;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_110 != null)
         {
            this.var_110.dispose();
            this.var_110 = null;
         }
         if(this.var_665 != null)
         {
            this.var_665.dispose();
            this.var_665 = null;
         }
      }
      
      public function get flatId() : int
      {
         return this.var_315;
      }
      
      public function get ownerId() : int
      {
         return this.var_1921;
      }
      
      public function get ownerInRoom() : Boolean
      {
         return this.var_1920;
      }
   }
}
