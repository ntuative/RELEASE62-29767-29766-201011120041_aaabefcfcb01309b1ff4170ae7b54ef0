package com.sulake.habbo.ui
{
   import com.sulake.habbo.room.object.RoomObjectVariableEnum;
   import com.sulake.habbo.widget.RoomWidgetEnum;
   import com.sulake.habbo.widget.events.RoomWidgetCreditFurniUpdateEvent;
   import com.sulake.habbo.widget.events.RoomWidgetUpdateEvent;
   import com.sulake.habbo.widget.messages.RoomWidgetCreditFurniRedeemMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetFurniToWidgetMessage;
   import com.sulake.habbo.widget.messages.RoomWidgetMessage;
   import com.sulake.room.object.IRoomObject;
   import com.sulake.room.object.IRoomObjectModel;
   import flash.events.Event;
   
   public class FurnitureCreditWidgetHandler implements IRoomWidgetHandler
   {
       
      
      private var _container:IRoomWidgetHandlerContainer = null;
      
      private var var_911:Boolean = false;
      
      public function FurnitureCreditWidgetHandler()
      {
         super();
      }
      
      public function get type() : String
      {
         return RoomWidgetEnum.const_414;
      }
      
      public function get disposed() : Boolean
      {
         return this.var_911;
      }
      
      public function set container(param1:IRoomWidgetHandlerContainer) : void
      {
         this._container = param1;
      }
      
      public function processEvent(param1:Event) : void
      {
         if(this._container != null && this._container.events != null && null != null)
         {
            this._container.events.dispatchEvent(null);
         }
      }
      
      public function getWidgetMessages() : Array
      {
         return [RoomWidgetFurniToWidgetMessage.const_554,RoomWidgetCreditFurniRedeemMessage.const_587];
      }
      
      public function update() : void
      {
      }
      
      public function processWidgetMessage(param1:RoomWidgetMessage) : RoomWidgetUpdateEvent
      {
         var _loc3_:* = null;
         var _loc4_:* = null;
         var _loc5_:* = null;
         var _loc6_:* = null;
         var _loc7_:Number = NaN;
         var _loc8_:* = null;
         var _loc2_:Boolean = this._container.roomSession.isRoomOwner || this._container.sessionDataManager.isAnyRoomController;
         if(!_loc2_)
         {
            return null;
         }
         switch(param1.type)
         {
            case RoomWidgetFurniToWidgetMessage.const_554:
               _loc3_ = param1 as RoomWidgetFurniToWidgetMessage;
               _loc4_ = this._container.roomEngine.getRoomObject(_loc3_.roomId,_loc3_.roomCategory,_loc3_.id,_loc3_.category);
               if(_loc4_ != null)
               {
                  _loc6_ = _loc4_.getModel();
                  if(_loc6_ != null)
                  {
                     _loc7_ = _loc6_.getNumber(RoomObjectVariableEnum.const_990);
                     _loc8_ = new RoomWidgetCreditFurniUpdateEvent(RoomWidgetCreditFurniUpdateEvent.const_675,_loc3_.id,_loc7_);
                     this._container.events.dispatchEvent(_loc8_);
                  }
               }
               break;
            case RoomWidgetCreditFurniRedeemMessage.const_587:
               _loc5_ = param1 as RoomWidgetCreditFurniRedeemMessage;
               if(this._container != null && this._container.roomSession != null)
               {
                  this._container.roomSession.sendCreditFurniRedeemMessage(_loc5_.objectId);
               }
         }
         return null;
      }
      
      public function getProcessedEvents() : Array
      {
         return [];
      }
      
      public function dispose() : void
      {
         this.var_911 = true;
         this._container = null;
      }
   }
}
