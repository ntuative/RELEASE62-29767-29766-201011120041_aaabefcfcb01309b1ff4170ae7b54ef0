package com.sulake.core.window.services
{
   import com.sulake.core.window.IWindowContext;
   import flash.display.DisplayObject;
   
   public class ServiceManager implements IInternalWindowServices
   {
       
      
      private var var_127:DisplayObject;
      
      private var var_2554:uint;
      
      private var var_929:IToolTipAgentService;
      
      private var var_928:IMouseScalingService;
      
      private var _windowContext:IWindowContext;
      
      private var var_925:IFocusManagerService;
      
      private var var_930:IMouseListenerService;
      
      private var var_927:IGestureAgentService;
      
      private var var_926:IMouseDraggingService;
      
      public function ServiceManager(param1:IWindowContext, param2:DisplayObject)
      {
         super();
         this.var_2554 = 0;
         this.var_127 = param2;
         this._windowContext = param1;
         this.var_926 = new WindowMouseDragger(param2);
         this.var_928 = new WindowMouseScaler(param2);
         this.var_930 = new WindowMouseListener(param2);
         this.var_925 = new FocusManager(param2);
         this.var_929 = new WindowToolTipAgent(param2);
         this.var_927 = new GestureAgentService();
      }
      
      public function getMouseScalingService() : IMouseScalingService
      {
         return this.var_928;
      }
      
      public function getFocusManagerService() : IFocusManagerService
      {
         return this.var_925;
      }
      
      public function getToolTipAgentService() : IToolTipAgentService
      {
         return this.var_929;
      }
      
      public function dispose() : void
      {
         if(this.var_926 != null)
         {
            this.var_926.dispose();
            this.var_926 = null;
         }
         if(this.var_928 != null)
         {
            this.var_928.dispose();
            this.var_928 = null;
         }
         if(this.var_930 != null)
         {
            this.var_930.dispose();
            this.var_930 = null;
         }
         if(this.var_925 != null)
         {
            this.var_925.dispose();
            this.var_925 = null;
         }
         if(this.var_929 != null)
         {
            this.var_929.dispose();
            this.var_929 = null;
         }
         if(this.var_927 != null)
         {
            this.var_927.dispose();
            this.var_927 = null;
         }
         this._windowContext = null;
      }
      
      public function getGestureAgentService() : IGestureAgentService
      {
         return this.var_927;
      }
      
      public function getMouseListenerService() : IMouseListenerService
      {
         return this.var_930;
      }
      
      public function getMouseDraggingService() : IMouseDraggingService
      {
         return this.var_926;
      }
   }
}
