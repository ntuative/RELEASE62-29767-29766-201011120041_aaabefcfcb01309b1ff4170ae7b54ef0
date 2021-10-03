package com.sulake.habbo.help.help.data
{
   public class FaqItem
   {
       
      
      private var var_1601:int;
      
      private var var_1600:String;
      
      private var var_1947:String;
      
      private var _index:int;
      
      private var var_1948:Boolean = false;
      
      private var _category:FaqCategory;
      
      public function FaqItem(param1:int, param2:String, param3:int, param4:FaqCategory)
      {
         super();
         this.var_1601 = param1;
         this.var_1947 = param2;
         this._index = param3;
         this._category = param4;
      }
      
      public function get answerText() : String
      {
         return this.var_1600;
      }
      
      public function get questionId() : int
      {
         return this.var_1601;
      }
      
      public function get questionText() : String
      {
         return this.var_1947;
      }
      
      public function set answerText(param1:String) : void
      {
         this.var_1600 = param1;
         this.var_1948 = true;
      }
      
      public function get hasAnswer() : Boolean
      {
         return this.var_1948;
      }
      
      public function get category() : FaqCategory
      {
         return this._category;
      }
      
      public function get index() : int
      {
         return this._index;
      }
   }
}
