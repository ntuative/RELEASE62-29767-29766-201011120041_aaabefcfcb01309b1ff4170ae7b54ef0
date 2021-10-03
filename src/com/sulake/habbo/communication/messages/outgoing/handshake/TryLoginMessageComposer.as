package com.sulake.habbo.communication.messages.outgoing.handshake
{
   import com.sulake.core.communication.messages.IMessageComposer;
   
   public class TryLoginMessageComposer implements IMessageComposer
   {
       
      
      private var var_2093:String;
      
      private var _password:String;
      
      private var _userId:int;
      
      public function TryLoginMessageComposer(param1:String, param2:String, param3:int)
      {
         super();
         this.var_2093 = param1;
         this._password = param2;
         this._userId = param3;
      }
      
      public function getMessageArray() : Array
      {
         return [this.var_2093,this._password,this._userId];
      }
      
      public function dispose() : void
      {
      }
   }
}
