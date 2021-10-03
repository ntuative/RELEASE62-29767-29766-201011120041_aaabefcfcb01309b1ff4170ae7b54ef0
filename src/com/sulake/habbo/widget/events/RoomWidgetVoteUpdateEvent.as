package com.sulake.habbo.widget.events
{
   public class RoomWidgetVoteUpdateEvent extends RoomWidgetUpdateEvent
   {
      
      public static const const_115:String = "RWPUE_VOTE_RESULT";
      
      public static const const_127:String = "RWPUE_VOTE_QUESTION";
       
      
      private var var_1540:int;
      
      private var var_955:String;
      
      private var var_1118:Array;
      
      private var var_1207:Array;
      
      public function RoomWidgetVoteUpdateEvent(param1:String, param2:String, param3:Array, param4:Array = null, param5:int = 0, param6:Boolean = false, param7:Boolean = false)
      {
         super(param1,param6,param7);
         this.var_955 = param2;
         this.var_1207 = param3;
         this.var_1118 = param4;
         if(this.var_1118 == null)
         {
            this.var_1118 = [];
         }
         this.var_1540 = param5;
      }
      
      public function get votes() : Array
      {
         return this.var_1118.slice();
      }
      
      public function get totalVotes() : int
      {
         return this.var_1540;
      }
      
      public function get question() : String
      {
         return this.var_955;
      }
      
      public function get choices() : Array
      {
         return this.var_1207.slice();
      }
   }
}
