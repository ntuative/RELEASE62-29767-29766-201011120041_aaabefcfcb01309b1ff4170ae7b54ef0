package com.sulake.room.renderer.utils
{
   public class ObjectMouseData
   {
       
      
      private var var_2014:String = "";
      
      private var var_287:String = "";
      
      public function ObjectMouseData()
      {
         super();
      }
      
      public function set spriteTag(param1:String) : void
      {
         this.var_2014 = param1;
      }
      
      public function set objectId(param1:String) : void
      {
         this.var_287 = param1;
      }
      
      public function get spriteTag() : String
      {
         return this.var_2014;
      }
      
      public function get objectId() : String
      {
         return this.var_287;
      }
   }
}
