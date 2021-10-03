package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionVoteEvent extends RoomSessionEvent
   {
      
      public static const const_115:String = "RSPE_VOTE_RESULT";
      
      public static const const_127:String = "RSPE_VOTE_QUESTION";
       
      
      private var var_1540:int = 0;
      
      private var var_955:String = "";
      
      private var var_1118:Array;
      
      private var var_1207:Array;
      
      public function RoomSessionVoteEvent(param1:String, param2:IRoomSession, param3:String, param4:Array, param5:Array = null, param6:int = 0, param7:Boolean = false, param8:Boolean = false)
      {
         this.var_1207 = [];
         this.var_1118 = [];
         super(param1,param2,param7,param8);
         this.var_955 = param3;
         this.var_1207 = param4;
         this.var_1118 = param5;
         if(this.var_1118 == null)
         {
            this.var_1118 = [];
         }
         this.var_1540 = param6;
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
