package com.sulake.habbo.friendlist.domain
{
   import com.sulake.core.runtime.IDisposable;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.communication.messages.incoming.friendlist.FriendData;
   import com.sulake.habbo.friendlist.IFriend;
   import flash.display.BitmapData;
   
   public class Friend implements IFriend, IDisposable
   {
      
      public static const const_1583:int = "F".charCodeAt(0);
      
      public static const const_1549:int = "M".charCodeAt(0);
       
      
      private var var_597:String;
      
      private var _disposed:Boolean;
      
      private var _view:IWindowContainer;
      
      private var var_1700:String;
      
      private var var_1412:String;
      
      private var var_1701:Boolean;
      
      private var var_1414:String;
      
      private var _id:int;
      
      private var var_1082:BitmapData;
      
      private var var_1297:int;
      
      private var var_898:int;
      
      private var _name:String;
      
      private var var_610:Boolean;
      
      private var var_178:Boolean;
      
      public function Friend(param1:FriendData)
      {
         super();
         if(param1 == null)
         {
            return;
         }
         this._id = param1.id;
         this._name = param1.name;
         this.var_898 = param1.gender;
         this.var_610 = param1.online;
         this.var_1701 = param1.followingAllowed && param1.online;
         this.var_597 = param1.figure;
         this.var_1700 = param1.motto;
         this.var_1414 = param1.lastAccess;
         this.var_1297 = param1.categoryId;
         this.var_1412 = param1.realName;
         Logger.log("Creating friend: " + this.id + ", " + this.name + ", " + this.gender + ", " + this.online + ", " + this.followingAllowed + ", " + this.figure + ", " + this.categoryId);
      }
      
      public function set categoryId(param1:int) : void
      {
         this.var_1297 = param1;
      }
      
      public function set gender(param1:int) : void
      {
         this.var_898 = param1;
      }
      
      public function get motto() : String
      {
         return this.var_1700;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set name(param1:String) : void
      {
         this._name = param1;
      }
      
      public function set realName(param1:String) : void
      {
         this.var_1412 = param1;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         if(this.var_1082 != null)
         {
            this.var_1082.dispose();
            this.var_1082 = null;
         }
         this._disposed = true;
         this._view = null;
      }
      
      public function get lastAccess() : String
      {
         return this.var_1414;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function set motto(param1:String) : void
      {
         this.var_1700 = param1;
      }
      
      public function get selected() : Boolean
      {
         return this.var_178;
      }
      
      public function get view() : IWindowContainer
      {
         return this._view;
      }
      
      public function set online(param1:Boolean) : void
      {
         this.var_610 = param1;
      }
      
      public function set followingAllowed(param1:Boolean) : void
      {
         this.var_1701 = param1;
      }
      
      public function set lastAccess(param1:String) : void
      {
         this.var_1414 = param1;
      }
      
      public function set id(param1:int) : void
      {
         this._id = param1;
      }
      
      public function get gender() : int
      {
         return this.var_898;
      }
      
      public function set selected(param1:Boolean) : void
      {
         this.var_178 = param1;
      }
      
      public function get realName() : String
      {
         return this.var_1412;
      }
      
      public function set view(param1:IWindowContainer) : void
      {
         this._view = param1;
      }
      
      public function set figure(param1:String) : void
      {
         this.var_597 = param1;
      }
      
      public function get categoryId() : int
      {
         return this.var_1297;
      }
      
      public function set face(param1:BitmapData) : void
      {
         this.var_1082 = param1;
      }
      
      public function get online() : Boolean
      {
         return this.var_610;
      }
      
      public function get followingAllowed() : Boolean
      {
         return this.var_1701;
      }
      
      public function get face() : BitmapData
      {
         return this.var_1082;
      }
      
      public function get figure() : String
      {
         return this.var_597;
      }
   }
}
