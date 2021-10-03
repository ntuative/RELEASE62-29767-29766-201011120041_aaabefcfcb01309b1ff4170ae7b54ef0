package com.sulake.habbo.avatar.pets
{
   public class Breed extends PetEditorInfo implements IBreed
   {
       
      
      private var var_2352:String = "";
      
      private var _id:int;
      
      private var var_2351:int;
      
      private var var_2208:Boolean = true;
      
      private var var_898:String;
      
      private var var_2353:String;
      
      private var var_1219:Boolean;
      
      public function Breed(param1:XML)
      {
         super(param1);
         this._id = parseInt(param1.@id);
         this.var_2351 = parseInt(param1.@pattern);
         this.var_898 = String(param1.@gender);
         this.var_1219 = Boolean(parseInt(param1.@colorable));
         this.var_2352 = String(param1.@localizationKey);
         if(param1.@sellable && param1.@sellable == "0")
         {
            this.var_2208 = false;
         }
      }
      
      public function get gender() : String
      {
         return this.var_898;
      }
      
      public function get localizationKey() : String
      {
         return this.var_2352;
      }
      
      public function get avatarFigureString() : String
      {
         return this.var_2353;
      }
      
      public function get patternId() : int
      {
         return this.var_2351;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function set avatarFigureString(param1:String) : void
      {
         this.var_2353 = param1;
      }
      
      public function get isColorable() : Boolean
      {
         return this.var_1219;
      }
      
      public function get isSellable() : Boolean
      {
         return this.var_2208;
      }
   }
}
