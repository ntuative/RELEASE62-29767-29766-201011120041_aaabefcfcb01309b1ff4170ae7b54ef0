package com.sulake.habbo.session
{
   public class PetInfo implements IPetInfo
   {
       
      
      private var var_1865:int;
      
      private var var_2041:int;
      
      private var var_2197:int;
      
      private var var_2227:int;
      
      private var _nutrition:int;
      
      private var var_1467:int;
      
      private var var_2229:int;
      
      private var var_2226:int;
      
      private var _energy:int;
      
      private var var_2225:int;
      
      private var var_2228:int;
      
      private var _ownerName:String;
      
      private var var_1921:int;
      
      public function PetInfo()
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
      
      public function set respect(param1:int) : void
      {
         this.var_2041 = param1;
      }
      
      public function set energy(param1:int) : void
      {
         this._energy = param1;
      }
      
      public function set level(param1:int) : void
      {
         this.var_1865 = param1;
      }
      
      public function get petId() : int
      {
         return this.var_1467;
      }
      
      public function get experienceMax() : int
      {
         return this.var_2226;
      }
      
      public function get nutritionMax() : int
      {
         return this.var_2227;
      }
      
      public function set levelMax(param1:int) : void
      {
         this.var_2229 = param1;
      }
      
      public function get ownerId() : int
      {
         return this.var_1921;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function set petId(param1:int) : void
      {
         this.var_1467 = param1;
      }
      
      public function set nutrition(param1:int) : void
      {
         this._nutrition = param1;
      }
      
      public function get energyMax() : int
      {
         return this.var_2228;
      }
      
      public function get respect() : int
      {
         return this.var_2041;
      }
      
      public function get levelMax() : int
      {
         return this.var_2229;
      }
      
      public function set ownerName(param1:String) : void
      {
         this._ownerName = param1;
      }
      
      public function set experienceMax(param1:int) : void
      {
         this.var_2226 = param1;
      }
      
      public function set experience(param1:int) : void
      {
         this.var_2197 = param1;
      }
      
      public function set nutritionMax(param1:int) : void
      {
         this.var_2227 = param1;
      }
      
      public function set ownerId(param1:int) : void
      {
         this.var_1921 = param1;
      }
      
      public function get experience() : int
      {
         return this.var_2197;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function set energyMax(param1:int) : void
      {
         this.var_2228 = param1;
      }
      
      public function set age(param1:int) : void
      {
         this.var_2225 = param1;
      }
      
      public function get age() : int
      {
         return this.var_2225;
      }
   }
}
