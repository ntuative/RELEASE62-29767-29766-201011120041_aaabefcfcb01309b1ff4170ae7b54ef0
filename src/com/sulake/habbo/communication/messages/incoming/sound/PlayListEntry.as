package com.sulake.habbo.communication.messages.incoming.sound
{
   public class PlayListEntry
   {
       
      
      private var var_1912:int;
      
      private var var_1914:int = 0;
      
      private var var_1911:String;
      
      private var var_1913:int;
      
      private var var_1915:String;
      
      public function PlayListEntry(param1:int, param2:int, param3:String, param4:String)
      {
         super();
         this.var_1912 = param1;
         this.var_1913 = param2;
         this.var_1915 = param3;
         this.var_1911 = param4;
      }
      
      public function get length() : int
      {
         return this.var_1913;
      }
      
      public function get name() : String
      {
         return this.var_1915;
      }
      
      public function get creator() : String
      {
         return this.var_1911;
      }
      
      public function get startPlayHeadPos() : int
      {
         return this.var_1914;
      }
      
      public function get id() : int
      {
         return this.var_1912;
      }
      
      public function set startPlayHeadPos(param1:int) : void
      {
         this.var_1914 = param1;
      }
   }
}
