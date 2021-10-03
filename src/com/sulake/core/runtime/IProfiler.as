package com.sulake.core.runtime
{
   import com.sulake.core.utils.profiler.ProfilerAgent;
   
   public interface IProfiler
   {
       
      
      function get numTrackedBitmapDataInstances() : uint;
      
      function get numBitmapAssetInstances() : uint;
      
      function getProfilerAgentsInArray() : Array;
      
      function removeStopEventListener(param1:Function) : void;
      
      function addStopEventListener(param1:Function) : void;
      
      function get numAssetLibraryInstances() : uint;
      
      function get numTrackedBitmapDataBytes() : uint;
      
      function removeStartEventListener(param1:Function) : void;
      
      function get numAllocatedBitmapDataBytes() : uint;
      
      function getProfilerAgentForReceiver(param1:IUpdateReceiver) : ProfilerAgent;
      
      function addStartEventListener(param1:Function) : void;
      
      function gc() : void;
   }
}
