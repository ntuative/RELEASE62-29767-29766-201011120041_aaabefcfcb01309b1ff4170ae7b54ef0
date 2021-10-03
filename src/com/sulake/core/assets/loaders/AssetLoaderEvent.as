package com.sulake.core.assets.loaders
{
   import flash.events.Event;
   
   public class AssetLoaderEvent extends Event
   {
      
      public static const const_912:String = "AssetLoaderEventUnload";
      
      public static const const_42:String = "AssetLoaderEventError";
      
      public static const const_1080:String = "AssetLoaderEventOpen";
      
      public static const const_928:String = "AssetLoaderEventProgress";
      
      public static const const_1045:String = "AssetLoaderEventStatus";
      
      public static const const_30:String = "AssetLoaderEventComplete";
       
      
      private var var_335:int;
      
      public function AssetLoaderEvent(param1:String, param2:int)
      {
         this.var_335 = param2;
         super(param1,false,false);
      }
      
      public function get status() : int
      {
         return this.var_335;
      }
      
      override public function clone() : Event
      {
         return new AssetLoaderEvent(type,this.var_335);
      }
   }
}
