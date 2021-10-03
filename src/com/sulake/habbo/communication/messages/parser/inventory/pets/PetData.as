package com.sulake.habbo.communication.messages.parser.inventory.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class PetData
   {
       
      
      private var var_597:String;
      
      private var _name:String;
      
      private var _type:int;
      
      private var _id:int;
      
      public function PetData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_597 = param1.readString();
         this._type = param1.readInteger();
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get figure() : String
      {
         return this.var_597;
      }
      
      public function get name() : String
      {
         return this._name;
      }
   }
}
