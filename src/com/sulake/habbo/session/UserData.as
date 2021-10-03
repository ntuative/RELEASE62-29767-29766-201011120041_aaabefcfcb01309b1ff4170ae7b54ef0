package com.sulake.habbo.session
{
   public class UserData implements IUserData
   {
       
      
      private var var_597:String = "";
      
      private var var_1897:String = "";
      
      private var var_1901:int = 0;
      
      private var var_1895:int = 0;
      
      private var _type:int = 0;
      
      private var var_1896:String = "";
      
      private var var_789:String = "";
      
      private var _id:int = -1;
      
      private var _name:String = "";
      
      private var var_1899:int = 0;
      
      public function UserData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function set groupStatus(param1:int) : void
      {
         this.var_1901 = param1;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function set groupID(param1:String) : void
      {
         this.var_1896 = param1;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_597 = param1;
      }
      
      public function set sex(param1:String) : void
      {
         this.var_789 = param1;
      }
      
      public function get groupStatus() : int
      {
         return this.var_1901;
      }
      
      public function set webID(param1:int) : void
      {
         this.var_1899 = param1;
      }
      
      public function get groupID() : String
      {
         return this.var_1896;
      }
      
      public function get figure() : String
      {
         return this.var_597;
      }
      
      public function get sex() : String
      {
         return this.var_789;
      }
      
      public function set custom(param1:String) : void
      {
         this.var_1897 = param1;
      }
      
      public function get custom() : String
      {
         return this.var_1897;
      }
      
      public function get webID() : int
      {
         return this.var_1899;
      }
      
      public function set xp(param1:int) : void
      {
         this.var_1895 = param1;
      }
      
      public function set type(param1:int) : void
      {
         this._type = param1;
      }
      
      public function get xp() : int
      {
         return this.var_1895;
      }
   }
}
