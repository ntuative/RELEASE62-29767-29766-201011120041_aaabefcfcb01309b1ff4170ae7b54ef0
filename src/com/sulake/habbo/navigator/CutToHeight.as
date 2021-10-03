package com.sulake.habbo.navigator
{
   import com.sulake.core.window.components.ITextWindow;
   
   public class CutToHeight implements BinarySearchTest
   {
       
      
      private var var_156:String;
      
      private var var_418:int;
      
      private var _text:ITextWindow;
      
      public function CutToHeight()
      {
         super();
      }
      
      public function beforeSearch(param1:String, param2:ITextWindow, param3:int) : void
      {
         this.var_156 = param1;
         this._text = param2;
         this.var_418 = param3;
      }
      
      public function test(param1:int) : Boolean
      {
         this._text.text = this.var_156.substring(0,param1) + "...";
         return this._text.textHeight > this.var_418;
      }
   }
}
