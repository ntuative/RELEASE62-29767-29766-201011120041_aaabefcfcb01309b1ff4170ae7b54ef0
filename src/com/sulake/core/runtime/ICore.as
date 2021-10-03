package com.sulake.core.runtime
{
   import flash.events.IEventDispatcher;
   
   public interface ICore extends IContext
   {
       
      
      function initialize() : void;
      
      function readConfigDocument(param1:XML, param2:IEventDispatcher = null) : void;
      
      function getNumberOfFilesPending() : uint;
      
      function getLastDebugMessage() : String;
      
      function error(param1:String, param2:Boolean, param3:int = -1, param4:Error = null) : void;
      
      function getLastErrorMessage() : String;
      
      function warning(param1:String) : void;
      
      function getNumberOfFilesLoaded() : uint;
   }
}
