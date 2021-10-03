package com.sulake.habbo.communication.messages.incoming.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FlatControllerData
   {
       
      
      private var _userName:String;
      
      private var var_178:Boolean;
      
      private var _userId:int;
      
      public function FlatControllerData(param1:IMessageDataWrapper)
      {
         super();
         this._userId = param1.readInteger();
         this._userName = param1.readString();
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get selected() : Boolean
      {
         return this.var_178;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function set selected(param1:Boolean) : void
      {
         this.var_178 = param1;
      }
   }
}
