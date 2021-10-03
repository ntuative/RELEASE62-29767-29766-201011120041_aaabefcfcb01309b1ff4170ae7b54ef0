package com.sulake.habbo.communication.messages.incoming.navigator
{
   public class RoomSettingsFlatInfo
   {
      
      public static const const_493:int = 0;
      
      public static const const_101:int = 2;
      
      public static const const_171:int = 1;
      
      public static const const_708:Array = ["open","closed","password"];
       
      
      private var _id:int;
      
      private var var_2076:Boolean;
      
      private var _password:String;
      
      private var var_2054:int;
      
      private var _type:String;
      
      private var _ownerName:String;
      
      private var var_2079:Boolean;
      
      private var var_2077:Boolean;
      
      private var _name:String;
      
      private var var_2078:Boolean;
      
      private var var_1443:String;
      
      public function RoomSettingsFlatInfo()
      {
         super();
      }
      
      public function set ownerName(param1:String) : void
      {
         this._ownerName = param1;
      }
      
      public function set password(param1:String) : void
      {
         this._password = param1;
      }
      
      public function set allowFurniMoving(param1:Boolean) : void
      {
         this.var_2076 = param1;
      }
      
      public function get categoryAlertKey() : Boolean
      {
         return this.var_2077;
      }
      
      public function set type(param1:String) : void
      {
         this._type = param1;
      }
      
      public function set showOwnerName(param1:Boolean) : void
      {
         this.var_2079 = param1;
      }
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get allowTrading() : Boolean
      {
         return this.var_2078;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get showOwnerName() : Boolean
      {
         return this.var_2079;
      }
      
      public function get allowFurniMoving() : Boolean
      {
         return this.var_2076;
      }
      
      public function set categoryAlertKey(param1:Boolean) : void
      {
         this.var_2077 = param1;
      }
      
      public function set doorMode(param1:int) : void
      {
         this.var_2054 = param1;
      }
      
      public function set allowTrading(param1:Boolean) : void
      {
         this.var_2078 = param1;
      }
      
      public function get doorMode() : int
      {
         return this.var_2054;
      }
      
      public function get password() : String
      {
         return this._password;
      }
      
      public function set id(param1:int) : void
      {
         this._id = param1;
      }
      
      public function set description(param1:String) : void
      {
         this.var_1443 = param1;
      }
      
      public function get description() : String
      {
         return this.var_1443;
      }
   }
}
