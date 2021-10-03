package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.core.utils.debug.GarbageMonitor;
   import com.sulake.habbo.communication.messages.outgoing.tracking.PerformanceLogMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.external.ExternalInterface;
   import flash.system.Capabilities;
   import flash.system.System;
   import flash.utils.getTimer;
   
   public class PerformanceTracker
   {
       
      
      private var var_1734:GarbageMonitor = null;
      
      private var var_1687:int = 0;
      
      private var var_1392:Boolean = false;
      
      private var var_1860:String = "";
      
      private var var_1737:String = "";
      
      private var var_482:Number = 0;
      
      private var var_1735:int = 10;
      
      private var var_2587:Array;
      
      private var var_500:int = 0;
      
      private var var_1733:int = 60;
      
      private var var_1340:int = 0;
      
      private var var_1339:int = 0;
      
      private var var_1859:String = "";
      
      private var var_2439:Number = 0;
      
      private var var_1736:int = 1000;
      
      private var var_2438:Boolean = true;
      
      private var var_2437:Number = 0.15;
      
      private var var_164:IHabboConfigurationManager = null;
      
      private var var_1337:String = "";
      
      private var var_1338:int = 0;
      
      private var _connection:IConnection = null;
      
      public function PerformanceTracker()
      {
         this.var_2587 = [];
         super();
         this.var_1737 = Capabilities.version;
         this.var_1860 = Capabilities.os;
         this.var_1392 = Capabilities.isDebugger;
         this.var_1337 = !true ? ExternalInterface.call("window.navigator.userAgent.toString") : "unknown";
         if(this.var_1337 == null)
         {
            this.var_1337 = "unknown";
         }
         this.var_1734 = new GarbageMonitor();
         this.updateGarbageMonitor();
         this.var_1687 = getTimer();
      }
      
      private function updateGarbageMonitor() : Object
      {
         var _loc2_:* = null;
         var _loc1_:Array = this.var_1734.list;
         if(_loc1_ == null || _loc1_.length == 0)
         {
            _loc2_ = new GarbageTester("tester");
            this.var_1734.insert(_loc2_,"tester");
            return _loc2_;
         }
         return null;
      }
      
      public function dispose() : void
      {
      }
      
      public function get averageUpdateInterval() : int
      {
         return this.var_482;
      }
      
      private function differenceInPercents(param1:Number, param2:Number) : Number
      {
         if(param1 == param2)
         {
            return 0;
         }
         var _loc3_:Number = param1;
         var _loc4_:Number = param2;
         if(param2 > param1)
         {
            _loc3_ = param2;
            _loc4_ = param1;
         }
         return 100 * (1 - _loc4_ / _loc3_);
      }
      
      public function set reportInterval(param1:int) : void
      {
         this.var_1733 = param1;
      }
      
      public function set connection(param1:IConnection) : void
      {
         this._connection = param1;
      }
      
      public function get flashVersion() : String
      {
         return this.var_1737;
      }
      
      public function update(param1:uint) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Boolean = false;
         var _loc6_:Number = NaN;
         var _loc2_:Object = this.updateGarbageMonitor();
         if(_loc2_ != null)
         {
            ++this.var_1339;
            Logger.log("Garbage collection");
         }
         var _loc3_:Boolean = false;
         if(param1 > this.var_1736)
         {
            ++this.var_1340;
            _loc3_ = true;
         }
         else
         {
            ++this.var_500;
            if(this.var_500 <= 1)
            {
               this.var_482 = param1;
            }
            else
            {
               _loc4_ = Number(this.var_500);
               this.var_482 = this.var_482 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
            }
         }
         if(getTimer() - this.var_1687 > this.var_1733 * 1000 && this.var_1338 < this.var_1735)
         {
            Logger.log("*** Performance tracker: average frame rate " + 1000 / this.var_482);
            _loc5_ = true;
            if(this.var_2438 && this.var_1338 > 0)
            {
               _loc6_ = this.differenceInPercents(this.var_2439,this.var_482);
               if(_loc6_ < this.var_2437)
               {
                  _loc5_ = false;
               }
            }
            this.var_1687 = getTimer();
            if(_loc5_ || _loc3_)
            {
               this.var_2439 = this.var_482;
               if(this.sendReport())
               {
                  ++this.var_1338;
               }
            }
         }
      }
      
      public function set reportLimit(param1:int) : void
      {
         this.var_1735 = param1;
      }
      
      public function set slowUpdateLimit(param1:int) : void
      {
         this.var_1736 = param1;
      }
      
      private function sendReport() : Boolean
      {
         var _loc1_:* = null;
         var _loc2_:int = 0;
         var _loc3_:int = 0;
         var _loc4_:int = 0;
         if(this._connection != null)
         {
            _loc1_ = null;
            _loc2_ = getTimer() / 1000;
            _loc3_ = -1;
            _loc4_ = 0;
            _loc1_ = new PerformanceLogMessageComposer(_loc2_,this.var_1337,this.var_1737,this.var_1860,this.var_1859,this.var_1392,_loc4_,_loc3_,this.var_1339,this.var_482,this.var_1340);
            this._connection.send(_loc1_);
            this.var_1339 = 0;
            this.var_482 = 0;
            this.var_500 = 0;
            this.var_1340 = 0;
            return true;
         }
         return false;
      }
      
      public function set configuration(param1:IHabboConfigurationManager) : void
      {
         this.var_164 = param1;
         this.var_1733 = int(this.var_164.getKey("performancetest.interval","60"));
         this.var_1736 = int(this.var_164.getKey("performancetest.slowupdatelimit","1000"));
         this.var_1735 = int(this.var_164.getKey("performancetest.reportlimit","10"));
         this.var_2437 = Number(this.var_164.getKey("performancetest.distribution.deviancelimit.percent","10"));
         this.var_2438 = Boolean(int(this.var_164.getKey("performancetest.distribution.enabled","1")));
      }
   }
}
