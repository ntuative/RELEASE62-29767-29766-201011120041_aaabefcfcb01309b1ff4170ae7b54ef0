package com.sulake.habbo.communication.messages.parser.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendCategoryData;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendData;
   
   public class MessengerInitMessageParser implements IMessageParser
   {
       
      
      private var var_2192:int;
      
      private var var_2191:int;
      
      private var var_90:Array;
      
      private var var_184:Array;
      
      private var var_2190:int;
      
      private var var_2188:int;
      
      private var var_2187:int;
      
      private var var_2189:int;
      
      public function MessengerInitMessageParser()
      {
         super();
      }
      
      public function flush() : Boolean
      {
         this.var_90 = new Array();
         this.var_184 = new Array();
         return true;
      }
      
      public function get extendedFriendLimit() : int
      {
         return this.var_2192;
      }
      
      public function get friends() : Array
      {
         return this.var_184;
      }
      
      public function get normalFriendLimit() : int
      {
         return this.var_2190;
      }
      
      public function get categories() : Array
      {
         return this.var_90;
      }
      
      public function get friendRequestLimit() : int
      {
         return this.var_2191;
      }
      
      public function get userFriendLimit() : int
      {
         return this.var_2189;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         var _loc4_:int = 0;
         this.var_2189 = param1.readInteger();
         this.var_2190 = param1.readInteger();
         this.var_2192 = param1.readInteger();
         this.var_2187 = param1.readInteger();
         var _loc2_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc2_)
         {
            this.var_90.push(new FriendCategoryData(param1));
            _loc4_++;
         }
         var _loc3_:int = param1.readInteger();
         _loc4_ = 0;
         while(_loc4_ < _loc3_)
         {
            this.var_184.push(new FriendData(param1));
            _loc4_++;
         }
         this.var_2191 = param1.readInteger();
         this.var_2188 = param1.readInteger();
         return true;
      }
      
      public function get evenMoreExtendedFriendLimit() : int
      {
         return this.var_2187;
      }
      
      public function get friendRequestCount() : int
      {
         return this.var_2188;
      }
   }
}
