package com.sulake.habbo.widget.events
{
   public class RoomWidgetPollUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_124:String = "RWPUW_CONTENT";
      
      public static const const_129:String = "RWPUW_OFFER";
      
      public static const const_67:String = "RWPUW_ERROR";
       
      
      private var var_1235:Array = null;
      
      private var var_1515:String = "";
      
      private var var_1760:String;
      
      private var var_1514:String = "";
      
      private var var_1234:int = 0;
      
      private var _id:int = -1;
      
      public function RoomWidgetPollUpdateEvent(param1:int, param2:String, param3:Boolean = false, param4:Boolean = false)
      {
         this._id = param1;
         super(param2,param3,param4);
      }
      
      public function get questionArray() : Array
      {
         return this.var_1235;
      }
      
      public function get startMessage() : String
      {
         return this.var_1515;
      }
      
      public function get summary() : String
      {
         return this.var_1760;
      }
      
      public function set startMessage(param1:String) : void
      {
         this.var_1515 = param1;
      }
      
      public function set numQuestions(param1:int) : void
      {
         this.var_1234 = param1;
      }
      
      public function set summary(param1:String) : void
      {
         this.var_1760 = param1;
      }
      
      public function get numQuestions() : int
      {
         return this.var_1234;
      }
      
      public function set endMessage(param1:String) : void
      {
         this.var_1514 = param1;
      }
      
      public function get endMessage() : String
      {
         return this.var_1514;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function set questionArray(param1:Array) : void
      {
         this.var_1235 = param1;
      }
   }
}
