package com.sulake.habbo.widget.infostand
{
   import com.sulake.core.assets.IAssetLibrary;
   import com.sulake.core.window.IWindow;
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.catalog.IHabboCatalog;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import com.sulake.habbo.localization.IHabboLocalizationManager;
   import com.sulake.habbo.widget.RoomWidgetBase;
   import com.sulake.habbo.widget.events.RoomWidgetBadgeImageUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetFurniInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetPetCommandsUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetPetInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetRoomObjectUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserBadgesUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserFigureUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserInfoUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUserTagsUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetRoomObjectMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetUserActionMessage;
   import com.sulake.habbo.window.IHabboWindowManager;
   import com.sulake.habbo.window.enum.HabboWindowParam;
   import com.sulake.habbo.window.enum.HabboWindowStyle;
   import com.sulake.habbo.window.enum.HabboWindowType;
   import flash.events.IEventDispatcher;
   import flash.events.TimerEvent;
   import flash.geom.Rectangle;
   import flash.utils.Timer;
   
   public class InfostandWidget extends RoomWidgetBase
   {
       
      
      private var var_2418:Array;
      
      private const const_1521:String = "infostand_user_view";
      
      private var var_325:InfoStandPetView;
      
      private var var_1162:InfoStandPetData;
      
      private var var_142:Timer;
      
      private var var_1085:InfoStandFurniView;
      
      private var var_420:InfostandFurniData;
      
      private var var_382:InfoStandBotView;
      
      private var _mainContainer:IWindowContainer;
      
      private const const_1519:String = "infostand_bot_view";
      
      private var _catalog:IHabboCatalog;
      
      private const const_1520:String = "infostand_pet_view";
      
      private const const_1522:String = "infostand_furni_view";
      
      private const const_1777:int = 3000;
      
      private var var_182:InfoStandUserView;
      
      private var _config:IHabboConfigurationManager;
      
      private var var_576:InfostandUserData;
      
      public function InfostandWidget(param1:IHabboWindowManager, param2:IAssetLibrary, param3:IHabboLocalizationManager, param4:IHabboConfigurationManager, param5:IHabboCatalog)
      {
         super(param1,param2,param3);
         this._config = param4;
         this._catalog = param5;
         this.var_1085 = new InfoStandFurniView(this,this.const_1522,this._catalog);
         this.var_182 = new InfoStandUserView(this,this.const_1521);
         this.var_325 = new InfoStandPetView(this,this.const_1520);
         this.var_382 = new InfoStandBotView(this,this.const_1519);
         this.var_576 = new InfostandUserData();
         this.var_420 = new InfostandFurniData();
         this.var_1162 = new InfoStandPetData();
         this.var_142 = new Timer(this.const_1777);
         this.var_142.addEventListener(TimerEvent.TIMER,this.onUpdateTimer);
         this.mainContainer.visible = false;
      }
      
      private function onUserTags(param1:RoomWidgetUserTagsUpdateEvent) : void
      {
         if(param1.isOwnUser)
         {
            this.var_2418 = param1.tags;
         }
         if(param1.userId != this.userData.userId)
         {
            return;
         }
         if(param1.isOwnUser)
         {
            this.var_182.setTags(param1.tags);
         }
         else
         {
            this.var_182.setTags(param1.tags,this.var_2418);
         }
      }
      
      override public function registerUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_360,this.onRoomObjectSelected);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_202,this.onClose);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_257,this.onRoomObjectRemoved);
         param1.addEventListener(RoomWidgetRoomObjectUpdateEvent.const_123,this.onRoomObjectRemoved);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_197,this.onUserInfo);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.const_196,this.onUserInfo);
         param1.addEventListener(RoomWidgetUserInfoUpdateEvent.BOT,this.onBotInfo);
         param1.addEventListener(RoomWidgetFurniInfoUpdateEvent.const_613,this.onFurniInfo);
         param1.addEventListener(RoomWidgetUserTagsUpdateEvent.const_139,this.onUserTags);
         param1.addEventListener(RoomWidgetUserFigureUpdateEvent.const_151,this.onUserFigureUpdate);
         param1.addEventListener(RoomWidgetUserBadgesUpdateEvent.const_131,this.onUserBadges);
         param1.addEventListener(RoomWidgetBadgeImageUpdateEvent.const_606,this.onBadgeImage);
         param1.addEventListener(RoomWidgetPetInfoUpdateEvent.const_145,this.onPetInfo);
         param1.addEventListener(RoomWidgetPetCommandsUpdateEvent.const_152,this.onPetCommands);
         super.registerUpdateEvents(param1);
      }
      
      override public function get mainWindow() : IWindow
      {
         return this.mainContainer;
      }
      
      private function onPetInfo(param1:RoomWidgetPetInfoUpdateEvent) : void
      {
         this.petData.setData(param1);
         this.userData.petRespectLeft = param1.petRespectLeft;
         this.var_325.update(this.petData);
         this.selectView(this.const_1520);
         if(this.var_142)
         {
            this.var_142.start();
         }
      }
      
      public function get userData() : InfostandUserData
      {
         return this.var_576;
      }
      
      private function onUserInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         this.userData.setData(param1);
         this.var_182.update(param1);
         this.selectView(this.const_1521);
         if(this.var_142)
         {
            this.var_142.stop();
         }
      }
      
      private function onUpdateTimer(param1:TimerEvent) : void
      {
         if(this.var_325 == null)
         {
            return;
         }
         messageListener.processWidgetMessage(new RoomWidgetUserActionMessage(RoomWidgetUserActionMessage.const_425,this.var_325.getCurrentPetId()));
      }
      
      override public function unregisterUpdateEvents(param1:IEventDispatcher) : void
      {
         if(param1 == null)
         {
            return;
         }
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_360,this.onRoomObjectSelected);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_202,this.onClose);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_257,this.onRoomObjectRemoved);
         param1.removeEventListener(RoomWidgetRoomObjectUpdateEvent.const_123,this.onRoomObjectRemoved);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_197,this.onUserInfo);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.const_196,this.onUserInfo);
         param1.removeEventListener(RoomWidgetUserInfoUpdateEvent.BOT,this.onBotInfo);
         param1.removeEventListener(RoomWidgetFurniInfoUpdateEvent.const_613,this.onFurniInfo);
         param1.removeEventListener(RoomWidgetUserTagsUpdateEvent.const_139,this.onUserTags);
         param1.removeEventListener(RoomWidgetUserFigureUpdateEvent.const_151,this.onUserFigureUpdate);
         param1.removeEventListener(RoomWidgetUserBadgesUpdateEvent.const_131,this.onUserBadges);
         param1.removeEventListener(RoomWidgetBadgeImageUpdateEvent.const_606,this.onBadgeImage);
         param1.removeEventListener(RoomWidgetPetInfoUpdateEvent.const_145,this.onPetInfo);
         param1.removeEventListener(RoomWidgetPetCommandsUpdateEvent.const_152,this.onPetCommands);
      }
      
      override public function dispose() : void
      {
         if(this.var_142)
         {
            this.var_142.stop();
         }
         this.var_142 = null;
         if(this.var_182)
         {
            this.var_182.dispose();
         }
         this.var_182 = null;
         if(this.var_1085)
         {
            this.var_1085.dispose();
         }
         this.var_1085 = null;
         if(this.var_382)
         {
            this.var_382.dispose();
         }
         this.var_382 = null;
         if(this.var_325)
         {
            this.var_325.dispose();
         }
         this.var_325 = null;
         super.dispose();
      }
      
      private function onUserBadges(param1:RoomWidgetUserBadgesUpdateEvent) : void
      {
         if(param1.userId != this.userData.userId)
         {
            return;
         }
         this.userData.badges = param1.badges;
         this.var_182.clearBadges();
      }
      
      private function onBotInfo(param1:RoomWidgetUserInfoUpdateEvent) : void
      {
         this.userData.setData(param1);
         this.var_382.update(param1);
         this.selectView(this.const_1519);
         if(this.var_142)
         {
            this.var_142.stop();
         }
      }
      
      private function onUserFigureUpdate(param1:RoomWidgetUserFigureUpdateEvent) : void
      {
         if(!param1.isOwnUser)
         {
         }
         if(param1.userId != this.userData.userId)
         {
            return;
         }
         if(this.userData.isBot())
         {
            this.var_382.image = param1.image;
         }
         else
         {
            this.var_182.image = param1.image;
            this.var_182.motto = param1.customInfo;
         }
      }
      
      private function onFurniInfo(param1:RoomWidgetFurniInfoUpdateEvent) : void
      {
         this.furniData.setData(param1);
         this.var_1085.update(param1);
         this.selectView(this.const_1522);
         if(this.var_142)
         {
            this.var_142.stop();
         }
      }
      
      private function onBadgeImage(param1:RoomWidgetBadgeImageUpdateEvent) : void
      {
         var _loc2_:int = this.userData.badges.indexOf(param1.badgeID);
         if(_loc2_ >= 0)
         {
            if(this.userData.isBot())
            {
               this.var_382.setBadgeImage(_loc2_,param1.badgeImage);
            }
            else
            {
               this.var_182.setBadgeImage(_loc2_,param1.badgeImage);
            }
            return;
         }
         if(param1.badgeID == this.userData.groupBadgeId)
         {
            this.var_182.setGroupBadgeImage(param1.badgeImage);
         }
      }
      
      private function selectView(param1:String) : void
      {
         this.hideChildren();
         var _loc2_:IWindow = this.mainContainer.getChildByName(param1) as IWindow;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.visible = true;
         this.mainContainer.visible = true;
         this.mainContainer.width = _loc2_.width;
         this.mainContainer.height = _loc2_.height;
      }
      
      public function get mainContainer() : IWindowContainer
      {
         if(this._mainContainer == null)
         {
            this._mainContainer = windowManager.createWindow("infostand_main_container","",HabboWindowType.const_57,HabboWindowStyle.const_36,HabboWindowParam.const_36,new Rectangle(0,0,50,100)) as IWindowContainer;
            this._mainContainer.tags.push("room_widget_infostand");
            this._mainContainer.background = true;
            this._mainContainer.color = 0;
         }
         return this._mainContainer;
      }
      
      public function get furniData() : InfostandFurniData
      {
         return this.var_420;
      }
      
      private function onClose(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         this.close();
         if(this.var_142)
         {
            this.var_142.stop();
         }
      }
      
      public function get config() : IHabboConfigurationManager
      {
         return this._config;
      }
      
      private function onRoomObjectRemoved(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         var _loc2_:* = false;
         switch(param1.type)
         {
            case RoomWidgetRoomObjectUpdateEvent.const_123:
               _loc2_ = param1.id == this.var_420.id;
               break;
            case RoomWidgetRoomObjectUpdateEvent.const_257:
               if(this.var_182 != null && this.var_182.window != null && this.var_182.window.visible)
               {
                  _loc2_ = param1.id == this.var_576.userRoomId;
                  break;
               }
               if(this.var_325 != null && this.var_325.window != null && this.var_325.window.visible)
               {
                  _loc2_ = param1.id == this.var_1162.roomIndex;
                  break;
               }
               if(this.var_382 != null && this.var_382.window != null && this.var_382.window.visible)
               {
                  _loc2_ = param1.id == this.var_576.userRoomId;
                  break;
               }
         }
         if(_loc2_)
         {
            this.close();
         }
      }
      
      public function get petData() : InfoStandPetData
      {
         return this.var_1162;
      }
      
      public function refreshContainer() : void
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         while(_loc2_ < this.mainContainer.numChildren)
         {
            _loc1_ = this.mainContainer.getChildAt(_loc2_);
            if(_loc1_.visible)
            {
               this.mainContainer.width = _loc1_.width;
               this.mainContainer.height = _loc1_.height;
            }
            _loc2_++;
         }
      }
      
      private function onPetCommands(param1:RoomWidgetPetCommandsUpdateEvent) : void
      {
         this.var_325.updateEnabledTrainingCommands(param1.id,param1.enabledCommands);
      }
      
      public function close() : void
      {
         this.hideChildren();
         if(this.var_142)
         {
            this.var_142.stop();
         }
      }
      
      private function hideChildren() : void
      {
         var _loc1_:int = 0;
         if(this._mainContainer != null)
         {
            _loc1_ = 0;
            while(_loc1_ < this._mainContainer.numChildren)
            {
               this._mainContainer.getChildAt(_loc1_).visible = false;
               _loc1_++;
            }
         }
      }
      
      private function onRoomObjectSelected(param1:RoomWidgetRoomObjectUpdateEvent) : void
      {
         var _loc2_:RoomWidgetRoomObjectMessage = new RoomWidgetRoomObjectMessage(RoomWidgetRoomObjectMessage.const_372,param1.id,param1.category);
         messageListener.processWidgetMessage(_loc2_);
      }
   }
}
