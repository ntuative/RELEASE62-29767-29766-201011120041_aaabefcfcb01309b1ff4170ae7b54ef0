package com.sulake.habbo.window.utils
{
   public interface ICaption
   {
       
      
      function get visible() : Boolean;
      
      function get toolTip() : String;
      
      function set visible(param1:Boolean) : void;
      
      function set toolTip(param1:String) : void;
      
      function set text(param1:String) : void;
      
      function get text() : String;
   }
}
