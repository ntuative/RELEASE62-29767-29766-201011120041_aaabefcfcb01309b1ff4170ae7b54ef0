package com.sulake.core.localization
{
   public class LocalizationDefinition implements ILocalizationDefinition
   {
       
      
      private var _name:String;
      
      private var var_1789:String;
      
      private var var_906:String;
      
      private var var_1790:String;
      
      private var var_1791:String;
      
      public function LocalizationDefinition(param1:String, param2:String, param3:String)
      {
         super();
         var _loc4_:Array = param1.split("_");
         this.var_1791 = _loc4_[0];
         var _loc5_:Array = String(_loc4_[1]).split(".");
         this.var_1789 = _loc5_[0];
         this.var_1790 = _loc5_[1];
         this._name = param2;
         this.var_906 = param3;
      }
      
      public function get countryCode() : String
      {
         return this.var_1789;
      }
      
      public function get languageCode() : String
      {
         return this.var_1791;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get url() : String
      {
         return this.var_906;
      }
      
      public function get encoding() : String
      {
         return this.var_1790;
      }
      
      public function get id() : String
      {
         return this.var_1791 + "_" + this.var_1789 + "." + this.var_1790;
      }
   }
}
