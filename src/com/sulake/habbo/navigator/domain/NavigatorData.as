package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.communication.messages.incoming.navigator.FlatCategory;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomData;
   import com.sulake.habbo.communication.messages.incoming.navigator.GuestRoomSearchResultData;
   import com.sulake.habbo.communication.messages.incoming.navigator.MsgWithRequestId;
   import com.sulake.habbo.communication.messages.incoming.navigator.OfficialRoomsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PopularRoomTagsData;
   import com.sulake.habbo.communication.messages.incoming.navigator.PublicRoomShortData;
   import com.sulake.habbo.communication.messages.incoming.navigator.RoomEventData;
   import com.sulake.habbo.communication.messages.parser.navigator.FavouritesMessageParser;
   import com.sulake.habbo.communication.messages.parser.room.engine.RoomEntryInfoMessageParser;
   import com.sulake.habbo.navigator.HabboNavigator;
   import flash.utils.Dictionary;
   
   public class NavigatorData
   {
      
      private static const const_1492:int = 10;
       
      
      private var var_1988:Boolean;
      
      private var var_1985:int;
      
      private var var_1202:int;
      
      private var var_1986:Boolean;
      
      private var var_1175:Array;
      
      private var _favouriteIds:Dictionary;
      
      private var var_1201:Array;
      
      private var var_1983:int;
      
      private var var_1984:int;
      
      private var var_1461:int;
      
      private var var_1989:int = 0;
      
      private var var_1876:int;
      
      private var var_1987:int;
      
      private var var_780:PublicRoomShortData;
      
      private var var_519:RoomEventData;
      
      private var var_176:MsgWithRequestId;
      
      private var var_1990:Boolean;
      
      private var _navigator:HabboNavigator;
      
      private var var_1991:Boolean;
      
      private var var_216:GuestRoomData;
      
      private var var_967:Boolean;
      
      private var _currentRoomOwner:Boolean;
      
      public function NavigatorData(param1:HabboNavigator)
      {
         this.var_1175 = new Array();
         this.var_1201 = new Array();
         this._favouriteIds = new Dictionary();
         super();
         this._navigator = param1;
      }
      
      public function get popularTagsArrived() : Boolean
      {
         return this.var_176 != null && this.var_176 as PopularRoomTagsData != null;
      }
      
      public function get adIndex() : int
      {
         return this.var_1989;
      }
      
      public function get eventMod() : Boolean
      {
         return this.var_1991;
      }
      
      public function startLoading() : void
      {
         this.var_967 = true;
      }
      
      public function get createdFlatId() : int
      {
         return this.var_1985;
      }
      
      public function set eventMod(param1:Boolean) : void
      {
         this.var_1991 = param1;
      }
      
      public function set roomEventData(param1:RoomEventData) : void
      {
         if(this.var_519 != null)
         {
            this.var_519.dispose();
         }
         this.var_519 = param1;
      }
      
      public function isRoomFavourite(param1:int) : Boolean
      {
         return this._favouriteIds[param1] != null;
      }
      
      public function get homeRoomId() : int
      {
         return this.var_1461;
      }
      
      public function isLoading() : Boolean
      {
         return this.var_967;
      }
      
      public function get guestRoomSearchArrived() : Boolean
      {
         return this.var_176 != null && this.var_176 as GuestRoomSearchResultData != null;
      }
      
      public function get guestRoomSearchResults() : GuestRoomSearchResultData
      {
         return this.var_176 as GuestRoomSearchResultData;
      }
      
      public function get enteredGuestRoom() : GuestRoomData
      {
         return this.var_216;
      }
      
      public function get allCategories() : Array
      {
         return this.var_1175;
      }
      
      public function onRoomExit() : void
      {
         if(this.var_519 != null)
         {
            this.var_519.dispose();
            this.var_519 = null;
         }
         if(this.var_780 != null)
         {
            this.var_780.dispose();
            this.var_780 = null;
         }
         if(this.var_216 != null)
         {
            this.var_216.dispose();
            this.var_216 = null;
         }
         this._currentRoomOwner = false;
      }
      
      public function set officialRooms(param1:OfficialRoomsData) : void
      {
         this.disposeCurrentMsg();
         this.var_176 = param1;
         this.var_967 = false;
      }
      
      public function set popularTags(param1:PopularRoomTagsData) : void
      {
         this.disposeCurrentMsg();
         this.var_176 = param1;
         this.var_967 = false;
      }
      
      public function onRoomEnter(param1:RoomEntryInfoMessageParser) : void
      {
         this.var_780 = null;
         this.var_216 = null;
         this._currentRoomOwner = false;
         if(param1.guestRoom)
         {
            this._currentRoomOwner = param1.owner;
         }
         else
         {
            this.var_780 = param1.publicSpace;
            this.var_519 = null;
         }
      }
      
      public function get currentRoomOwner() : Boolean
      {
         return this._currentRoomOwner;
      }
      
      public function onFavourites(param1:FavouritesMessageParser) : void
      {
         var _loc2_:int = 0;
         this.var_1983 = param1.limit;
         this.var_1202 = param1.favouriteRoomIds.length;
         this._favouriteIds = new Dictionary();
         for each(_loc2_ in param1.favouriteRoomIds)
         {
            this._favouriteIds[_loc2_] = "yes";
         }
      }
      
      public function get popularTags() : PopularRoomTagsData
      {
         return this.var_176 as PopularRoomTagsData;
      }
      
      public function get settingsReceived() : Boolean
      {
         return this.var_1988;
      }
      
      public function get enteredPublicSpace() : PublicRoomShortData
      {
         return this.var_780;
      }
      
      public function get hotRoomPopupOpen() : Boolean
      {
         return this.var_1986;
      }
      
      public function set guestRoomSearchResults(param1:GuestRoomSearchResultData) : void
      {
         this.disposeCurrentMsg();
         this.var_176 = param1;
         this.var_967 = false;
      }
      
      public function get canEditRoomSettings() : Boolean
      {
         return this.var_216 != null && this._currentRoomOwner;
      }
      
      public function set homeRoomId(param1:int) : void
      {
         this.var_1461 = param1;
      }
      
      public function get visibleCategories() : Array
      {
         return this.var_1201;
      }
      
      public function set categories(param1:Array) : void
      {
         var _loc2_:* = null;
         this.var_1175 = param1;
         this.var_1201 = new Array();
         for each(_loc2_ in this.var_1175)
         {
            if(_loc2_.visible)
            {
               this.var_1201.push(_loc2_);
            }
         }
      }
      
      public function get currentRoomRating() : int
      {
         return this.var_1984;
      }
      
      public function get publicSpaceNodeId() : int
      {
         return this.var_1987;
      }
      
      private function disposeCurrentMsg() : void
      {
         if(this.var_176 == null)
         {
            return;
         }
         this.var_176.dispose();
         this.var_176 = null;
      }
      
      public function set settingsReceived(param1:Boolean) : void
      {
         this.var_1988 = param1;
      }
      
      public function get roomEventData() : RoomEventData
      {
         return this.var_519;
      }
      
      public function favouriteChanged(param1:int, param2:Boolean) : void
      {
         this._favouriteIds[param1] = !!param2 ? "yes" : null;
         this.var_1202 += !!param2 ? 1 : -1;
      }
      
      public function get officialRooms() : OfficialRoomsData
      {
         return this.var_176 as OfficialRoomsData;
      }
      
      public function set avatarId(param1:int) : void
      {
         this.var_1876 = param1;
      }
      
      public function get avatarId() : int
      {
         return this.var_1876;
      }
      
      public function isCurrentRoomFavourite() : Boolean
      {
         var _loc1_:int = this.var_216.flatId;
         return this._favouriteIds[_loc1_] != null;
      }
      
      public function set hotRoomPopupOpen(param1:Boolean) : void
      {
         this.var_1986 = param1;
      }
      
      public function set adIndex(param1:int) : void
      {
         this.var_1989 = param1;
      }
      
      public function set currentRoomRating(param1:int) : void
      {
         this.var_1984 = param1;
      }
      
      public function set hcMember(param1:Boolean) : void
      {
         this.var_1990 = param1;
      }
      
      public function set enteredRoom(param1:GuestRoomData) : void
      {
         if(this.var_216 != null)
         {
            this.var_216.dispose();
         }
         this.var_216 = param1;
      }
      
      public function get officialRoomsArrived() : Boolean
      {
         return this.var_176 != null && this.var_176 as OfficialRoomsData != null;
      }
      
      public function isCurrentRoomHome() : Boolean
      {
         if(this.var_216 == null)
         {
            return false;
         }
         var _loc1_:int = this.var_216.flatId;
         return this.var_1461 == _loc1_;
      }
      
      public function isFavouritesFull() : Boolean
      {
         return this.var_1202 >= this.var_1983;
      }
      
      public function set publicSpaceNodeId(param1:int) : void
      {
         this.var_1987 = param1;
      }
      
      public function get hcMember() : Boolean
      {
         return this.var_1990;
      }
      
      public function get canAddFavourite() : Boolean
      {
         return this.var_216 != null && !this._currentRoomOwner;
      }
      
      public function set createdFlatId(param1:int) : void
      {
         this.var_1985 = param1;
      }
   }
}
