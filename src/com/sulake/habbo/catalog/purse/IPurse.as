package com.sulake.habbo.catalog.purse
{
   public interface IPurse
   {
       
      
      function get credits() : int;
      
      function get pastVipDays() : int;
      
      function get pixels() : int;
      
      function set clubDays(param1:int) : void;
      
      function get clubDays() : int;
      
      function get isVIP() : Boolean;
      
      function set credits(param1:int) : void;
      
      function get hasClubLeft() : Boolean;
      
      function set clubPeriods(param1:int) : void;
      
      function set pixels(param1:int) : void;
      
      function get clubPeriods() : int;
      
      function get pastClubDays() : int;
   }
}
