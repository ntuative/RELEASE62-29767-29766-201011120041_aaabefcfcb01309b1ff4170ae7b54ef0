package com.sulake.habbo.friendlist
{
   import com.sulake.core.runtime.IUnknown;
   import flash.events.IEventDispatcher;
   import flash.utils.Dictionary;
   
   public interface IHabboFriendList extends IUnknown
   {
       
      
      function acceptFriendRequest(param1:int) : void;
      
      function canBeAskedForAFriend(param1:int) : Boolean;
      
      function getFriendNames() : Array;
      
      function getFriend(param1:int) : IFriend;
      
      function openFriendList() : void;
      
      function openHabboWebPage(param1:String, param2:Dictionary, param3:int, param4:int) : void;
      
      function get events() : IEventDispatcher;
      
      function declineFriendRequest(param1:int) : void;
      
      function getFriendCount(param1:Boolean, param2:Boolean) : int;
      
      function askForAFriend(param1:int, param2:String) : Boolean;
   }
}
