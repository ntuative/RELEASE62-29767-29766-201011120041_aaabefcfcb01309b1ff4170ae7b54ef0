package com.sulake.habbo.communication.messages.parser.poll
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class VoteResultMessageParser implements IMessageParser
   {
       
      
      private var var_1540:int;
      
      private var var_955:String;
      
      private var var_1118:Array;
      
      private var var_1207:Array;
      
      public function VoteResultMessageParser()
      {
         super();
      }
      
      public function get votes() : Array
      {
         return this.var_1118.slice();
      }
      
      public function flush() : Boolean
      {
         this.var_955 = "";
         this.var_1207 = [];
         this.var_1118 = [];
         this.var_1540 = 0;
         return true;
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
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this.var_955 = param1.readString();
         this.var_1207 = [];
         this.var_1118 = [];
         var _loc2_:int = param1.readInteger();
         var _loc3_:int = 0;
         while(_loc3_ < _loc2_)
         {
            param1.readInteger();
            this.var_1207.push(param1.readString());
            this.var_1118.push(param1.readInteger());
            _loc3_++;
         }
         this.var_1540 = param1.readInteger();
         return true;
      }
   }
}
