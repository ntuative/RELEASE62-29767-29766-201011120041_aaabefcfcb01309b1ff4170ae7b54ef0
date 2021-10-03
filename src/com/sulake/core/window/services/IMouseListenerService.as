package com.sulake.core.window.services
{
   import com.sulake.core.window.IWindow;
   
   public interface IMouseListenerService
   {
       
      
      function get eventTypes() : Array;
      
      function begin(param1:IWindow, param2:uint = 0) : IWindow;
      
      function end(param1:IWindow) : IWindow;
      
      function set areaLimit(param1:uint) : void;
      
      function get areaLimit() : uint;
      
      function dispose() : void;
   }
}
