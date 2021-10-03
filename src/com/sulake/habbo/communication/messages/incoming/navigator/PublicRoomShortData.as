package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomShortData implements IDisposable
   {
       
      
      private var _disposed:Boolean;
      
      private var var_2075:String;
      
      private var var_1862:int;
      
      public function PublicRoomShortData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2075 = param1.readString();
         this.var_1862 = param1.readInteger();
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
      }
      
      public function get unitPropertySet() : String
      {
         return this.var_2075;
      }
      
      public function get worldId() : int
      {
         return this.var_1862;
      }
   }
}
