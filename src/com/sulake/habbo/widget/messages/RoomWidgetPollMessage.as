package com.sulake.habbo.widget.messages
{
   public class RoomWidgetPollMessage extends RoomWidgetMessage
   {
      
      public static const const_716:String = "RWPM_START";
      
      public static const ANSWER:String = "RWPM_ANSWER";
      
      public static const const_491:String = "RWPM_REJECT";
       
      
      private var var_1601:int = 0;
      
      private var var_2445:Array = null;
      
      private var _id:int = -1;
      
      public function RoomWidgetPollMessage(param1:String, param2:int)
      {
         this._id = param2;
         super(param1);
      }
      
      public function get questionId() : int
      {
         return this.var_1601;
      }
      
      public function set questionId(param1:int) : void
      {
         this.var_1601 = param1;
      }
      
      public function set answers(param1:Array) : void
      {
         this.var_2445 = param1;
      }
      
      public function get answers() : Array
      {
         return this.var_2445;
      }
      
      public function get id() : int
      {
         return this._id;
      }
   }
}
