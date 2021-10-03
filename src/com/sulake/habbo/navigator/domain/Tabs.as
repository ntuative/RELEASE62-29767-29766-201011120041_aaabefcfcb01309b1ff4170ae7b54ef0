package com.sulake.habbo.navigator.domain
{
   import com.sulake.habbo.navigator.HabboNavigator;
   import com.sulake.habbo.navigator.mainview.MainViewCtrl;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.EventsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.MyRoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.OfficialTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.RoomsTabPageDecorator;
   import com.sulake.habbo.navigator.mainview.tabpagedecorators.SearchTabPageDecorator;
   
   public class Tabs
   {
      
      public static const const_633:int = 6;
      
      public static const const_208:int = 5;
      
      public static const const_764:int = 2;
      
      public static const const_313:int = 9;
      
      public static const const_342:int = 4;
      
      public static const const_243:int = 2;
      
      public static const const_612:int = 4;
      
      public static const const_250:int = 8;
      
      public static const const_677:int = 7;
      
      public static const const_254:int = 3;
      
      public static const const_357:int = 1;
      
      public static const const_223:int = 5;
      
      public static const const_523:int = 12;
      
      public static const const_364:int = 1;
      
      public static const const_575:int = 11;
      
      public static const const_740:int = 3;
      
      public static const const_1702:int = 10;
       
      
      private var _navigator:HabboNavigator;
      
      private var var_341:Array;
      
      public function Tabs(param1:HabboNavigator)
      {
         super();
         this._navigator = param1;
         this.var_341 = new Array();
         this.var_341.push(new Tab(this._navigator,const_357,const_523,new EventsTabPageDecorator(this._navigator),MainViewCtrl.const_508));
         this.var_341.push(new Tab(this._navigator,const_243,const_364,new RoomsTabPageDecorator(this._navigator),MainViewCtrl.const_508));
         this.var_341.push(new Tab(this._navigator,const_342,const_575,new OfficialTabPageDecorator(this._navigator),MainViewCtrl.const_952));
         this.var_341.push(new Tab(this._navigator,const_254,const_208,new MyRoomsTabPageDecorator(this._navigator),MainViewCtrl.const_508));
         this.var_341.push(new Tab(this._navigator,const_223,const_250,new SearchTabPageDecorator(this._navigator),MainViewCtrl.const_753));
         this.setSelectedTab(const_357);
      }
      
      public function getSelected() : Tab
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_341)
         {
            if(_loc1_.selected)
            {
               return _loc1_;
            }
         }
         return null;
      }
      
      public function getTab(param1:int) : Tab
      {
         var _loc2_:* = null;
         for each(_loc2_ in this.var_341)
         {
            if(_loc2_.id == param1)
            {
               return _loc2_;
            }
         }
         return null;
      }
      
      private function clearSelected() : void
      {
         var _loc1_:* = null;
         for each(_loc1_ in this.var_341)
         {
            _loc1_.selected = false;
         }
      }
      
      public function onFrontPage() : Boolean
      {
         return this.getSelected().id == const_342;
      }
      
      public function get tabs() : Array
      {
         return this.var_341;
      }
      
      public function setSelectedTab(param1:int) : void
      {
         this.clearSelected();
         this.getTab(param1).selected = true;
      }
   }
}
