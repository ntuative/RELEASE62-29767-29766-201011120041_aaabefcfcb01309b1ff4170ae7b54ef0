package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   import flash.utils.getTimer;
   
   public class FramerateTracker
   {
       
      
      private var var_1687:int;
      
      private var var_482:Number;
      
      private var var_1686:int;
      
      private var var_1069:int;
      
      private var var_2371:int;
      
      private var var_2373:Boolean;
      
      private var var_2372:int;
      
      public function FramerateTracker()
      {
         super();
      }
      
      public function trackUpdate(param1:uint, param2:IHabboTracking) : void
      {
         var _loc4_:Number = NaN;
         var _loc5_:Number = NaN;
         ++this.var_1069;
         var _loc3_:int = getTimer();
         if(this.var_1069 == 1)
         {
            this.var_482 = param1;
            this.var_1687 = _loc3_;
         }
         else
         {
            _loc4_ = Number(this.var_1069);
            this.var_482 = this.var_482 * (_loc4_ - 1) / _loc4_ + Number(param1) / _loc4_;
         }
         if(this.var_2373 && _loc3_ - this.var_1687 >= this.var_2372 && this.var_1686 < this.var_2371)
         {
            _loc5_ = 1000 / this.var_482;
            param2.track("performance","averageFramerate",Math.round(_loc5_));
            ++this.var_1686;
            this.var_1687 = _loc3_;
            this.var_1069 = 0;
         }
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_2372 = int(param1.getKey("tracking.framerate.reportInterval.seconds","300")) * 1000;
         this.var_2371 = int(param1.getKey("tracking.framerate.maximumEvents","5"));
         this.var_2373 = true;
      }
      
      public function dispose() : void
      {
      }
   }
}
