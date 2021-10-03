package com.sulake.habbo.tracking
{
   import com.sulake.core.communication.connection.IConnection;
   import com.sulake.habbo.communication.messages.outgoing.tracking.LagWarningReportMessageComposer;
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.utils.getTimer;
   
   public class LagWarningLogger
   {
       
      
      private var var_1597:Boolean = false;
      
      private var var_1550:int;
      
      private var var_1551:int;
      
      private var var_1002:int;
      
      private var _connection:IConnection;
      
      public function LagWarningLogger()
      {
         super();
      }
      
      public function set connection(param1:IConnection) : void
      {
         this._connection = param1;
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_1597 = Boolean(int(param1.getKey("lagWarningLog.enabled","1")));
         this.var_1551 = int(param1.getKey("lagWarningLog.interval.seconds","10")) * 1000;
      }
      
      public function update() : void
      {
         this.reportWarningsAsNeeded();
      }
      
      public function chatLagDetected() : void
      {
         if(!this.var_1597 || this.var_1551 <= 0)
         {
            return;
         }
         ++this.var_1002;
         this.reportWarningsAsNeeded();
      }
      
      private function reportWarningsAsNeeded() : void
      {
         var _loc2_:* = null;
         if(this.var_1002 == 0 || this._connection == null)
         {
            return;
         }
         var _loc1_:int = getTimer();
         if(this.var_1550 == 0 || _loc1_ - this.var_1550 > this.var_1551)
         {
            _loc2_ = new LagWarningReportMessageComposer(this.var_1002);
            this._connection.send(_loc2_);
            this.var_1550 = _loc1_;
            this.var_1002 = 0;
         }
      }
   }
}
