package com.sulake.habbo.communication.messages.parser.room.engine
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.room.engine.ItemMessageData;
   
   public class ItemAddMessageParser implements IMessageParser
   {
       
      
      private var var_207:ItemMessageData = null;
      
      private var _roomId:int = 0;
      
      private var _roomCategory:int = 0;
      
      public function ItemAddMessageParser()
      {
         super();
      }
      
      public function get data() : ItemMessageData
      {
         var _loc1_:ItemMessageData = this.var_207;
         if(_loc1_ != null)
         {
            _loc1_.setReadOnly();
         }
         return _loc1_;
      }
      
      public function flush() : Boolean
      {
         this.var_207 = null;
         this._roomId = 0;
         this._roomCategory = 0;
         return true;
      }
      
      public function get roomId() : int
      {
         return this._roomId;
      }
      
      public function get roomCategory() : int
      {
         return this._roomCategory;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         if(param1 == null)
         {
            return false;
         }
         this.var_207 = ItemDataParser.parseItemData(param1);
         return true;
      }
   }
}
