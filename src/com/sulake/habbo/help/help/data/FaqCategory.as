package com.sulake.habbo.help.help.data
{
   import com.sulake.core.utils.Map;
   
   public class FaqCategory
   {
       
      
      private var var_1902:int = 0;
      
      private var var_134:Map;
      
      private var var_1297:int;
      
      private var var_1444:Date;
      
      private var var_1960:String;
      
      private var var_1443:String;
      
      public function FaqCategory(param1:int, param2:String)
      {
         super();
         this.var_134 = new Map();
         this.var_1297 = param1;
         this.var_1960 = param2;
      }
      
      public function get categoryId() : int
      {
         return this.var_1297;
      }
      
      public function get categoryTitle() : String
      {
         return this.var_1960;
      }
      
      public function get description() : String
      {
         return this.var_1443;
      }
      
      public function getAgeSeconds() : Number
      {
         if(this.var_1444 == null)
         {
            return new Date().valueOf();
         }
         return (new Date().valueOf() - this.var_1444.valueOf()) / 1000;
      }
      
      public function hasContent() : Boolean
      {
         return this.var_134.length > 0 || this.hasUpdatedWithinHour();
      }
      
      public function hasItem(param1:int) : Boolean
      {
         return this.var_134.getValue(param1) != null;
      }
      
      public function reset() : void
      {
         if(this.var_134 != null)
         {
            this.var_134.reset();
         }
      }
      
      public function getItem(param1:int) : FaqItem
      {
         return this.var_134.getValue(param1);
      }
      
      public function storeItem(param1:int, param2:String, param3:String = null) : void
      {
         var _loc4_:FaqItem = this.getItem(param1);
         if(_loc4_ == null)
         {
            _loc4_ = new FaqItem(param1,param2,this.var_134.length,this);
            this.var_134.add(param1,_loc4_);
         }
      }
      
      public function getItemIdByIndex(param1:int) : int
      {
         var _loc2_:FaqItem = this.getItemByIndex(param1);
         if(_loc2_ == null)
         {
            return -1;
         }
         return _loc2_.questionId;
      }
      
      public function getQuestionTitleArray() : Array
      {
         var _loc2_:* = null;
         var _loc1_:Array = new Array();
         var _loc3_:int = 0;
         while(_loc3_ < this.var_134.length)
         {
            _loc2_ = this.var_134.getWithIndex(_loc3_);
            _loc1_.push(_loc2_.questionText);
            _loc3_++;
         }
         return _loc1_;
      }
      
      public function dispose() : void
      {
         if(this.var_134 != null)
         {
            this.var_134.dispose();
            this.var_134 = null;
         }
      }
      
      public function getItemIndex(param1:int) : int
      {
         var _loc2_:FaqItem = this.getItem(param1);
         if(_loc2_ == null)
         {
            return -1;
         }
         return _loc2_.index;
      }
      
      private function hasUpdatedWithinHour() : Boolean
      {
         return this.getAgeSeconds() < 3600;
      }
      
      public function getItemByIndex(param1:int) : FaqItem
      {
         if(param1 >= this.var_134.length)
         {
            return null;
         }
         return this.var_134.getWithIndex(param1);
      }
      
      public function setTimeStamp() : void
      {
         this.var_1444 = new Date();
      }
      
      public function set itemCount(param1:int) : void
      {
         this.var_1902 = param1;
      }
      
      public function storeItemAnswer(param1:int, param2:String) : void
      {
         var _loc3_:FaqItem = this.getItem(param1);
         if(_loc3_ != null)
         {
            _loc3_.answerText = param2;
         }
      }
      
      public function get itemCount() : int
      {
         if(this.var_134.length == 0)
         {
            return this.var_1902;
         }
         return this.var_134.length;
      }
      
      public function set description(param1:String) : void
      {
         this.var_1443 = param1;
      }
   }
}
