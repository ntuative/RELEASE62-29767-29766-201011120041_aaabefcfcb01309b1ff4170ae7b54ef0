package com.sulake.habbo.session.events
{
   import com.sulake.habbo.session.IRoomSession;
   
   public class RoomSessionUserFigureUpdateEvent extends RoomSessionEvent
   {
      
      public static const const_151:String = "RSUBE_FIGURE";
       
      
      private var var_898:String = "";
      
      private var var_597:String = "";
      
      private var _userId:int = 0;
      
      private var var_1503:String = "";
      
      public function RoomSessionUserFigureUpdateEvent(param1:IRoomSession, param2:int, param3:String, param4:String, param5:String, param6:Boolean = false, param7:Boolean = false)
      {
         super(const_151,param1,param6,param7);
         this._userId = param2;
         this.var_597 = param3;
         this.var_898 = param4;
         this.var_1503 = param5;
      }
      
      public function get gender() : String
      {
         return this.var_898;
      }
      
      public function get figure() : String
      {
         return this.var_597;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get customInfo() : String
      {
         return this.var_1503;
      }
   }
}
