package com.sulake.habbo.session
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.communication.messages.outgoing.room.pets.GetPetInfoMessageComposer;
   import com.sulake.habbo.communication.messages.outgoing.users.GetSelectedBadgesMessageComposer;
   
   public class UserDataManager implements IUserDataManager
   {
       
      
      private var _userIds:Map;
      
      private var var_848:Map;
      
      private var var_576:Map;
      
      private var _connection:IConnection;
      
      public function UserDataManager()
      {
         super();
         this.var_576 = new Map();
         this._userIds = new Map();
         this.var_848 = new Map();
      }
      
      public function removeUserDataByIndex(param1:int) : void
      {
         var _loc2_:int = this._userIds.getValue(param1);
         this.var_576.remove(_loc2_);
         this._userIds.remove(param1);
      }
      
      public function updateName(param1:int, param2:String) : void
      {
         var _loc3_:IUserData = this.getUserData(param1);
         if(_loc3_ != null)
         {
            _loc3_.name = param2;
         }
      }
      
      public function getUserData(param1:int) : IUserData
      {
         return this.var_576.getValue(param1);
      }
      
      public function getUserBadges(param1:int) : Array
      {
         if(this._connection != null)
         {
            this._connection.send(new GetSelectedBadgesMessageComposer(param1));
         }
         var _loc2_:* = this.var_848.getValue(param1) as Array;
         if(_loc2_ == null)
         {
            _loc2_ = [];
         }
         return _loc2_;
      }
      
      public function updateFigure(param1:int, param2:String, param3:String) : void
      {
         var _loc4_:int = this._userIds.getValue(param1);
         var _loc5_:IUserData = this.getUserData(_loc4_);
         if(_loc5_ != null)
         {
            _loc5_.figure = param2;
            _loc5_.sex = param3;
         }
      }
      
      public function updateCustom(param1:int, param2:String) : void
      {
         var _loc3_:int = this._userIds.getValue(param1);
         var _loc4_:IUserData = this.getUserData(_loc3_);
         if(_loc4_ != null)
         {
            _loc4_.custom = param2;
         }
      }
      
      public function setUserBadges(param1:int, param2:Array) : void
      {
         this.var_848.remove(param1);
         this.var_848.add(param1,param2);
      }
      
      public function setUserData(param1:IUserData) : void
      {
         this.var_576.remove(param1.webID);
         this._userIds.remove(param1.id);
         this.var_576.add(param1.webID,param1);
         this._userIds.add(param1.id,param1.webID);
      }
      
      public function dispose() : void
      {
         this._connection = null;
         this.var_576.dispose();
         this.var_576 = null;
         this._userIds.dispose();
         this.var_576 = null;
         this.var_848.dispose();
         this.var_848 = null;
      }
      
      public function requestPetInfo(param1:int) : void
      {
         var _loc2_:IUserData = this.getUserData(param1);
         if(_loc2_ != null && this._connection != null)
         {
            this._connection.send(new GetPetInfoMessageComposer(_loc2_.webID));
         }
      }
      
      public function getUserDataByIndex(param1:int) : IUserData
      {
         var _loc2_:int = this._userIds.getValue(param1);
         return this.getUserData(_loc2_);
      }
      
      public function set connection(param1:IConnection) : void
      {
         this._connection = param1;
      }
   }
}
