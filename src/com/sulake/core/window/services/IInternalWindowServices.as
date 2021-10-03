package com.sulake.core.window.services
{
   public interface IInternalWindowServices
   {
       
      
      function getMouseListenerService() : IMouseListenerService;
      
      function getGestureAgentService() : IGestureAgentService;
      
      function getMouseScalingService() : IMouseScalingService;
      
      function getMouseDraggingService() : IMouseDraggingService;
      
      function getFocusManagerService() : IFocusManagerService;
      
      function getToolTipAgentService() : IToolTipAgentService;
   }
}
