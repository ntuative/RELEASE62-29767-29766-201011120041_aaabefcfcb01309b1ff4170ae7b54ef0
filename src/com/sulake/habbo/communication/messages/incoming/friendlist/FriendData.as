package com.sulake.habbo.communication.messages.incoming.friendlist
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   
   public class FriendData
   {
       
      
      private var var_597:String;
      
      private var var_1414:String;
      
      private var var_1700:String;
      
      private var var_1297:int;
      
      private var var_898:int;
      
      private var var_1412:String;
      
      private var _name:String;
      
      private var var_1701:Boolean;
      
      private var var_610:Boolean;
      
      private var _id:int;
      
      public function FriendData(param1:IMessageDataWrapper)
      {
         super();
         this._id = param1.readInteger();
         this._name = param1.readString();
         this.var_898 = param1.readInteger();
         this.var_610 = param1.readBoolean();
         this.var_1701 = param1.readBoolean();
         this.var_597 = param1.readString();
         this.var_1297 = param1.readInteger();
         this.var_1700 = param1.readString();
         this.var_1414 = param1.readString();
         this.var_1412 = param1.readString();
      }
      
      public function get gender() : int
      {
         return this.var_898;
      }
      
      public function get realName() : String
      {
         return this.var_1412;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get motto() : String
      {
         return this.var_1700;
      }
      
      public function get categoryId() : int
      {
         return this.var_1297;
      }
      
      public function get online() : Boolean
      {
         return this.var_610;
      }
      
      public function get followingAllowed() : Boolean
      {
         return this.var_1701;
      }
      
      public function get lastAccess() : String
      {
         return this.var_1414;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function get figure() : String
      {
         return this.var_597;
      }
   }
}
