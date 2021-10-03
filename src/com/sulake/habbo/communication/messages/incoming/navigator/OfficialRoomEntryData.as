package com.sulake.habbo.communication.messages.incoming.navigator
{
   import com.sulake.core.communication.messages.IMessageDataWrapper;
   import com.sulake.core.runtime.IDisposable;
   
   public class OfficialRoomEntryData implements IDisposable
   {
      
      public static const const_1273:int = 4;
      
      public static const const_778:int = 3;
      
      public static const const_666:int = 2;
      
      public static const const_953:int = 1;
       
      
      private var var_2336:String;
      
      private var _disposed:Boolean;
      
      private var var_1922:int;
      
      private var var_2338:Boolean;
      
      private var var_753:String;
      
      private var var_850:PublicRoomData;
      
      private var var_2334:int;
      
      private var _index:int;
      
      private var var_2337:String;
      
      private var _type:int;
      
      private var var_2021:String;
      
      private var var_851:GuestRoomData;
      
      private var var_2335:String;
      
      private var _open:Boolean;
      
      public function OfficialRoomEntryData(param1:IMessageDataWrapper)
      {
         super();
         this._index = param1.readInteger();
         this.var_2336 = param1.readString();
         this.var_2335 = param1.readString();
         this.var_2338 = param1.readInteger() == 1;
         this.var_2337 = param1.readString();
         this.var_753 = param1.readString();
         this.var_2334 = param1.readInteger();
         this.var_1922 = param1.readInteger();
         this._type = param1.readInteger();
         if(this._type == const_953)
         {
            this.var_2021 = param1.readString();
         }
         else if(this._type == const_778)
         {
            this.var_850 = new PublicRoomData(param1);
         }
         else if(this._type == const_666)
         {
            this.var_851 = new GuestRoomData(param1);
         }
      }
      
      public function get folderId() : int
      {
         return this.var_2334;
      }
      
      public function get popupCaption() : String
      {
         return this.var_2336;
      }
      
      public function get userCount() : int
      {
         return this.var_1922;
      }
      
      public function get open() : Boolean
      {
         return this._open;
      }
      
      public function get showDetails() : Boolean
      {
         return this.var_2338;
      }
      
      public function get maxUsers() : int
      {
         if(this.type == const_953)
         {
            return 0;
         }
         if(this.type == const_666)
         {
            return this.var_851.maxUserCount;
         }
         if(this.type == const_778)
         {
            return this.var_850.maxUsers;
         }
         return 0;
      }
      
      public function get popupDesc() : String
      {
         return this.var_2335;
      }
      
      public function dispose() : void
      {
         if(this._disposed)
         {
            return;
         }
         this._disposed = true;
         if(this.var_851 != null)
         {
            this.var_851.dispose();
            this.var_851 = null;
         }
         if(this.var_850 != null)
         {
            this.var_850.dispose();
            this.var_850 = null;
         }
      }
      
      public function get index() : int
      {
         return this._index;
      }
      
      public function get guestRoomData() : GuestRoomData
      {
         return this.var_851;
      }
      
      public function get disposed() : Boolean
      {
         return this._disposed;
      }
      
      public function get picText() : String
      {
         return this.var_2337;
      }
      
      public function get publicRoomData() : PublicRoomData
      {
         return this.var_850;
      }
      
      public function get picRef() : String
      {
         return this.var_753;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get tag() : String
      {
         return this.var_2021;
      }
      
      public function toggleOpen() : void
      {
         this._open = !this._open;
      }
   }
}
