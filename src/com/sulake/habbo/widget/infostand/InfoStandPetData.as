package com.sulake.habbo.widget.infostand
{
   import com.sulake.habbo.widget.events.RoomWidgetPetInfoUpdateEvent;
   import flash.display.BitmapData;
   
   public class InfoStandPetData
   {
       
      
      private var var_1865:int;
      
      private var var_2197:int;
      
      private var var_2227:int;
      
      private var _type:int;
      
      private var var_1467:int = -1;
      
      private var var_2229:int;
      
      private var _nutrition:int;
      
      private var var_2226:int;
      
      private var _energy:int;
      
      private var var_2153:int;
      
      private var var_2228:int;
      
      private var var_2457:int;
      
      private var var_2225:int;
      
      private var _petRespect:int;
      
      private var _canOwnerBeKicked:Boolean;
      
      private var var_39:BitmapData;
      
      private var _ownerName:String;
      
      private var var_2455:Boolean;
      
      private var _name:String = "";
      
      private var var_1921:int;
      
      public function InfoStandPetData()
      {
         super();
      }
      
      public function get isOwnPet() : Boolean
      {
         return this.var_2455;
      }
      
      public function get level() : int
      {
         return this.var_1865;
      }
      
      public function get energy() : int
      {
         return this._energy;
      }
      
      public function get nutrition() : int
      {
         return this._nutrition;
      }
      
      public function get name() : String
      {
         return this._name;
      }
      
      public function get experienceMax() : int
      {
         return this.var_2226;
      }
      
      public function get id() : int
      {
         return this.var_1467;
      }
      
      public function get nutritionMax() : int
      {
         return this.var_2227;
      }
      
      public function get ownerId() : int
      {
         return this.var_1921;
      }
      
      public function setData(param1:RoomWidgetPetInfoUpdateEvent) : void
      {
         this._name = param1.name;
         this.var_1467 = param1.id;
         this._type = param1.petType;
         this.var_2153 = param1.petRace;
         this.var_39 = param1.image;
         this.var_2455 = param1.isOwnPet;
         this.var_1921 = param1.ownerId;
         this._ownerName = param1.ownerName;
         this._canOwnerBeKicked = param1.canOwnerBeKicked;
         this.var_1865 = param1.level;
         this.var_2229 = param1.levelMax;
         this.var_2197 = param1.experience;
         this.var_2226 = param1.experienceMax;
         this._energy = param1.energy;
         this.var_2228 = param1.energyMax;
         this._nutrition = param1.nutrition;
         this.var_2227 = param1.nutritionMax;
         this._petRespect = param1.petRespect;
         this.var_2457 = param1.roomIndex;
         this.var_2225 = param1.age;
      }
      
      public function get roomIndex() : int
      {
         return this.var_2457;
      }
      
      public function get type() : int
      {
         return this._type;
      }
      
      public function get energyMax() : int
      {
         return this.var_2228;
      }
      
      public function get levelMax() : int
      {
         return this.var_2229;
      }
      
      public function get petRespect() : int
      {
         return this._petRespect;
      }
      
      public function get race() : int
      {
         return this.var_2153;
      }
      
      public function get image() : BitmapData
      {
         return this.var_39;
      }
      
      public function get ownerName() : String
      {
         return this._ownerName;
      }
      
      public function get canOwnerBeKicked() : Boolean
      {
         return this._canOwnerBeKicked;
      }
      
      public function get experience() : int
      {
         return this.var_2197;
      }
      
      public function get age() : int
      {
         return this.var_2225;
      }
   }
}
