package com.sulake.habbo.communication.messages.parser.room.pets
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class PetInfoMessageParser implements IMessageParser
   {
       
      
      private var var_2225:int;
      
      private var var_597:String;
      
      private var var_1865:int;
      
      private var var_2041:int;
      
      private var var_2197:int;
      
      private var var_2293:int;
      
      private var _nutrition:int;
      
      private var var_1467:int;
      
      private var var_2292:int;
      
      private var var_2291:int;
      
      private var _energy:int;
      
      private var _name:String;
      
      private var _ownerName:String;
      
      private var var_1921:int;
      
      private var var_2294:int;
      
      public function PetInfoMessageParser()
      {
         super();
      }
      
      public function get level() : int
      {
         return this.var_1865;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get maxEnergy() : int
      {
         return this.var_2293;
      }
      
      public function flush() : Boolean
      {
         this.var_1467 = -1;
         return true;
      }
      
      public function get maxLevel() : int
      {
         return this.var_2292;
      }
      
      public function get experienceRequiredToLevel() : int
      {
         return this.var_2291;
      }
      
      public function get maxNutrition() : int
      {
         return this.var_2294;
      }
      
      public function get figure() : String
      {
         return this.var_597;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get respect() : int
      {
         return this.var_2041;
      }
      
      public function get petId() : int
      {
         return this.var_1467;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_1467 = param1.readInteger();
         this._name = param1.readString();
         this.var_1865 = param1.readInteger();
         this.var_2292 = param1.readInteger();
         this.var_2197 = param1.readInteger();
         this.var_2291 = param1.readInteger();
         this._energy = param1.readInteger();
         this.var_2293 = param1.readInteger();
         this._nutrition = param1.readInteger();
         this.var_2294 = param1.readInteger();
         this.var_597 = param1.readString();
         this.var_2041 = param1.readInteger();
         this.var_1921 = param1.readInteger();
         this.var_2225 = param1.readInteger();
         this._ownerName = param1.readString();
         return true;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get experience() : int
      {
         return this.var_2197;
      }
      
      public function get ownerId() : int
      {
         return this.var_1921;
      }
      
      public function get age() : int
      {
         return this.var_2225;
      }
   }
}
