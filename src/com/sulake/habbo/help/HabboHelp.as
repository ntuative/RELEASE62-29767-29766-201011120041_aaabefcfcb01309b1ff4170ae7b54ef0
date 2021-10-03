package com.sulake.habbo.help
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.communication.messages.IMessageComposer;
   import com.sulake.core.runtime.Component;
   import com.sulake.core.runtime.IContext;
   import com.sulake.core.runtime.IID;
   import com.sulake.core.runtime.IUnknown;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.help.cfh.data.CallForHelpData;
   import com.sulake.habbo.help.cfh.data.UserRegistry;
   import com.sulake.habbo.help.enum.HabboHelpViewEnum;
   import com.sulake.habbo.help.help.HelpUI;
   import com.sulake.habbo.help.help.data.FaqIndex;
   import com.sulake.habbo.help.hotelmerge.HotelMergeUI;
   import com.sulake.habbo.help.register.RegistrationUI;
   import com.sulake.habbo.help.tutorial.TutorialUI;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.session.IRoomSessionManager;
   import com.sulake.habbo.session.events.RoomSessionEvent;
   import com.sulake.habbo.toolbar.HabboToolbarIconEnum;
   import com.sulake.habbo.toolbar.IHabboToolbar;
   import com.sulake.habbo.toolbar.events.HabboToolbarEvent;
   import com.sulake.habbo.toolbar.events.HabboToolbarSetIconEvent;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.iid.IIDHabboCommunicationManager;
   import com.sulake.iid.IIDHabboConfigurationManager;
   import com.sulake.iid.IIDHabboLocalizationManager;
   import com.sulake.iid.IIDHabboRoomSessionManager;
   import com.sulake.iid.IIDHabboToolbar;
   import flash.utils.Dictionary;
   import iid.IIDHabboWindowManager;
   
   public class HabboHelp extends Component implements IHabboHelp
   {
       
      
      private var var_1945:UserRegistry;
      
      private var _assetLibrary:IAssetLibrary;
      
      private var var_153:TutorialUI;
      
      private var var_766:IHabboLocalizationManager;
      
      private var _windowManager:IHabboWindowManager;
      
      private var var_767:RegistrationUI;
      
      private var var_58:HelpUI;
      
      private var var_768:IHabboConfigurationManager;
      
      private var var_192:IHabboToolbar;
      
      private var var_617:HotelMergeUI;
      
      private var var_276:IHabboCommunicationManager;
      
      private var var_953:FaqIndex;
      
      private var var_1946:String = "";
      
      private var var_1360:IncomingMessages;
      
      private var var_1179:CallForHelpData;
      
      public function HabboHelp(param1:IContext, param2:uint = 0, param3:IAssetLibrary = null)
      {
         this.var_1179 = new CallForHelpData();
         this.var_1945 = new UserRegistry();
         super(param1,param2,param3);
         this._assetLibrary = param3;
         this.var_953 = new FaqIndex();
         queueInterface(new IIDHabboWindowManager(),this.onWindowManagerReady);
      }
      
      public function showCallForHelpReply(param1:String) : void
      {
         if(this.var_58 != null)
         {
            this.var_58.showCallForHelpReply(param1);
         }
      }
      
      public function tellUI(param1:String, param2:* = null) : void
      {
         if(this.var_58 != null)
         {
            this.var_58.tellUI(param1,param2);
         }
      }
      
      private function toggleHelpUI() : void
      {
         if(this.var_58 == null)
         {
            if(!this.createHelpUI())
            {
               return;
            }
         }
         this.var_58.toggleUI();
      }
      
      public function removeTutorialUI() : void
      {
         if(this.var_153 != null)
         {
            this.var_153.dispose();
            this.var_153 = null;
         }
      }
      
      public function get ownUserName() : String
      {
         return this.var_1946;
      }
      
      public function get windowManager() : IHabboWindowManager
      {
         return this._windowManager;
      }
      
      override public function dispose() : void
      {
         if(this.var_58 != null)
         {
            this.var_58.dispose();
            this.var_58 = null;
         }
         if(this.var_153 != null)
         {
            this.var_153.dispose();
            this.var_153 = null;
         }
         if(this.var_617)
         {
            this.var_617.dispose();
            this.var_617 = null;
         }
         if(this.var_767 != null)
         {
            this.var_767.dispose();
            this.var_767 = null;
         }
         if(this.var_953 != null)
         {
            this.var_953.dispose();
            this.var_953 = null;
         }
         this.var_1360 = null;
         if(this.var_192)
         {
            this.var_192.release(new IIDHabboToolbar());
            this.var_192 = null;
         }
         if(this.var_766)
         {
            this.var_766.release(new IIDHabboLocalizationManager());
            this.var_766 = null;
         }
         if(this.var_276)
         {
            this.var_276.release(new IIDHabboCommunicationManager());
            this.var_276 = null;
         }
         if(this.var_768)
         {
            this.var_768.release(new IIDHabboConfigurationManager());
            this.var_768 = null;
         }
         if(this._windowManager)
         {
            this._windowManager.release(new IIDHabboWindowManager());
            this._windowManager = null;
         }
         super.dispose();
      }
      
      public function get localization() : IHabboLocalizationManager
      {
         return this.var_766;
      }
      
      private function onRoomSessionEvent(param1:RoomSessionEvent) : void
      {
         switch(param1.type)
         {
            case RoomSessionEvent.const_83:
               if(this.var_58 != null)
               {
                  this.var_58.setRoomSessionStatus(true);
               }
               if(this.var_153 != null)
               {
                  this.var_153.setRoomSessionStatus(true);
               }
               break;
            case RoomSessionEvent.const_90:
               if(this.var_58 != null)
               {
                  this.var_58.setRoomSessionStatus(false);
               }
               if(this.var_153 != null)
               {
                  this.var_153.setRoomSessionStatus(false);
               }
               this.userRegistry.unregisterRoom();
         }
      }
      
      public function enableCallForGuideBotUI() : void
      {
         if(this.var_58 != null)
         {
            this.var_58.updateCallForGuideBotUI(true);
         }
      }
      
      public function get userRegistry() : UserRegistry
      {
         return this.var_1945;
      }
      
      public function initHotelMergeUI() : void
      {
         if(!this.var_617)
         {
            this.var_617 = new HotelMergeUI(this);
         }
         this.var_617.startNameChange();
      }
      
      private function createTutorialUI() : Boolean
      {
         if(this.var_153 == null && this._assetLibrary != null && this._windowManager != null)
         {
            this.var_153 = new TutorialUI(this);
         }
         return this.var_153 != null;
      }
      
      private function createHelpUI() : Boolean
      {
         if(this.var_58 == null && this._assetLibrary != null && this._windowManager != null)
         {
            this.var_58 = new HelpUI(this,this._assetLibrary,this._windowManager,this.var_766,this.var_192);
         }
         return this.var_58 != null;
      }
      
      public function get callForHelpData() : CallForHelpData
      {
         return this.var_1179;
      }
      
      public function reportUser(param1:int, param2:String) : void
      {
         this.var_1179.reportedUserId = param1;
         this.var_1179.reportedUserName = param2;
         this.var_58.showUI(HabboHelpViewEnum.const_366);
      }
      
      public function set ownUserName(param1:String) : void
      {
         this.var_1946 = param1;
      }
      
      private function setHabboToolbarIcon() : void
      {
         if(this.var_192 != null)
         {
            this.var_192.events.dispatchEvent(new HabboToolbarSetIconEvent(HabboToolbarSetIconEvent.const_121,HabboToolbarIconEnum.HELP));
         }
      }
      
      public function showCallForHelpResult(param1:String) : void
      {
         if(this.var_58 != null)
         {
            this.var_58.showCallForHelpResult(param1);
         }
      }
      
      private function onWindowManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this._windowManager = IHabboWindowManager(param2);
         queueInterface(new IIDHabboCommunicationManager(),this.onCommunicationManagerReady);
      }
      
      private function onLocalizationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_766 = IHabboLocalizationManager(param2);
         queueInterface(new IIDHabboConfigurationManager(),this.onConfigurationManagerReady);
      }
      
      public function updateTutorial(param1:Boolean, param2:Boolean, param3:Boolean) : void
      {
         if(param1 && param2 && param3)
         {
            this.removeTutorialUI();
            return;
         }
         if(this.var_153 == null)
         {
            if(!this.createTutorialUI())
            {
               return;
            }
         }
         this.var_153.update(param1,param2,param3);
      }
      
      public function initRegistrationUI() : void
      {
         if(!this.var_767)
         {
            this.var_767 = new RegistrationUI(this);
         }
         this.var_767.showRegistrationView();
      }
      
      private function onCommunicationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_276 = IHabboCommunicationManager(param2);
         this.var_1360 = new IncomingMessages(this,this.var_276);
         queueInterface(new IIDHabboToolbar(),this.onToolbarReady);
      }
      
      public function showUI(param1:String = null) : void
      {
         if(this.var_58 != null)
         {
            this.var_58.showUI(param1);
         }
      }
      
      public function hideUI() : void
      {
         if(this.var_58 != null)
         {
            this.var_58.hideUI();
         }
      }
      
      public function sendMessage(param1:IMessageComposer) : void
      {
         if(this.var_276 != null && param1 != null)
         {
            this.var_276.getHabboMainConnection(null).send(param1);
         }
      }
      
      public function getFaq() : FaqIndex
      {
         return this.var_953;
      }
      
      public function disableCallForGuideBotUI() : void
      {
         if(this.var_58 != null)
         {
            this.var_58.updateCallForGuideBotUI(false);
         }
      }
      
      private function onToolbarReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_192 = IHabboToolbar(param2);
         queueInterface(new IIDHabboLocalizationManager(),this.onLocalizationManagerReady);
      }
      
      private function onConfigurationManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         this.var_768 = IHabboConfigurationManager(param2);
         queueInterface(new IIDHabboRoomSessionManager(),this.onRoomSessionManagerReady);
      }
      
      public function get tutorialUI() : TutorialUI
      {
         return this.var_153;
      }
      
      private function onHabboToolbarEvent(param1:HabboToolbarEvent) : void
      {
         if(param1.type == HabboToolbarEvent.const_77)
         {
            this.setHabboToolbarIcon();
            return;
         }
         if(param1.type == HabboToolbarEvent.const_48)
         {
            if(param1.iconId == HabboToolbarIconEnum.HELP)
            {
               this.toggleHelpUI();
               return;
            }
         }
      }
      
      public function get hotelMergeUI() : HotelMergeUI
      {
         return this.var_617;
      }
      
      private function onRoomSessionManagerReady(param1:IID = null, param2:IUnknown = null) : void
      {
         var _loc3_:IRoomSessionManager = IRoomSessionManager(param2);
         _loc3_.events.addEventListener(RoomSessionEvent.const_83,this.onRoomSessionEvent);
         _loc3_.events.addEventListener(RoomSessionEvent.const_90,this.onRoomSessionEvent);
         this.var_192.events.addEventListener(HabboToolbarEvent.const_77,this.onHabboToolbarEvent);
         this.var_192.events.addEventListener(HabboToolbarEvent.const_48,this.onHabboToolbarEvent);
         this.createHelpUI();
         this.setHabboToolbarIcon();
      }
      
      public function get toolbar() : IHabboToolbar
      {
         return this.var_192;
      }
      
      public function getConfigurationKey(param1:String, param2:String = null, param3:Dictionary = null) : String
      {
         if(this.var_768 == null)
         {
            return param1;
         }
         return this.var_768.getKey(param1,param2,param3);
      }
   }
}
