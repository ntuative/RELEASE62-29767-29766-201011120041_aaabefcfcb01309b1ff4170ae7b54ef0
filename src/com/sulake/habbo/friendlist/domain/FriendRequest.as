package com.sulake.habbo.friendlist.domain
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendRequestData;
   
   public class FriendRequest implements IDisposable
   {
      
      public static const const_315:int = 2;
      
      public static const const_146:int = 1;
      
      public static const const_1054:int = 4;
      
      public static const const_345:int = 3;
       
      
      private var var_2168:int;
      
      private var _view:IWindowContainer;
      
      private var var_2167:String;
      
      private var _state:int = 1;
      
      private var _disposed:Boolean;
      
      private var var_939:int;
      
      public function FriendRequest(param1:FriendRequestData)
      {
         super();
         this.var_939 = param1.requestId;
         this.var_2167 = param1.requesterName;
         this.var_2168 = param1.requesterUserId;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get requesterName() : String
      {
         return this.var_2167;
      }
      
      public function get requesterUserId() : int
      {
         return this.var_2168;
      }
      
      public function get requestId() : int
      {
         return this.var_939;
      }
      
      public function get state() : int
      {
         return this._state;
      }
      
      public function get view() : IWindowContainer
      {
         return this._view;
      }
      
      public function set view(param1:IWindowContainer) : void
      {
         this._view = param1;
      }
      
      public function set state(param1:int) : void
      {
         this._state = param1;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.view != null)
         {
            this.view.destroy();
            this.view = null;
         }
      }
   }
}
