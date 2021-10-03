package com.sulake.habbo.communication.messages.parser.roomsettings
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class RoomSettingsSaveErrorMessageParser implements IMessageParser
   {
      
      public static const const_1529:int = 9;
      
      public static const const_1619:int = 4;
      
      public static const const_1633:int = 1;
      
      public static const const_1346:int = 10;
      
      public static const const_1562:int = 2;
      
      public static const const_1371:int = 7;
      
      public static const const_1265:int = 11;
      
      public static const const_1725:int = 3;
      
      public static const const_1357:int = 8;
      
      public static const const_1434:int = 5;
      
      public static const const_1726:int = 6;
      
      public static const const_1445:int = 12;
       
      
      private var var_2038:String;
      
      private var _roomId:int;
      
      private var var_1513:int;
      
      public function RoomSettingsSaveErrorMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get info() : String
      {
         return this.var_2038;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._roomId = param1.readInteger();
         this.var_1513 = param1.readInteger();
         this.var_2038 = param1.readString();
         return true;
      }
      
      public function get errorCode() : int
      {
         return this.var_1513;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
   }
}
