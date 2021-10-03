package com.sulake.habbo.session
{
   public interface IUserData
   {
       
      
      function get type() : int;
      
      function set custom(param1:String) : void;
      
      function get figure() : String;
      
      function get sex() : String;
      
      function set figure(param1:String) : void;
      
      function get name() : String;
      
      function set sex(param1:String) : void;
      
      function get webID() : int;
      
      function get custom() : String;
      
      function set name(param1:String) : void;
      
      function get groupStatus() : int;
      
      function get groupID() : String;
      
      function get id() : int;
      
      function get xp() : int;
   }
}
