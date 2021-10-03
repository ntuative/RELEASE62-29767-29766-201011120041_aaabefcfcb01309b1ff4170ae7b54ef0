package com.sulake.habbo.communication.messages.incoming.room.engine
{
   import com.sulake.room.utils.Vector3d;
   
   public class SlideObjectMessageData
   {
      
      public static const const_1014:String = "mv";
      
      public static const const_993:String = "sld";
       
      
      private var var_74:Vector3d;
      
      private var var_1710:String;
      
      private var var_172:Boolean = false;
      
      private var _target:Vector3d;
      
      private var _id:int = 0;
      
      public function SlideObjectMessageData(param1:int, param2:Vector3d, param3:Vector3d, param4:String = null)
      {
         super();
         this._id = param1;
         this.var_74 = param2;
         this._target = param3;
         this.var_1710 = param4;
      }
      
      public function setReadOnly() : void
      {
         this.var_172 = true;
      }
      
      public function set moveType(param1:String) : void
      {
         if(!this.var_172)
         {
            this.var_1710 = param1;
         }
      }
      
      public function get loc() : Vector3d
      {
         return this.var_74;
      }
      
      public function set target(param1:Vector3d) : void
      {
         if(!this.var_172)
         {
            this._target = param1;
         }
      }
      
      public function set loc(param1:Vector3d) : void
      {
         if(!this.var_172)
         {
            this.var_74 = param1;
         }
      }
      
      public function get target() : Vector3d
      {
         return this._target;
      }
      
      public function get moveType() : String
      {
         return this.var_1710;
      }
      
      public function get id() : int
      {
         return this._id;
      }
   }
}
