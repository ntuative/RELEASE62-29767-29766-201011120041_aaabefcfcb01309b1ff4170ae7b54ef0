package com.sulake.habbo.help.tutorial
{
   import com.sulake.core.window.IWindowContainer;
   
   public interface ITutorialUIView
   {
       
      
      function get id() : String;
      
      function get view() : IWindowContainer;
      
      function dispose() : void;
   }
}
