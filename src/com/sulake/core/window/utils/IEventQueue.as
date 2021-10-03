package com.sulake.core.window.utils
{
   import flash.events.Event;
   
   public interface IEventQueue
   {
       
      
      function next() : Event;
      
      function remove() : void;
      
      function get length() : uint;
      
      function begin() : void;
      
      function end() : void;
      
      function flush() : void;
   }
}
