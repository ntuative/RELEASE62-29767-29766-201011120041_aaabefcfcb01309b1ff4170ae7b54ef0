package com.sulake.habbo.communication.messages.parser.room.action
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class CarryObjectMessageParser implements IMessageParser
   {
       
      
      private var _userId:int = 0;
      
      private var var_1208:int;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      private var var_1471:String;
      
      public function CarryObjectMessageParser()
      {
         super();
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this._userId = param1.readInteger();
         this.var_1208 = param1.readInteger();
         if(this.var_1208 > 0)
         {
            this.var_1471 = param1.readString();
         }
         return true;
      }
      
      public function flush() : Boolean
      {
         this._roomId = 0;
         this._roomCategory = 0;
         this._userId = 0;
         this.var_1208 = 0;
         this.var_1471 = "";
         return true;
      }
      
      public function get userId() : int
      {
         return this._userId;
      }
      
      public function get itemType() : int
      {
         return this.var_1208;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function get itemName() : String
      {
         return this.var_1471;
      }
   }
}
