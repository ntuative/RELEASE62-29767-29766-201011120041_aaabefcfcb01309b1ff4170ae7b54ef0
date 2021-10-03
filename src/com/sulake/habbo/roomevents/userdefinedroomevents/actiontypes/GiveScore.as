package com.sulake.habbo.roomevents.userdefinedroomevents.actiontypes
{
   import com.sulake.core.window.IWindowContainer;
   import com.sulake.habbo.communication.messages.incoming.userdefinedroomevents.Triggerable;
   import com.sulake.habbo.roomevents.HabboUserDefinedRoomEvents;
   import com.sulake.habbo.roomevents.userdefinedroomevents.common.SliderWindowController;
   import flash.events.Event;
   
   public class GiveScore implements ActionType
   {
       
      
      private var var_917:SliderWindowController;
      
      private var var_85:HabboUserDefinedRoomEvents;
      
      private var var_1064:SliderWindowController;
      
      public function GiveScore()
      {
         super();
      }
      
      public function get hasStateSnapshot() : Boolean
      {
         return false;
      }
      
      public function get hasSpecialInputs() : Boolean
      {
         return true;
      }
      
      public function readIntParamsFromForm(param1:IWindowContainer) : Array
      {
         var _loc2_:Array = new Array();
         _loc2_.push(this.var_917.getValue());
         _loc2_.push(this.var_1064.getValue());
         return _loc2_;
      }
      
      private function getInput(param1:IWindowContainer) : IWindowContainer
      {
         return param1.findChildByName("slider_container") as IWindowContainer;
      }
      
      public function onInit(param1:IWindowContainer, param2:HabboUserDefinedRoomEvents) : void
      {
         this.var_85 = param2;
         this.var_917 = new SliderWindowController(param2,this.getInput(param1),param2.assets,1,100,1);
         this.var_917.addEventListener(Event.CHANGE,this.onSliderChange);
         this.var_917.setValue(1);
         this.var_1064 = new SliderWindowController(param2,this.getCounterInput(param1),param2.assets,1,10,1);
         this.var_1064.addEventListener(Event.CHANGE,this.onCounterSliderChange);
         this.var_1064.setValue(1);
      }
      
      public function onEditStart(param1:IWindowContainer, param2:Triggerable) : void
      {
         var _loc3_:int = param2.intParams[0];
         var _loc4_:int = param2.intParams[1];
         this.var_917.setValue(_loc3_);
         this.var_1064.setValue(_loc4_);
      }
      
      private function getCounterInput(param1:IWindowContainer) : IWindowContainer
      {
         return param1.findChildByName("counter_slider_container") as IWindowContainer;
      }
      
      public function get allowDelaying() : Boolean
      {
         return false;
      }
      
      private function onCounterSliderChange(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         if(param1.type == Event.CHANGE)
         {
            _loc2_ = param1.target as SliderWindowController;
            if(_loc2_)
            {
               _loc3_ = _loc2_.getValue();
               _loc4_ = int(_loc3_);
               this.var_85.localization.registerParameter("wiredfurni.params.settimesingame","times","" + _loc4_);
            }
         }
      }
      
      public function get requiresFurni() : Boolean
      {
         return false;
      }
      
      public function readStringParamFromForm(param1:IWindowContainer) : String
      {
         return "";
      }
      
      public function get code() : int
      {
         return ActionTypeCodes.var_1812;
      }
      
      private function onSliderChange(param1:Event) : void
      {
         var _loc2_:* = null;
         var _loc3_:Number = NaN;
         var _loc4_:int = 0;
         if(param1.type == Event.CHANGE)
         {
            _loc2_ = param1.target as SliderWindowController;
            if(_loc2_)
            {
               _loc3_ = _loc2_.getValue();
               _loc4_ = int(_loc3_);
               this.var_85.localization.registerParameter("wiredfurni.params.setpoints","points","" + _loc4_);
            }
         }
      }
   }
}
