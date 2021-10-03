package com.sulake.core.window.utils.tablet
{
   import com.sulake.core.window.WindowController;
   import com.sulake.core.window.utils.EventProcessorState;
   import com.sulake.core.window.utils.IEventQueue;
   import com.sulake.core.window.utils.MouseEventProcessor;
   
   public class TabletEventProcessor extends MouseEventProcessor
   {
       
      
      private var var_2601:String = "";
      
      public function TabletEventProcessor()
      {
         super();
      }
      
      override public function process(param1:EventProcessorState, param2:IEventQueue) : void
      {
         var_128 = param1.desktop;
         var_77 = param1.var_1125 as WindowController;
         _lastClickTarget = param1.var_1124 as WindowController;
         var_133 = param1.renderer;
         var_738 = param1.var_1127;
         param2.begin();
         param2.end();
         param1.desktop = var_128;
         param1.var_1125 = var_77;
         param1.var_1124 = _lastClickTarget;
         param1.renderer = var_133;
         param1.var_1127 = var_738;
      }
   }
}
