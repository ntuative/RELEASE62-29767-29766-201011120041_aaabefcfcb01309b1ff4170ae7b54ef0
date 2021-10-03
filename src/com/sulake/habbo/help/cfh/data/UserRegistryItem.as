package com.sulake.habbo.help.cfh.data
{
   public class UserRegistryItem
   {
       
      
      private var var_864:String = "";
      
      private var _userName:String = "";
      
      private var _userId:int;
      
      public function UserRegistryItem(param1:int, param2:String, param3:String = "")
      {
         super();
         this._userId = param1;
         this._userName = param2;
         this.var_864 = param3;
      }
      
      public function set roomName(param1:String) : void
      {
         this.var_864 = param1;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get userName() : String
      {
         return this._userName;
      }
      
      public function get roomName() : String
      {
         return this.var_864;
      }
   }
}
