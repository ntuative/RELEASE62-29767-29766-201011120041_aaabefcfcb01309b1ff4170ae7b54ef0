package com.sulake.habbo.widget.messages
{
   public class RoomWidgetUserActionMessage extends RoomWidgetMessage
   {
      
      public static const const_782:String = "RWUAM_RESPECT_USER";
      
      public static const const_684:String = "RWUAM_GIVE_RIGHTS";
      
      public static const const_577:String = "RWUAM_START_TRADING";
      
      public static const const_736:String = "RWUAM_TAKE_RIGHTS";
      
      public static const const_686:String = "RWUAM_WHISPER_USER";
      
      public static const const_597:String = "RWUAM_IGNORE_USER";
      
      public static const const_425:String = "RWUAM_REQUEST_PET_UPDATE";
      
      public static const const_635:String = "RWUAM_BAN_USER";
      
      public static const const_598:String = "RWUAM_UNIGNORE_USER";
      
      public static const const_480:String = "RWUAM_KICK_USER";
      
      public static const const_579:String = "RWUAM_SEND_FRIEND_REQUEST";
      
      public static const const_630:String = " RWUAM_RESPECT_PET";
      
      public static const const_481:String = "RWUAM_KICK_BOT";
      
      public static const const_1378:String = "RWUAM_TRAIN_PET";
      
      public static const const_688:String = "RWUAM_PICKUP_PET";
      
      public static const const_717:String = "RWUAM_OPEN_HOME_PAGE";
      
      public static const const_774:String = "RWUAM_REPORT";
       
      
      private var _userId:int = 0;
      
      public function RoomWidgetUserActionMessage(param1:String, param2:int = 0)
      {
         super(param1);
         this._userId = param2;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
   }
}
