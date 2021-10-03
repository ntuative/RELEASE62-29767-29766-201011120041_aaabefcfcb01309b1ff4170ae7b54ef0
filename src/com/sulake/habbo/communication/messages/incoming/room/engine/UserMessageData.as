package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserMessageData
   {
      
      public static const const_1366:String = "F";
      
      public static const const_982:String = "M";
       
      
      private var _x:Number = 0;
      
      private var var_597:String = "";
      
      private var var_1900:int = 0;
      
      private var var_1897:String = "";
      
      private var var_1901:int = 0;
      
      private var var_1895:int = 0;
      
      private var var_1896:String = "";
      
      private var var_789:String = "";
      
      private var _id:int = 0;
      
      private var var_172:Boolean = false;
      
      private var var_243:int = 0;
      
      private var var_1898:String = "";
      
      private var _name:String = "";
      
      private var var_1899:int = 0;
      
      private var var_162:Number = 0;
      
      private var var_163:Number = 0;
      
      public function UserMessageData(param1:int)
      {
         super();
         this._id = param1;
      }
      
      public function get z() : Number
      {
         return this.var_163;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get dir() : int
      {
         return this.var_243;
      }
      
      public function set dir(param1:int) : void
      {
         if(!this.var_172)
         {
            this.var_243 = param1;
         }
      }
      
      public function set name(param1:String) : void
      {
         if(!this.var_172)
         {
            this._name = param1;
         }
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get userType() : int
      {
         return this.var_1900;
      }
      
      public function set groupStatus(param1:int) : void
      {
         if(!this.var_172)
         {
            this.var_1901 = param1;
         }
      }
      
      public function get subType() : String
      {
         return this.var_1898;
      }
      
      public function set groupID(param1:String) : void
      {
         if(!this.var_172)
         {
            this.var_1896 = param1;
         }
      }
      
      public function set subType(param1:String) : void
      {
         if(!this.var_172)
         {
            this.var_1898 = param1;
         }
      }
      
      public function set xp(param1:int) : void
      {
         if(!this.var_172)
         {
            this.var_1895 = param1;
         }
      }
      
      public function set figure(param1:String) : void
      {
         if(!this.var_172)
         {
            this.var_597 = param1;
         }
      }
      
      public function set userType(param1:int) : void
      {
         if(!this.var_172)
         {
            this.var_1900 = param1;
         }
      }
      
      public function set sex(param1:String) : void
      {
         if(!this.var_172)
         {
            this.var_789 = param1;
         }
      }
      
      public function get groupStatus() : int
      {
         return this.var_1901;
      }
      
      public function get groupID() : String
      {
         return this.var_1896;
      }
      
      public function set webID(param1:int) : void
      {
         if(!this.var_172)
         {
            this.var_1899 = param1;
         }
      }
      
      public function set custom(param1:String) : void
      {
         if(!this.var_172)
         {
            this.var_1897 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         this.var_172 = true;
      }
      
      public function get sex() : String
      {
         return this.var_789;
      }
      
      public function get figure() : String
      {
         return this.var_597;
      }
      
      public function get webID() : int
      {
         return this.var_1899;
      }
      
      public function get custom() : String
      {
         return this.var_1897;
      }
      
      public function set y(param1:Number) : void
      {
         if(!this.var_172)
         {
            this.var_162 = param1;
         }
      }
      
      public function set z(param1:Number) : void
      {
         if(!this.var_172)
         {
            this.var_163 = param1;
         }
      }
      
      public function set x(param1:Number) : void
      {
         if(!this.var_172)
         {
            this._x = param1;
         }
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function get y() : Number
      {
         return this.var_162;
      }
      
      public function get xp() : int
      {
         return this.var_1895;
      }
   }
}
