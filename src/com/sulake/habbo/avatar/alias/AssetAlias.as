package com.sulake.habbo.avatar.alias
{
   public class AssetAlias
   {
       
      
      private var var_1155:Boolean;
      
      private var _name:String;
      
      private var var_2265:String;
      
      private var var_1154:Boolean;
      
      public function AssetAlias(param1:XML)
      {
         super();
         this._name = String(param1.@name);
         this.var_2265 = String(param1.@link);
         this.var_1154 = Boolean(parseInt(param1.@fliph));
         this.var_1155 = Boolean(parseInt(param1.@flipv));
      }
      
      public function get flipH() : Boolean
      {
         return this.var_1154;
      }
      
      public function get flipV() : Boolean
      {
         return this.var_1155;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get link() : String
      {
         return this.var_2265;
      }
   }
}
