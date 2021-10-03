package com.sulake.core.window.utils
{
   import com.sulake.core.runtime.IDisposable;
   
   public interface INotify extends IDisposable
   {
       
      
      function set title(param1:String) : void;
      
      function get callback() : Function;
      
      function get summary() : String;
      
      function get title() : String;
      
      function set callback(param1:Function) : void;
      
      function set summary(param1:String) : void;
   }
}
