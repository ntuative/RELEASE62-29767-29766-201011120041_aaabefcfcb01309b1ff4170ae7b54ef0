package com.sulake.habbo.moderation
{
   public class BanDefinition
   {
       
      
      private var var_2051:int;
      
      private var _name:String;
      
      public function BanDefinition(param1:String, param2:int)
      {
         super();
         this._name = param1;
         this.var_2051 = param2;
      }
      
      public function get banLengthHours() : int
      {
         return this.var_2051;
      }
      
      public function get name() : String
      {
         return this._name;
      }
   }
}
