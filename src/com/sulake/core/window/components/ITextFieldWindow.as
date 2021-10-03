package com.sulake.core.window.components
{
   public interface ITextFieldWindow extends ITextWindow, IFocusWindow, IInteractiveWindow
   {
       
      
      function get selectionEndIndex() : int;
      
      function get selectionBeginIndex() : int;
      
      function set restrict(param1:String) : void;
      
      function setSelection(param1:int, param2:int) : void;
      
      function get restrict() : String;
   }
}
