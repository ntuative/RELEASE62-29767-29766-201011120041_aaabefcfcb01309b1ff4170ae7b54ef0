package com.sulake.habbo.inventory
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.communication.messages.IMessageEvent;
   import com.sulake.core.utils.ErrorReportStorage;
   import com.sulake.core.utils.Map;
   import com.sulake.habbo.communication.IHabboCommunicationManager;
   import com.sulake.habbo.communication.messages.incoming.catalog.NotEnoughBalanceMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.handshake.UserRightsMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.achievements.AchievementsEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.avatareffect.AvatarEffect;
   import com.sulake.habbo.communication.messages.incoming.inventory.avatareffect.AvatarEffectActivatedMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.avatareffect.AvatarEffectAddedMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.avatareffect.AvatarEffectExpiredMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.avatareffect.AvatarEffectsMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.badges.BadgePointLimitsEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.badges.BadgesEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.furni.FurniData;
   import com.sulake.habbo.communication.messages.incoming.inventory.furni.FurniListEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.furni.FurniListInsertEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.furni.FurniListRemoveEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.furni.FurniListUpdateEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.furni.PostItPlacedEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.pets.PetAddedToInventoryEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.pets.PetInventoryEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.pets.PetInventoryUpdatedEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.pets.PetRemovedFromInventoryEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.purse.CreditBalanceEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.trading.ItemDataStructure;
   import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingAcceptEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingAlreadyOpenEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingCloseEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingCompletedEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingConfirmationEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingItemListEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingNotOpenEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingOpenEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingOtherNotAllowedEvent;
   import com.sulake.habbo.communication.messages.incoming.inventory.trading.TradingYouAreNotAllowedEvent;
   import com.sulake.habbo.communication.messages.incoming.marketplace.MarketplaceCanMakeOfferResult;
   import com.sulake.habbo.communication.messages.incoming.marketplace.MarketplaceConfigurationEvent;
   import com.sulake.habbo.communication.messages.incoming.marketplace.MarketplaceItemStatsEvent;
   import com.sulake.habbo.communication.messages.incoming.marketplace.MarketplaceMakeOfferResult;
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatAccessDeniedMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.notifications.HabboAchievementNotificationMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.notifications.HabboActivityPointNotificationMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.room.session.CloseConnectionMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.room.session.OpenConnectionMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.users.HabboUserBadgesMessageEvent;
   import com.sulake.habbo.communication.messages.incoming.users.ScrSendUserInfoEvent;
   import com.sulake.habbo.communication.messages.outgoing.inventory.furni.RequestFurniInventoryComposer;
   import com.sulake.habbo.communication.messages.parser.inventory.achievements.AchievementsMessageParser;
   import com.sulake.habbo.communication.messages.parser.inventory.avatareffect.AvatarEffectActivatedMessageParser;
   import com.sulake.habbo.communication.messages.parser.inventory.avatareffect.AvatarEffectAddedMessageParser;
   import com.sulake.habbo.communication.messages.parser.inventory.avatareffect.AvatarEffectExpiredMessageParser;
   import com.sulake.habbo.communication.messages.parser.inventory.avatareffect.AvatarEffectsMessageParser;
   import com.sulake.habbo.communication.messages.parser.inventory.badges.BadgeAndPointLimit;
   import com.sulake.habbo.communication.messages.parser.inventory.badges.BadgePointLimitsParser;
   import com.sulake.habbo.communication.messages.parser.inventory.badges.BadgesParser;
   import com.sulake.habbo.communication.messages.parser.inventory.furni.FurniListInsertParser;
   import com.sulake.habbo.communication.messages.parser.inventory.furni.FurniListParser;
   import com.sulake.habbo.communication.messages.parser.inventory.furni.FurniListRemoveParser;
   import com.sulake.habbo.communication.messages.parser.inventory.furni.PostItPlacedParser;
   import com.sulake.habbo.communication.messages.parser.inventory.pets.PetAddedToInventoryParser;
   import com.sulake.habbo.communication.messages.parser.inventory.pets.PetData;
   import com.sulake.habbo.communication.messages.parser.inventory.pets.PetInventoryMessageParser;
   import com.sulake.habbo.communication.messages.parser.inventory.pets.PetRemovedFromInventoryParser;
   import com.sulake.habbo.communication.messages.parser.inventory.trading.TradingAcceptParser;
   import com.sulake.habbo.communication.messages.parser.inventory.trading.TradingAlreadyOpenParser;
   import com.sulake.habbo.communication.messages.parser.inventory.trading.TradingCloseParser;
   import com.sulake.habbo.communication.messages.parser.inventory.trading.TradingCompletedParser;
   import com.sulake.habbo.communication.messages.parser.inventory.trading.TradingConfirmationParser;
   import com.sulake.habbo.communication.messages.parser.inventory.trading.TradingItemListParser;
   import com.sulake.habbo.communication.messages.parser.inventory.trading.TradingNotOpenParser;
   import com.sulake.habbo.communication.messages.parser.inventory.trading.TradingOpenParser;
   import com.sulake.habbo.communication.messages.parser.inventory.trading.TradingOtherNotAllowedParser;
   import com.sulake.habbo.communication.messages.parser.inventory.trading.TradingYouAreNotAllowedParser;
   import com.sulake.habbo.communication.messages.parser.marketplace.MarketplaceCanMakeOfferResultParser;
   import com.sulake.habbo.communication.messages.parser.marketplace.MarketplaceConfigurationParser;
   import com.sulake.habbo.communication.messages.parser.marketplace.MarketplaceItemStatsParser;
   import com.sulake.habbo.communication.messages.parser.marketplace.MarketplaceMakeOfferResultParser;
   import com.sulake.habbo.communication.messages.parser.users.ScrSendUserInfoMessageParser;
   import com.sulake.habbo.inventory.achievements.AchievementsModel;
   import com.sulake.habbo.inventory.badges.BadgesModel;
   import com.sulake.habbo.inventory.effects.Effect;
   import com.sulake.habbo.inventory.effects.EffectsModel;
   import com.sulake.habbo.inventory.enum.FurniCategory;
   import com.sulake.habbo.inventory.enum.InventoryCategory;
   import com.sulake.habbo.inventory.enum.InventorySubCategory;
   import com.sulake.habbo.inventory.events.HabboInventoryHabboClubEvent;
   import com.sulake.habbo.inventory.furni.FurniModel;
   import com.sulake.habbo.inventory.items.FloorItem;
   import com.sulake.habbo.inventory.items.GroupItem;
   import com.sulake.habbo.inventory.items.IItem;
   import com.sulake.habbo.inventory.items.WallItem;
   import com.sulake.habbo.inventory.marketplace.MarketplaceModel;
   import com.sulake.habbo.inventory.pets.PetsModel;
   import com.sulake.habbo.inventory.trading.TradingModel;
   import com.sulake.habbo.session.IRoomSession;
   import com.sulake.habbo.session.ISessionDataManager;
   import com.sulake.habbo.session.IUserData;
   
   public class IncomingMessages
   {
       
      
      private var var_22:IHabboCommunicationManager;
      
      private var _inventory:HabboInventory;
      
      public function IncomingMessages(param1:HabboInventory)
      {
         super();
         this._inventory = param1;
         this.var_22 = this._inventory.communication;
         this.var_22.addHabboConnectionMessageEvent(new FurniListEvent(this.onFurniList));
         this.var_22.addHabboConnectionMessageEvent(new FurniListInsertEvent(this.onFurniListInsert));
         this.var_22.addHabboConnectionMessageEvent(new FurniListRemoveEvent(this.onFurniListRemove));
         this.var_22.addHabboConnectionMessageEvent(new FurniListUpdateEvent(this.onFurniListUpdate));
         this.var_22.addHabboConnectionMessageEvent(new PostItPlacedEvent(this.onPostItPlaced));
         this.var_22.addHabboConnectionMessageEvent(new AvatarEffectsMessageEvent(this.onAvatarEffects));
         this.var_22.addHabboConnectionMessageEvent(new AvatarEffectActivatedMessageEvent(this.onAvatarEffectActivated));
         this.var_22.addHabboConnectionMessageEvent(new AvatarEffectAddedMessageEvent(this.onAvatarEffectAdded));
         this.var_22.addHabboConnectionMessageEvent(new AvatarEffectExpiredMessageEvent(this.onAvatarEffectExpired));
         this.var_22.addHabboConnectionMessageEvent(new HabboActivityPointNotificationMessageEvent(this.onPixelBalance));
         this.var_22.addHabboConnectionMessageEvent(new CreditBalanceEvent(this.onCreditsBalance));
         this.var_22.addHabboConnectionMessageEvent(new ScrSendUserInfoEvent(this.onClubStatus));
         this.var_22.addHabboConnectionMessageEvent(new BadgesEvent(this.onBadges));
         this.var_22.addHabboConnectionMessageEvent(new HabboUserBadgesMessageEvent(this.onUserBadges));
         this.var_22.addHabboConnectionMessageEvent(new HabboAchievementNotificationMessageEvent(this.onAchievementReceived));
         this.var_22.addHabboConnectionMessageEvent(new BadgePointLimitsEvent(this.onBadgePointLimits));
         this.var_22.addHabboConnectionMessageEvent(new AchievementsEvent(this.onAchievements));
         this.var_22.addHabboConnectionMessageEvent(new TradingAcceptEvent(this.onTradingAccepted,TradingAcceptParser));
         this.var_22.addHabboConnectionMessageEvent(new TradingConfirmationEvent(this.onTradingConfirmation,TradingConfirmationParser));
         this.var_22.addHabboConnectionMessageEvent(new TradingAlreadyOpenEvent(this.onTradingAlreadyOpen,TradingAlreadyOpenParser));
         this.var_22.addHabboConnectionMessageEvent(new TradingCloseEvent(this.onTradingClose,TradingCloseParser));
         this.var_22.addHabboConnectionMessageEvent(new TradingCompletedEvent(this.onTradingCompleted,TradingCompletedParser));
         this.var_22.addHabboConnectionMessageEvent(new TradingItemListEvent(this.onTradingItemList,TradingItemListParser));
         this.var_22.addHabboConnectionMessageEvent(new TradingNotOpenEvent(this.onTradingNotOpen,TradingNotOpenParser));
         this.var_22.addHabboConnectionMessageEvent(new TradingOpenEvent(this.onTradingOpen,TradingOpenParser));
         this.var_22.addHabboConnectionMessageEvent(new TradingOtherNotAllowedEvent(this.onTradingOtherNotAllowed,TradingOtherNotAllowedParser));
         this.var_22.addHabboConnectionMessageEvent(new TradingYouAreNotAllowedEvent(this.onTradingYouAreNotAllowed,TradingYouAreNotAllowedParser));
         this.var_22.addHabboConnectionMessageEvent(new OpenConnectionMessageEvent(this.onRoomClosed));
         this.var_22.addHabboConnectionMessageEvent(new CloseConnectionMessageEvent(this.onRoomClosed));
         this.var_22.addHabboConnectionMessageEvent(new FlatAccessDeniedMessageEvent(this.onRoomClosed));
         this.var_22.addHabboConnectionMessageEvent(new PetInventoryEvent(this.onPets));
         this.var_22.addHabboConnectionMessageEvent(new PetAddedToInventoryEvent(this.onPetAdded));
         this.var_22.addHabboConnectionMessageEvent(new PetRemovedFromInventoryEvent(this.onPetRemoved));
         this.var_22.addHabboConnectionMessageEvent(new PetInventoryUpdatedEvent(this.onPetInventoryUpdated));
         this.var_22.addHabboConnectionMessageEvent(new MarketplaceConfigurationEvent(this.onMarketplaceConfiguration));
         this.var_22.addHabboConnectionMessageEvent(new MarketplaceCanMakeOfferResult(this.onMarketplaceCanMakeOfferResult));
         this.var_22.addHabboConnectionMessageEvent(new MarketplaceMakeOfferResult(this.onMarketplaceMakeOfferResult));
         this.var_22.addHabboConnectionMessageEvent(new MarketplaceItemStatsEvent(this.onMarketplaceItemStats));
         this.var_22.addHabboConnectionMessageEvent(new NotEnoughBalanceMessageEvent(this.onNotEnoughCredits));
         this.var_22.addHabboConnectionMessageEvent(new UserRightsMessageEvent(this.onUserRights));
      }
      
      private function onPetRemoved(param1:PetRemovedFromInventoryEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:PetRemovedFromInventoryParser = param1.getParser();
         var _loc3_:PetsModel = this._inventory.petsModel;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.removePet(_loc2_.petId);
      }
      
      public function onFurniListRemove(param1:IMessageEvent) : void
      {
         var _loc2_:FurniListRemoveParser = (param1 as FurniListRemoveEvent).getParser();
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:int = _loc2_.stripId;
         var _loc4_:FurniModel = this._inventory.furniModel;
         if(_loc4_ == null)
         {
            return;
         }
         _loc4_.removeFurni(_loc3_);
      }
      
      public function onFurniListUpdate(param1:IMessageEvent) : void
      {
         var _loc2_:IConnection = this.getConnection();
         if(_loc2_ != null)
         {
            _loc2_.send(new RequestFurniInventoryComposer(0,0));
         }
         this._inventory.setInventoryCategoryInit(InventoryCategory.const_74,false);
      }
      
      public function onPostItPlaced(param1:IMessageEvent) : void
      {
         var _loc2_:PostItPlacedParser = (param1 as PostItPlacedEvent).getParser();
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:int = _loc2_.id;
         var _loc4_:int = _loc2_.itemsLeft;
         var _loc5_:FurniModel = this._inventory.furniModel;
         if(_loc5_ == null)
         {
            return;
         }
         _loc5_.updatePostItCount(_loc3_,_loc4_);
      }
      
      public function onAvatarEffectActivated(param1:IMessageEvent) : void
      {
         var _loc2_:EffectsModel = this._inventory.effectsModel;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:AvatarEffectActivatedMessageParser = (param1 as AvatarEffectActivatedMessageEvent).getParser();
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:int = _loc3_.type;
         _loc2_.setEffectActivated(_loc4_);
         this._inventory.notifyChangedEffects();
      }
      
      private function onTradingAccepted(param1:IMessageEvent) : void
      {
         var _loc2_:TradingModel = this._inventory.tradingModel;
         if(_loc2_ != null)
         {
            _loc2_.handleMessageEvent(param1);
         }
      }
      
      public function onAvatarEffects(param1:IMessageEvent) : void
      {
         var _loc6_:* = null;
         var _loc7_:* = null;
         var _loc2_:EffectsModel = this._inventory.effectsModel;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:AvatarEffectsMessageParser = (param1 as AvatarEffectsMessageEvent).getParser();
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:Array = _loc3_.effects;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc6_ = _loc4_[_loc5_] as AvatarEffect;
            _loc7_ = new Effect();
            _loc7_.type = _loc6_.type;
            _loc7_.duration = _loc6_.duration;
            _loc7_.effectsInInventory = _loc6_.inactiveEffectsInInventory;
            if(_loc6_.secondsLeftIfActive >= 0)
            {
               _loc7_.isActive = true;
               _loc7_.secondsLeft = _loc6_.secondsLeftIfActive;
               ++_loc7_.effectsInInventory;
            }
            else if(_loc6_.secondsLeftIfActive == -1)
            {
               _loc7_.isActive = false;
               _loc7_.secondsLeft = _loc6_.duration;
            }
            _loc2_.addEffect(_loc7_,false);
            _loc5_++;
         }
         this._inventory.setInventoryCategoryInit(InventoryCategory.const_702);
         _loc2_.refreshViews();
         this._inventory.notifyChangedEffects();
      }
      
      private function onTradingItemList(param1:IMessageEvent) : void
      {
         var _loc5_:* = 0;
         var _loc6_:* = null;
         var _loc7_:int = 0;
         var _loc8_:* = null;
         var _loc9_:* = null;
         var _loc10_:int = 0;
         var _loc2_:TradingItemListEvent = param1 as TradingItemListEvent;
         var _loc3_:Map = new Map();
         var _loc4_:Map = new Map();
         var _loc11_:FurniModel = this._inventory.furniModel;
         if(_loc11_ == null)
         {
            return;
         }
         _loc5_ = uint(_loc2_.firstUserItemArray.length);
         _loc10_ = 0;
         while(_loc10_ < _loc5_)
         {
            _loc9_ = _loc2_.firstUserItemArray[_loc10_] as ItemDataStructure;
            _loc7_ = _loc9_.itemTypeID;
            _loc8_ = String(_loc7_);
            if(!_loc9_.groupable)
            {
               _loc8_ = "itemid" + _loc9_.itemID;
            }
            if(_loc9_.category == FurniCategory.const_148)
            {
               _loc8_ = String(_loc7_) + "poster" + _loc9_.stuffData;
            }
            _loc6_ = !!_loc9_.groupable ? _loc3_.getValue(_loc8_) as GroupItem : null;
            if(_loc9_.itemType == "S")
            {
               if(_loc6_ == null)
               {
                  _loc6_ = _loc11_.createNewGroupItemTemplate(_loc7_,FurniModel.const_40,_loc9_.category,_loc9_.stuffData);
                  _loc3_.add(_loc8_,_loc6_);
               }
               _loc6_.push(new FloorItem(_loc9_.itemID,_loc9_.itemTypeID,_loc9_.roomItemID,_loc9_.category,true,true,true,true,_loc9_.stuffData,_loc9_.extra,_loc9_.timeToExpiration,_loc9_.creationDay,_loc9_.creationMonth,_loc9_.creationYear,null,_loc9_.songID));
            }
            else
            {
               if(_loc9_.itemType != "I")
               {
                  throw new Error("Unsupported item category: \"" + _loc9_.itemType + "\"");
               }
               if(_loc6_ == null)
               {
                  _loc6_ = _loc11_.createNewGroupItemTemplate(_loc7_,FurniModel.const_43,_loc9_.category,_loc9_.stuffData);
                  _loc3_.add(_loc8_,_loc6_);
               }
               _loc6_.push(new WallItem(_loc9_.itemID,_loc9_.itemTypeID,_loc9_.roomItemID,_loc9_.category,true,true,true,true,_loc9_.stuffData,_loc9_.extra));
            }
            _loc10_++;
         }
         _loc5_ = uint(_loc2_.secondUserItemArray.length);
         _loc10_ = 0;
         while(_loc10_ < _loc5_)
         {
            _loc9_ = _loc2_.secondUserItemArray[_loc10_] as ItemDataStructure;
            _loc7_ = _loc9_.itemTypeID;
            _loc8_ = String(_loc7_);
            if(!_loc9_.groupable)
            {
               _loc8_ = "itemid" + _loc9_.itemID;
            }
            if(_loc9_.category == FurniCategory.const_148)
            {
               _loc8_ = String(_loc7_) + "poster" + _loc9_.stuffData;
            }
            _loc6_ = !!_loc9_.groupable ? _loc4_.getValue(_loc8_) as GroupItem : null;
            if(_loc9_.itemType == "S")
            {
               if(_loc6_ == null)
               {
                  _loc6_ = _loc11_.createNewGroupItemTemplate(_loc7_,FurniModel.const_40,_loc9_.category,_loc9_.stuffData);
                  _loc4_.add(_loc8_,_loc6_);
               }
               _loc6_.push(new FloorItem(_loc9_.itemID,_loc9_.itemTypeID,_loc9_.roomItemID,_loc9_.category,true,true,true,true,_loc9_.stuffData,_loc9_.extra,_loc9_.timeToExpiration,_loc9_.creationDay,_loc9_.creationMonth,_loc9_.creationYear,null,_loc9_.songID));
            }
            else
            {
               if(_loc9_.itemType != "I")
               {
                  throw new Error("Unsupported item category: \"" + _loc9_.itemType + "\"");
               }
               if(_loc6_ == null)
               {
                  _loc6_ = _loc11_.createNewGroupItemTemplate(_loc7_,FurniModel.const_43,_loc9_.category,_loc9_.stuffData);
                  _loc4_.add(_loc8_,_loc6_);
               }
               _loc6_.push(new WallItem(_loc9_.itemID,_loc9_.itemTypeID,_loc9_.roomItemID,_loc9_.category,true,true,true,true,_loc9_.stuffData,_loc9_.extra));
            }
            _loc10_++;
         }
         var _loc12_:TradingModel = this._inventory.tradingModel;
         if(_loc12_ != null)
         {
            _loc12_.updateItemGroupMaps(_loc2_.firstUserID,_loc3_,_loc2_.secondUserID,_loc4_);
         }
      }
      
      private function onTradingYouAreNotAllowed(param1:IMessageEvent) : void
      {
         var _loc2_:TradingModel = this._inventory.tradingModel;
         if(_loc2_ != null)
         {
            _loc2_.handleMessageEvent(param1);
         }
      }
      
      public function onClubStatus(param1:IMessageEvent) : void
      {
         var _loc2_:ScrSendUserInfoMessageParser = (param1 as ScrSendUserInfoEvent).getParser();
         if(_loc2_.productName == "habbo_club" || _loc2_.productName == "club_habbo")
         {
            this._inventory.method_3(_loc2_.periodsSubscribedAhead,_loc2_.daysToPeriodEnd,_loc2_.hasEverBeenMember,_loc2_.isVIP);
            this._inventory.events.dispatchEvent(new HabboInventoryHabboClubEvent());
         }
      }
      
      private function onMarketplaceItemStats(param1:MarketplaceItemStatsEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:MarketplaceItemStatsParser = param1.getParser();
         var _loc3_:MarketplaceModel = this._inventory.marketplaceModel;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.setAveragePrice(_loc2_.furniCategoryId,_loc2_.furniTypeId,_loc2_.averagePrice);
      }
      
      private function onUserRights(param1:IMessageEvent) : void
      {
         var _loc2_:* = null;
         if(this._inventory.isInventoryCategoryInit(InventoryCategory.const_356))
         {
            _loc2_ = this._inventory.marketplaceModel;
            if(_loc2_ == null)
            {
               return;
            }
            _loc2_.requestInitialization();
         }
      }
      
      public function onAchievementReceived(param1:IMessageEvent) : void
      {
         var _loc2_:HabboAchievementNotificationMessageEvent = param1 as HabboAchievementNotificationMessageEvent;
         var _loc3_:BadgesModel = this._inventory.badgesModel;
         if(_loc3_ != null)
         {
            _loc3_.updateBadge(_loc2_.badgeID,false);
            _loc3_.removeBadge(_loc2_.removedBadgeID);
         }
      }
      
      private function getConnection() : IConnection
      {
         if(this.var_22 == null)
         {
            return null;
         }
         return this.var_22.getHabboMainConnection(null);
      }
      
      private function onPets(param1:PetInventoryEvent) : void
      {
         var _loc4_:* = null;
         if(param1 == null)
         {
            return;
         }
         var _loc2_:PetInventoryMessageParser = param1.getParser();
         var _loc3_:PetsModel = this._inventory.petsModel;
         if(_loc3_ == null)
         {
            return;
         }
         for each(_loc4_ in _loc2_.pets)
         {
            _loc3_.addPet(_loc4_);
         }
         this._inventory.setInventoryCategoryInit(InventoryCategory.const_143);
         this._inventory.petsModel.setListInitialized();
      }
      
      private function onTradingClose(param1:IMessageEvent) : void
      {
         var _loc2_:TradingModel = this._inventory.tradingModel;
         if(_loc2_ != null)
         {
            _loc2_.handleMessageEvent(param1);
         }
      }
      
      private function onTradingConfirmation(param1:IMessageEvent) : void
      {
         var _loc2_:TradingModel = this._inventory.tradingModel;
         if(_loc2_ != null)
         {
            _loc2_.handleMessageEvent(param1);
         }
      }
      
      public function onUserBadges(param1:IMessageEvent) : void
      {
         var _loc2_:HabboUserBadgesMessageEvent = param1 as HabboUserBadgesMessageEvent;
         if(_loc2_.userId != this._inventory.sessionData.userId)
         {
            return;
         }
         var _loc3_:BadgesModel = this._inventory.badgesModel;
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:Array = _loc2_.badges;
         var _loc5_:int = 0;
         while(_loc5_ < _loc4_.length)
         {
            _loc3_.updateBadge(_loc4_[_loc5_],true);
            _loc5_++;
         }
         _loc3_.updateView();
      }
      
      private function onTradingNotOpen(param1:IMessageEvent) : void
      {
         var _loc2_:TradingModel = this._inventory.tradingModel;
         if(_loc2_ != null)
         {
            _loc2_.handleMessageEvent(param1);
         }
      }
      
      public function onAvatarEffectExpired(param1:IMessageEvent) : void
      {
         var _loc2_:EffectsModel = this._inventory.effectsModel;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:AvatarEffectExpiredMessageParser = (param1 as AvatarEffectExpiredMessageEvent).getParser();
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:int = _loc3_.type;
         _loc2_.setEffectExpired(_loc4_);
         this._inventory.notifyChangedEffects();
      }
      
      public function dispose() : void
      {
         this._inventory = null;
         this.var_22 = null;
      }
      
      private function onTradingAlreadyOpen(param1:IMessageEvent) : void
      {
         var _loc2_:TradingModel = this._inventory.tradingModel;
         if(_loc2_ != null)
         {
            _loc2_.handleMessageEvent(param1);
         }
      }
      
      public function onCreditsBalance(param1:IMessageEvent) : void
      {
         this._inventory.creditBalance = (param1 as CreditBalanceEvent).getParser().balance;
      }
      
      public function onAchievements(param1:IMessageEvent) : void
      {
         var _loc2_:AchievementsEvent = param1 as AchievementsEvent;
         var _loc3_:AchievementsMessageParser = _loc2_.getParser() as AchievementsMessageParser;
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:AchievementsModel = this._inventory.achievementsModel;
         if(_loc4_ == null)
         {
            return;
         }
         _loc4_.setAchievements(_loc3_.achievements);
         this._inventory.setInventoryCategoryInit(InventoryCategory.const_350);
      }
      
      public function onBadgePointLimits(param1:IMessageEvent) : void
      {
         var _loc3_:* = null;
         var _loc2_:BadgePointLimitsParser = (param1 as BadgePointLimitsEvent).getParser();
         for each(_loc3_ in _loc2_.data)
         {
            this._inventory.localization.registerParameter("badge_desc_" + _loc3_.badgeId,"limit","" + _loc3_.limit);
         }
      }
      
      private function onRoomClosed(param1:IMessageEvent) : void
      {
         this._inventory.closeView();
      }
      
      private function onPetAdded(param1:PetAddedToInventoryEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:PetAddedToInventoryParser = param1.getParser();
         var _loc3_:PetsModel = this._inventory.petsModel;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.addPet(_loc2_.pet);
      }
      
      private function onTradingCompleted(param1:IMessageEvent) : void
      {
         var _loc2_:TradingModel = this._inventory.tradingModel;
         if(_loc2_ != null)
         {
            _loc2_.handleMessageEvent(param1);
         }
      }
      
      private function onTradingOtherNotAllowed(param1:IMessageEvent) : void
      {
         var _loc2_:TradingModel = this._inventory.tradingModel;
         if(_loc2_ != null)
         {
            _loc2_.handleMessageEvent(param1);
         }
      }
      
      private function onTradingOpen(param1:IMessageEvent) : void
      {
         var _loc14_:int = 0;
         var _loc15_:* = null;
         var _loc16_:Boolean = false;
         if(!this._inventory)
         {
            ErrorReportStorage.addDebugData("IncomingEvent","Trading open - inventory is null!");
            return;
         }
         var _loc2_:ISessionDataManager = this._inventory.sessionData;
         var _loc3_:IRoomSession = this._inventory.roomSession;
         if(!_loc2_)
         {
            ErrorReportStorage.addDebugData("IncomingEvent","Trading open - sessionData not available!");
            return;
         }
         if(!_loc3_)
         {
            ErrorReportStorage.addDebugData("IncomingEvent","Trading open - roomSession not available!");
            return;
         }
         this._inventory.toggleInventorySubPage(InventorySubCategory.const_297);
         var _loc4_:TradingOpenEvent = param1 as TradingOpenEvent;
         if(!_loc4_)
         {
            ErrorReportStorage.addDebugData("IncomingEvent","event is of unknown type:" + param1 + "!");
            return;
         }
         var _loc5_:int = _loc4_.userID;
         var _loc6_:IUserData = _loc3_.userDataManager.getUserData(_loc5_);
         if(!_loc6_)
         {
            ErrorReportStorage.addDebugData("IncomingEvent","Trading open - failed to retrieve own user data!");
            return;
         }
         var _loc7_:String = _loc6_.name;
         var _loc8_:* = _loc4_.userCanTrade > 0;
         var _loc9_:int = _loc4_.otherUserID;
         var _loc10_:IUserData = _loc3_.userDataManager.getUserData(_loc9_);
         if(!_loc10_)
         {
            ErrorReportStorage.addDebugData("IncomingEvent","Trading open - failed to retrieve other user data!");
            return;
         }
         var _loc11_:String = _loc10_.name;
         var _loc12_:* = _loc4_.otherUserCanTrade > 0;
         if(_loc9_ == _loc2_.userId)
         {
            _loc14_ = _loc5_;
            _loc15_ = _loc7_;
            _loc16_ = _loc8_;
            _loc5_ = _loc9_;
            _loc7_ = _loc11_;
            _loc8_ = Boolean(_loc12_);
            _loc9_ = _loc14_;
            _loc11_ = _loc15_;
            _loc12_ = Boolean(_loc16_);
         }
         var _loc13_:TradingModel = this._inventory.tradingModel;
         if(_loc13_)
         {
            _loc13_.startTrading(_loc5_,_loc7_,_loc8_,_loc9_,_loc11_,_loc12_);
         }
      }
      
      private function onMarketplaceCanMakeOfferResult(param1:MarketplaceCanMakeOfferResult) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:MarketplaceCanMakeOfferResultParser = param1.getParser();
         var _loc3_:MarketplaceModel = this._inventory.marketplaceModel;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.proceedOfferMaking(_loc2_.resultCode,_loc2_.tokenCount);
      }
      
      private function onPetInventoryUpdated(param1:PetInventoryUpdatedEvent) : void
      {
         var _loc2_:PetsModel = this._inventory.petsModel;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.requestPetInventory();
      }
      
      public function onBadges(param1:IMessageEvent) : void
      {
         var _loc4_:int = 0;
         var _loc5_:* = null;
         var _loc2_:BadgesParser = (param1 as BadgesEvent).getParser();
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:BadgesModel = this._inventory.badgesModel;
         if(_loc3_ == null)
         {
            return;
         }
         var _loc6_:Array = _loc2_.getAllBadgeIds();
         var _loc7_:Array = _loc2_.getActiveBadgeIds();
         _loc4_ = 0;
         while(_loc4_ < _loc6_.length)
         {
            _loc5_ = _loc6_[_loc4_];
            if(_loc7_.indexOf(_loc5_) == -1)
            {
               _loc3_.updateBadge(_loc5_,false);
            }
            else
            {
               _loc3_.updateBadge(_loc5_,true);
            }
            _loc4_++;
         }
         _loc3_.forceSelection();
         _loc3_.updateView();
         this._inventory.setInventoryCategoryInit(InventoryCategory.const_279);
      }
      
      private function onMarketplaceConfiguration(param1:MarketplaceConfigurationEvent) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:MarketplaceConfigurationParser = param1.getParser();
         var _loc3_:MarketplaceModel = this._inventory.marketplaceModel;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.isEnabled = _loc2_.isEnabled;
         _loc3_.commission = _loc2_.commission;
         _loc3_.tokenBatchPrice = _loc2_.tokenBatchPrice;
         _loc3_.tokenBatchSize = _loc2_.tokenBatchSize;
         _loc3_.offerMinPrice = _loc2_.offerMinPrice;
         _loc3_.offerMaxPrice = _loc2_.offerMaxPrice;
         _loc3_.expirationHours = _loc2_.expirationHours;
         _loc3_.averagePricePeriod = _loc2_.averagePricePeriod;
         this._inventory.setInventoryCategoryInit(InventoryCategory.const_356);
         var _loc4_:FurniModel = this._inventory.furniModel;
         if(_loc4_ != null)
         {
            _loc4_.updateView();
         }
      }
      
      public function onPixelBalance(param1:IMessageEvent) : void
      {
         this._inventory.pixelBalance = (param1 as HabboActivityPointNotificationMessageEvent).amount;
      }
      
      public function onFurniListInsert(param1:IMessageEvent) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc2_:FurniListInsertParser = (param1 as FurniListInsertEvent).getParser();
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:Array = _loc2_.getFurni();
         var _loc4_:FurniModel = this._inventory.furniModel;
         if(_loc4_ == null)
         {
            return;
         }
         if(!_loc4_.isListInited())
         {
            return;
         }
         var _loc7_:int = 0;
         while(_loc7_ < _loc3_.length)
         {
            _loc6_ = FurniData(_loc3_[_loc7_]);
            if(_loc6_.itemType == "S")
            {
               _loc5_ = new FloorItem(_loc6_.stripId,_loc6_.classId,_loc6_.objId,_loc6_.category,_loc6_.isGroupable,_loc6_.isTradeable,_loc6_.isRecyclable,_loc6_.isSellable,_loc6_.stuffData,_loc6_.extra,_loc6_.expiryTime,0,0,0,_loc6_.slotId,_loc6_.songId);
            }
            else
            {
               if(_loc6_.itemType != "I")
               {
                  throw new Error("Unknown inventory item category: \"" + _loc6_.itemType + "\"");
               }
               _loc5_ = new WallItem(_loc6_.stripId,_loc6_.classId,_loc6_.objId,_loc6_.category,_loc6_.isGroupable,_loc6_.isTradeable,_loc6_.isRecyclable,_loc6_.isSellable,_loc6_.stuffData,_loc6_.extra);
            }
            _loc4_.addFurniAsLast(_loc5_);
            _loc7_++;
         }
      }
      
      public function onAvatarEffectAdded(param1:IMessageEvent) : void
      {
         var _loc2_:EffectsModel = this._inventory.effectsModel;
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:AvatarEffectAddedMessageParser = (param1 as AvatarEffectAddedMessageEvent).getParser();
         if(_loc3_ == null)
         {
            return;
         }
         var _loc4_:int = _loc3_.type;
         var _loc5_:int = _loc3_.duration;
         var _loc6_:Effect = new Effect();
         _loc6_.type = _loc4_;
         _loc6_.duration = _loc5_;
         _loc6_.secondsLeft = _loc5_;
         _loc2_.addEffect(_loc6_);
         this._inventory.notifyChangedEffects();
      }
      
      private function onMarketplaceMakeOfferResult(param1:MarketplaceMakeOfferResult) : void
      {
         if(param1 == null)
         {
            return;
         }
         var _loc2_:MarketplaceMakeOfferResultParser = param1.getParser();
         var _loc3_:MarketplaceModel = this._inventory.marketplaceModel;
         if(_loc3_ == null)
         {
            return;
         }
         _loc3_.endOfferMaking(_loc2_.result);
      }
      
      private function onNotEnoughCredits(param1:NotEnoughBalanceMessageEvent) : void
      {
         if(!param1 || !this._inventory)
         {
            return;
         }
         var _loc2_:MarketplaceModel = this._inventory.marketplaceModel;
         if(_loc2_ == null)
         {
            return;
         }
         _loc2_.onNotEnoughCredits();
      }
      
      public function onFurniList(param1:IMessageEvent) : void
      {
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc14_:int = 0;
         var _loc2_:FurniListParser = (param1 as FurniListEvent).getParser();
         if(_loc2_ == null)
         {
            return;
         }
         var _loc3_:Array = _loc2_.getFurni();
         var _loc4_:FurniModel = this._inventory.furniModel;
         if(_loc4_ == null)
         {
            return;
         }
         this._inventory.setInventoryCategoryInit(InventoryCategory.const_74);
         var _loc7_:Array = new Array();
         var _loc8_:Array = new Array();
         var _loc9_:Array = new Array();
         var _loc10_:Array = new Array();
         _loc4_.getAllStripIds(_loc7_);
         var _loc11_:int = 0;
         while(_loc11_ < _loc3_.length)
         {
            _loc14_ = FurniData(_loc3_[_loc11_]).stripId;
            if(_loc7_.indexOf(_loc14_) != -1)
            {
               _loc9_.push(_loc14_);
            }
            _loc8_.push(_loc14_);
            _loc11_++;
         }
         _loc11_ = 0;
         while(_loc11_ < _loc7_.length)
         {
            if(_loc8_.indexOf(_loc7_[_loc11_]) == -1)
            {
               _loc10_.push(_loc7_[_loc11_]);
            }
            _loc11_++;
         }
         if(_loc7_.length == 0)
         {
            _loc4_.clearFurniList();
         }
         var _loc12_:int = 0;
         while(_loc12_ < _loc3_.length)
         {
            _loc6_ = FurniData(_loc3_[_loc12_]);
            if(_loc9_.indexOf(_loc6_.stripId) == -1)
            {
               if(_loc6_.itemType == "S")
               {
                  _loc5_ = new FloorItem(_loc6_.stripId,_loc6_.classId,_loc6_.objId,_loc6_.category,_loc6_.isGroupable,_loc6_.isTradeable,_loc6_.isRecyclable,_loc6_.isSellable,_loc6_.stuffData,_loc6_.extra,_loc6_.expiryTime,0,0,0,_loc6_.slotId,_loc6_.songId);
               }
               else
               {
                  if(_loc6_.itemType != "I")
                  {
                     throw new Error("Unknown inventory item category: \"" + _loc6_.itemType + "\"");
                  }
                  _loc5_ = new WallItem(_loc6_.stripId,_loc6_.classId,_loc6_.objId,_loc6_.category,_loc6_.isGroupable,_loc6_.isTradeable,_loc6_.isRecyclable,_loc6_.isSellable,_loc6_.stuffData,_loc6_.extra);
               }
               if(_loc7_.length == 0)
               {
                  _loc4_.addFurniAsLast(_loc5_,true);
               }
               else
               {
                  _loc4_.addFurniAt(_loc5_,true,0);
               }
            }
            _loc12_++;
         }
         var _loc13_:int = 0;
         while(_loc13_ < _loc10_.length)
         {
            _loc4_.removeFurni(_loc10_[_loc13_]);
            _loc13_++;
         }
         _loc4_.updateLocks();
         if(_loc4_.getSelectedItemIndex(FurniModel.const_40) == -1)
         {
            _loc4_.toggleItemSelection(FurniModel.const_40,0);
         }
         if(_loc4_.getSelectedItemIndex(FurniModel.const_43) == -1)
         {
            _loc4_.toggleItemSelection(FurniModel.const_43,0);
         }
         _loc4_.initListImages();
         _loc4_.setListInitialized();
      }
   }
}
