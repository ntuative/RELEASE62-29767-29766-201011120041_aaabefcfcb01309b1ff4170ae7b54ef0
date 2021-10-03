package com.sulake.core.assets
{
   public class AssetTypeDeclaration
   {
       
      
      private var var_2148:Class;
      
      private var var_2149:Class;
      
      private var var_2147:String;
      
      private var var_1549:Array;
      
      public function AssetTypeDeclaration(param1:String, param2:Class, param3:Class, ... rest)
      {
         super();
         this.var_2147 = param1;
         this.var_2149 = param2;
         this.var_2148 = param3;
         if(rest == null)
         {
            this.var_1549 = new Array();
         }
         else
         {
            this.var_1549 = rest;
         }
      }
      
      public function get loaderClass() : Class
      {
         return this.var_2148;
      }
      
      public function get assetClass() : Class
      {
         return this.var_2149;
      }
      
      public function get mimeType() : String
      {
         return this.var_2147;
      }
      
      public function get fileTypes() : Array
      {
         return this.var_1549;
      }
   }
}
