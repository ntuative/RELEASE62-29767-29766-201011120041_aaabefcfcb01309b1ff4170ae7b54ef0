package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PublicRoomData implements IDisposable
   {
       
      
      private var var_2106:int;
      
      private var var_2240:String;
      
      private var var_1862:int;
      
      private var _disposed:Boolean;
      
      private var var_2422:int;
      
      private var var_2075:String;
      
      private var var_1771:int;
      
      public function PublicRoomData(param1:IMessageDataWrapper)
      {
         super();
         this.var_2075 = param1.readString();
         this.var_2106 = param1.readInteger();
         this.var_1862 = param1.readInteger();
         this.var_2240 = param1.readString();
         this.var_2422 = param1.readInteger();
         this.var_1771 = param1.readInteger();
      }
      
      public function get maxUsers() : int
      {
         return this.var_2422;
      }
      
      public function get worldId() : int
      {
         return this.var_1862;
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
      
      public function get unitPort() : int
      {
         return this.var_2106;
      }
      
      public function get castLibs() : String
      {
         return this.var_2240;
      }
      
      public function get nodeId() : int
      {
         return this.var_1771;
      }
   }
}
