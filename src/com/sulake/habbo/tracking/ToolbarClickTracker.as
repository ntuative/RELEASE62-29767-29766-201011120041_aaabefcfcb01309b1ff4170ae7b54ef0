package com.sulake.habbo.tracking
{
   import com.sulake.habbo.configuration.IHabboConfigurationManager;
   
   public class ToolbarClickTracker
   {
       
      
      private var var_1597:Boolean = false;
      
      private var var_1149:IHabboTracking;
      
      private var var_1738:int = 0;
      
      private var var_2440:int = 0;
      
      public function ToolbarClickTracker(param1:IHabboTracking)
      {
         super();
         this.var_1149 = param1;
      }
      
      public function track(param1:String) : void
      {
         if(!this.var_1597)
         {
            return;
         }
         ++this.var_1738;
         if(this.var_1738 <= this.var_2440)
         {
            this.var_1149.track("toolbar",param1);
         }
      }
      
      public function configure(param1:IHabboConfigurationManager) : void
      {
         this.var_1597 = Boolean(parseInt(param1.getKey("toolbar.tracking.enabled","1")));
         this.var_2440 = parseInt(param1.getKey("toolbar.tracking.max.events","100"));
      }
      
      public function dispose() : void
      {
         this.var_1149 = null;
      }
   }
}
