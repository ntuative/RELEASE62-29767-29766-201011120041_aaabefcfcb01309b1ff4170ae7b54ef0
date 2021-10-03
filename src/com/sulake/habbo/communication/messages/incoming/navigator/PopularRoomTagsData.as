package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class PopularRoomTagsData implements IDisposable, MsgWithRequestId
   {
       
      
      private var _disposed:Boolean;
      
      private var var_734:Array;
      
      public function PopularRoomTagsData(param1:IMessageDataWrapper)
      {
         this.var_734 = new Array();
         super();
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            this.var_734.push(new PopularTagData(param1));
            _loc3_++;
         }
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
      
      public function get tags() : Array
      {
         return this.var_734;
      }
   }
}
