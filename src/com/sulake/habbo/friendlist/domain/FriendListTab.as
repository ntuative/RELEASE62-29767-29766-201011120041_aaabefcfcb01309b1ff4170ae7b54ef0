package com.sulake.habbo.friendlist.domain
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.friendlist.HabboFriendList;
   import com.sulake.habbo.friendlist.ITabView;
   
   public class FriendListTab
   {
      
      public static const const_92:int = 2;
      
      public static const const_349:int = 3;
      
      public static const const_93:int = 1;
       
      
      private var _id:int;
      
      private var _view:IWindowContainer;
      
      private var var_1652:ITabView;
      
      private var _footerName:String;
      
      private var var_1299:Boolean;
      
      private var var_2303:String;
      
      private var _name:String;
      
      private var var_178:Boolean;
      
      public function FriendListTab(param1:HabboFriendList, param2:int, param3:ITabView, param4:String, param5:String, param6:String)
      {
         super();
         this._id = param2;
         this._name = param4;
         this.var_1652 = param3;
         this._footerName = param5;
         this.var_2303 = param6;
         this.var_1652.init(param1);
      }
      
      public function get footerName() : String
      {
         return this._footerName;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function set view(param1:IWindowContainer) : void
      {
         this._view = param1;
      }
      
      public function get tabView() : ITabView
      {
         return this.var_1652;
      }
      
      public function get id() : int
      {
         return this._id;
      }
      
      public function setSelected(param1:Boolean) : void
      {
         if(param1)
         {
            this.var_1299 = false;
         }
         this.var_178 = param1;
      }
      
      public function setNewMessageArrived(param1:Boolean) : void
      {
         if(this.selected)
         {
            this.var_1299 = false;
         }
         else
         {
            this.var_1299 = param1;
         }
      }
      
      public function get newMessageArrived() : Boolean
      {
         return this.var_1299;
      }
      
      public function get headerPicName() : String
      {
         return this.var_2303;
      }
      
      public function get view() : IWindowContainer
      {
         return this._view;
      }
      
      public function get selected() : Boolean
      {
         return this.var_178;
      }
   }
}
