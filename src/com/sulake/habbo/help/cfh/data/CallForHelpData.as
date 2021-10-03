package com.sulake.habbo.help.cfh.data
{
   public class CallForHelpData
   {
       
      
      private var var_2471:int;
      
      private var var_1754:String = "";
      
      private var var_1353:int;
      
      public function CallForHelpData()
      {
         super();
      }
      
      public function set reportedUserName(param1:String) : void
      {
         this.var_1754 = param1;
      }
      
      public function get topicIndex() : int
      {
         return this.var_2471;
      }
      
      public function set topicIndex(param1:int) : void
      {
         this.var_2471 = param1;
      }
      
      public function get reportedUserName() : String
      {
         return this.var_1754;
      }
      
      public function flush() : void
      {
         this.var_1353 = 0;
         this.var_1754 = "";
      }
      
      public function get userSelected() : Boolean
      {
         return this.var_1353 > 0;
      }
      
      public function set reportedUserId(param1:int) : void
      {
         this.var_1353 = param1;
      }
      
      public function getTopicKey(param1:int) : String
      {
         return (!!this.userSelected ? "help.cfh.topicwithharasser." : "help.cfh.topic.") + param1;
      }
      
      public function get reportedUserId() : int
      {
         return this.var_1353;
      }
   }
}
