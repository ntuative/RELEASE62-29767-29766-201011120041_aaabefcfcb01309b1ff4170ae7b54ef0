package com.sulake.habbo.communication.messages.outgoing.roomsettings
{
   public class SaveableRoomSettingsData
   {
       
      
      private var var_2060:Boolean;
      
      private var var_2052:Boolean;
      
      private var var_2053:Array;
      
      private var var_2057:Boolean;
      
      private var var_1443:String;
      
      private var var_2058:int;
      
      private var var_2056:Boolean;
      
      private var var_2054:int;
      
      private var var_1297:int;
      
      private var _roomId:int;
      
      private var _name:String;
      
      private var _password:String;
      
      private var var_734:Array;
      
      public function SaveableRoomSettingsData()
      {
         super();
      }
      
      public function set allowFoodConsume(param1:Boolean) : void
      {
         this.var_2052 = param1;
      }
      
      public function get maximumVisitors() : int
      {
         return this.var_2058;
      }
      
      public function set maximumVisitors(param1:int) : void
      {
         this.var_2058 = param1;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set hideWalls(param1:Boolean) : void
      {
         this.var_2056 = param1;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function get tags() : Array
      {
         return this.var_734;
      }
      
      public function get password() : String
      {
         return this._password;
      }
      
      public function get allowPets() : Boolean
      {
         return this.var_2057;
      }
      
      public function set roomId(param1:int) : void
      {
         this._roomId = param1;
      }
      
      public function set controllers(param1:Array) : void
      {
         this.var_2053 = param1;
      }
      
      public function set tags(param1:Array) : void
      {
         this.var_734 = param1;
      }
      
      public function get allowWalkThrough() : Boolean
      {
         return this.var_2060;
      }
      
      public function get allowFoodConsume() : Boolean
      {
         return this.var_2052;
      }
      
      public function set password(param1:String) : void
      {
         this._password = param1;
      }
      
      public function get categoryId() : int
      {
         return this.var_1297;
      }
      
      public function set allowPets(param1:Boolean) : void
      {
         this.var_2057 = param1;
      }
      
      public function get hideWalls() : Boolean
      {
         return this.var_2056;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get controllers() : Array
      {
         return this.var_2053;
      }
      
      public function set doorMode(param1:int) : void
      {
         this.var_2054 = param1;
      }
      
      public function set allowWalkThrough(param1:Boolean) : void
      {
         this.var_2060 = param1;
      }
      
      public function get doorMode() : int
      {
         return this.var_2054;
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1297 = param1;
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
