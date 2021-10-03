package com.sulake.habbo.window.tools
{
   import com.sulake.core.runtime.IDisposable;
   
   public interface IDevTool extends IDisposable
   {
       
      
      function get visible() : Boolean;
      
      function set visible(param1:Boolean) : void;
      
      function get caption() : String;
   }
}
