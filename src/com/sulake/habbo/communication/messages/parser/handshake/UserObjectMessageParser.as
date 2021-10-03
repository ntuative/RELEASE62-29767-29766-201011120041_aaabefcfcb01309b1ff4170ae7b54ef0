package com.sulake.habbo.communication.messages.parser.handshake
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.communication.messages.IMessageParser;
   
   public class UserObjectMessageParser implements IMessageParser
   {
       
      
      private var _id:int;
      
      private var var_597:String;
      
      private var var_2298:String;
      
      private var var_2299:int;
      
      private var var_2295:int;
      
      private var var_789:String;
      
      private var var_1412:String;
      
      private var _name:String;
      
      private var var_724:int;
      
      private var _respectLeft:int;
      
      private var var_2296:int;
      
      private var var_1980:int;
      
      private var var_2297:String;
      
      public function UserObjectMessageParser()
      {
         super();
      }
      
      public function get directMail() : int
      {
         return this.var_2295;
      }
      
      public function flush() : Boolean
      {
         return true;
      }
      
      public function get realName() : String
      {
         return this.var_1412;
      }
      
      public function get customData() : String
      {
         return this.var_2298;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get petRespectLeft() : int
      {
         return this.var_724;
      }
      
      public function get photoFilm() : int
      {
         return this.var_2299;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get poolFigure() : String
      {
         return this.var_2297;
      }
      
      public function get figure() : String
      {
         return this.var_597;
      }
      
      public function get respectTotal() : int
      {
         return this.var_1980;
      }
      
      public function get sex() : String
      {
         return this.var_789;
      }
      
      public function parse(param1:IMessageDataWrapper) : Boolean
      {
         this._id = int(param1.readString());
         this._name = param1.readString();
         this.var_597 = param1.readString();
         this.var_789 = param1.readString();
         this.var_2298 = param1.readString();
         this.var_1412 = param1.readString();
         this.var_2296 = param1.readInteger();
         this.var_2297 = param1.readString();
         this.var_2299 = param1.readInteger();
         this.var_2295 = param1.readInteger();
         this.var_1980 = param1.readInteger();
         this._respectLeft = param1.readInteger();
         this.var_724 = param1.readInteger();
         return true;
      }
      
      public function get tickets() : int
      {
         return this.var_2296;
      }
      
      public function get respectLeft() : int
      {
         return this._respectLeft;
      }
   }
}
