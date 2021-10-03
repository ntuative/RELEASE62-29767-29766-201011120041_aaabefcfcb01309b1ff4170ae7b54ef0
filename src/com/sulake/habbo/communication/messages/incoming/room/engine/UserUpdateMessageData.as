package com.sulake.habbo.communication.messages.incoming.room.engine
{
   public class UserUpdateMessageData
   {
       
      
      private var var_162:Number = 0;
      
      private var var_163:Number = 0;
      
      private var var_243:int = 0;
      
      private var var_1908:int = 0;
      
      private var var_1910:Number = 0;
      
      private var var_1907:Number = 0;
      
      private var var_1906:Number = 0;
      
      private var var_1905:Number = 0;
      
      private var var_1909:Boolean = false;
      
      private var _x:Number = 0;
      
      private var _id:int = 0;
      
      private var var_280:Array;
      
      public function UserUpdateMessageData(param1:int, param2:Number, param3:Number, param4:Number, param5:Number, param6:int, param7:int, param8:Number, param9:Number, param10:Number, param11:Boolean, param12:Array)
      {
         this.var_280 = [];
         super();
         this._id = param1;
         this._x = param2;
         this.var_162 = param3;
         this.var_163 = param4;
         this.var_1905 = param5;
         this.var_243 = param6;
         this.var_1908 = param7;
         this.var_1910 = param8;
         this.var_1907 = param9;
         this.var_1906 = param10;
         this.var_1909 = param11;
         this.var_280 = param12;
      }
      
      public function get y() : Number
      {
         return this.var_162;
      }
      
      public function get z() : Number
      {
         return this.var_163;
      }
      
      public function get dir() : int
      {
         return this.var_243;
      }
      
      public function get localZ() : Number
      {
         return this.var_1905;
      }
      
      public function get isMoving() : Boolean
      {
         return this.var_1909;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get dirHead() : int
      {
         return this.var_1908;
      }
      
      public function get targetX() : Number
      {
         return this.var_1910;
      }
      
      public function get targetY() : Number
      {
         return this.var_1907;
      }
      
      public function get targetZ() : Number
      {
         return this.var_1906;
      }
      
      public function get x() : Number
      {
         return this._x;
      }
      
      public function get actions() : Array
      {
         return this.var_280.slice();
      }
   }
}
