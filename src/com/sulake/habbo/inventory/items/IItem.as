package com.sulake.habbo.inventory.items
{
   public interface IItem
   {
       
      
      function get recyclable() : Boolean;
      
      function get tradeable() : Boolean;
      
      function get locked() : Boolean;
      
      function get sellable() : Boolean;
      
      function get category() : int;
      
      function get extra() : Number;
      
      function get ref() : int;
      
      function set locked(param1:Boolean) : void;
      
      function get groupable() : Boolean;
      
      function get type() : int;
      
      function get id() : int;
      
      function get stuffData() : String;
   }
}
