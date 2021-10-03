package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class PublicRoomObjectMessageData
   {
       
      
      private var var_512:int = 0;
      
      private var var_163:Number = 0;
      
      private var var_162:Number = 0;
      
      private var var_172:Boolean = false;
      
      private var var_243:int = 0;
      
      private var _type:String = "";
      
      private var _name:String = "";
      
      private var _x:Number = 0;
      
      private var var_414:int = 0;
      
      public function PublicRoomObjectMessageData()
      {
         super();
      }
      
      public function set z(param1:Number) : void
      {
         if(!this.var_172)
         {
            this.var_163 = param1;
         }
      }
      
      public function get sizeY() : int
      {
         return this.var_512;
      }
      
      public function get y() : Number
      {
         return this.var_162;
      }
      
      public function get dir() : int
      {
         return this.var_243;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         if(!this.var_172)
         {
            this._name = param1;
         }
      }
      
      public function set dir(param1:int) : void
      {
         if(!this.var_172)
         {
            this.var_243 = param1;
         }
      }
      
      public function set y(param1:Number) : void
      {
         if(!this.var_172)
         {
            this.var_162 = param1;
         }
      }
      
      public function setReadOnly() : void
      {
         this.var_172 = true;
      }
      
      public function get z() : Number
      {
         return this.var_163;
      }
      
      public function set sizeY(param1:int) : void
      {
         if(!this.var_172)
         {
            this.var_512 = param1;
         }
      }
      
      public function set sizeX(param1:int) : void
      {
         if(!this.var_172)
         {
            this.var_414 = param1;
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
      
      public function get type() : String
      {
         return this._type;
      }
      
      public function set type(param1:String) : void
      {
         if(!this.var_172)
         {
            this._type = param1;
         }
      }
      
      public function get sizeX() : int
      {
         return this.var_414;
      }
   }
}
