package com.sulake.habbo.ui
{
   import com.sulake.habbo.avatar.IAvatarRenderManager;
   import com.sulake.habbo.avatar.IHabboAvatarEditor;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.friendlist.IHabboFriendList;
   import com.sulake.habbo.help.IHabboHelp;
   import com.sulake.habbo.inventory.IHabboInventory;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.moderation.IHabboModeration;
   import com.sulake.habbo.navigator.IHabboNavigator;
   import com.sulake.habbo.room.IRoomEngine;
   import com.sulake.habbo.roomevents.IHabboUserDefinedRoomEvents;
   import com.sulake.habbo.session.IRoomSession;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.sound.IHabboSoundManager;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.widget.IRoomWidgetFactory;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import flash.events.IEventDispatcher;
   import flash.geom.Rectangle;
   
   public interface IRoomWidgetHandlerContainer
   {
       
      
      function get config() : IHabboConfigurationManager;
      
      function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent;
      
      function get roomEngine() : IRoomEngine;
      
      function get toolbar() : IHabboToolbar;
      
      function get roomWidgetFactory() : IRoomWidgetFactory;
      
      function get navigator() : IHabboNavigator;
      
      function get catalog() : IHabboCatalog;
      
      function getRoomViewRect() : Rectangle;
      
      function get friendList() : IHabboFriendList;
      
      function get windowManager() : IHabboWindowManager;
      
      function get soundManager() : IHabboSoundManager;
      
      function get localization() : IHabboLocalizationManager;
      
      function setRoomViewColor(param1:uint, param2:int) : void;
      
      function get inventory() : IHabboInventory;
      
      function get avatarRenderManager() : IAvatarRenderManager;
      
      function get avatarEditor() : IHabboAvatarEditor;
      
      function get events() : IEventDispatcher;
      
      function get sessionDataManager() : ISessionDataManager;
      
      function get userDefinedRoomEvents() : IHabboUserDefinedRoomEvents;
      
      function getFirstCanvasId() : int;
      
      function get moderation() : IHabboModeration;
      
      function get habboHelp() : IHabboHelp;
      
      function get roomSessionManager() : IRoomSessionManager;
      
      function get roomSession() : IRoomSession;
      
      function setInterstitialCompleted() : void;
   }
}
